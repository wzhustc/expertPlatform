package cn.ustc.ep.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import cn.ustc.ep.mobilePo.MobileUser;
import cn.ustc.ep.po.Company;
import cn.ustc.ep.po.Expert;
import cn.ustc.ep.po.Message;
import cn.ustc.ep.po.Project;
import cn.ustc.ep.po.User;
import cn.ustc.ep.service.CompanyService;
import cn.ustc.ep.service.ExpertService;
import cn.ustc.ep.service.MessageService;
import cn.ustc.ep.service.ProjectService;
import cn.ustc.ep.service.UserService;
import cn.ustc.ep.util.Parameter;
import cn.ustc.ep.util.ResultObject;

/**
 * 
 * theme:UserController.java
 * description:用于关于User的控制器
 * @author chengshuo
 * @date 2015-12-10
 */
@Controller
public class UserController {
	
	@Autowired
	private UserService userService ;
	@Autowired
	private ExpertService expertService ;
	@Autowired
	private ProjectService projectService ;
	@Autowired
	private CompanyService companyService ;
	@Autowired
	private MessageService messageService ;
	
	@RequestMapping("/start")
	public ModelAndView start(HttpServletRequest request) throws Exception {

		ModelAndView modelAndView = new ModelAndView();	
		modelAndView.setViewName("/WEB-INF/jsp/user/login.jsp");
		return modelAndView;

	}
	
	@RequestMapping("/initRegister")
	public ModelAndView initRegister(HttpServletRequest request) throws Exception {
		
		ModelAndView modelAndView = new ModelAndView();	
		modelAndView.setViewName("/WEB-INF/jsp/user/register.jsp");
		return modelAndView;

	}
	
	@RequestMapping("/registerUser")
	public ModelAndView insertUser(HttpServletRequest request) throws Exception {

		String username = request.getParameter("username") ;
		String password = request.getParameter("password") ;
		String email = request.getParameter("email") ;
		String role = request.getParameter("role");

		User user = new User() ;
		user.setUsername(username) ;
		user.setPassword(password) ;
		user.setEmail(email) ;
		user.setRole(role) ;	
	
		String result = userService.insertUser(user) ;
		                
		if(result.equals("success")){
			System.out.println("success!");
			user = userService.getUserIdByUser(user) ;
		}else{
			System.out.println("insert fail!");
		}
		
		request.getSession().setAttribute("user", user);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("index.jsp");

		return modelAndView;
	}
	
	@RequestMapping("/mobile/registerUser")
	public void insertUserM(HttpServletRequest request,HttpServletResponse response) throws Exception {

		
		Gson gson = new Gson();
		PrintWriter writer = null ;
		
		response.setContentType("application/json;charset=UTF-8");
		writer = response.getWriter();
		
		String password = request.getParameter("password") ;
		String email = request.getParameter("email") ;
		String role = request.getParameter("role");
		
		System.out.println("role:"+role);
		String username = "user" ;
		if("expert".equals(role)){
			username = "expert_user" ;
		}else{
			username = "company_user" ;
		}
		
		User user = new User() ;
		user.setUsername(username) ;
		user.setPassword(password) ;
		user.setEmail(email) ;
		user.setRole(role) ;	
	
		String result = userService.insertUser(user) ;
		         
		if(result.equals("success")){
			System.out.println("success!");
			user = userService.getUserIdByUser(user) ;
		}else{
			user = null ;
		}
		
		writer.write(gson.toJson(new MobileUser(user)));
		writer.flush();
		writer.close();
		
		
	}
	
	@RequestMapping("/login")
	public ModelAndView selectUser(HttpServletRequest request) throws Exception {
		String email = request.getParameter("email") ;
		String password = request.getParameter("password") ;
		
		request.getSession().removeAttribute("selectExpert") ;
		
		User user = new User() ;
		user.setEmail(email) ;
		user.setPassword(password) ;
	
		ModelAndView modelAndView = new ModelAndView();
		
		user = userService.login(user) ;
		if(user == null){
			modelAndView.setViewName("page-login.jsp");
			request.getSession().setAttribute("msg", "email or password can not pass!") ;
		}else{
			String role = user.getRole() ;
			if("company".equals(role)){
				System.out.println("企业登陆！！！！");
			}else if("expert".equals(role)){
				System.out.println("专家登陆！！！");
			}else{
				System.out.println("用户登陆！！！");
				
			}
			request.getSession().setAttribute("user", user) ;
			
			//以下为查找消息
			int messageCome = messageService.selectCountByReceptAndIsRead(user.getId(),Parameter.UNREAD);
			request.getSession().setAttribute("messageCome", messageCome) ;
			
			modelAndView.setViewName("index.jsp");
		}
		
		return modelAndView;
	}
	
	@RequestMapping("/mobile/login")
	public void selectUserM(HttpServletRequest request,HttpServletResponse response) throws Exception {
		
		Gson gson = new Gson();
		PrintWriter writer = null ;
		response.setContentType("application/json;charset=UTF-8");
		writer = response.getWriter();
		
		String email = request.getParameter("email") ;
		String password = request.getParameter("password") ;
		
		User user = new User() ;
		user.setEmail(email) ;
		user.setPassword(password) ;
	
		user = userService.login(user) ;
		MobileUser mUser = null ;
		
		
		if(user != null){
			String role = user.getRole() ;
			if("company".equals(role)){
				Company company = companyService.selectCompanyById(user.getId()) ;
				mUser = new MobileUser(company,user) ;
			}else if("expert".equals(role)){
				Expert expert = expertService.selectExpertById(""+user.getId()) ;
				mUser = new MobileUser(expert,user) ;
			}
			request.getSession().setAttribute("user", user) ;
			if(request.getSession().getAttribute("activeUserMap") == null){
				Map<Integer,Integer> activeUserMap = new HashMap<Integer,Integer>();
				activeUserMap.put(user.getId(), 0);
				request.getSession().setAttribute("activeUserMap", activeUserMap);
			}else{
				Map<Integer,Integer> activeUserMap = (Map<Integer, Integer>) request.getSession().getAttribute("activeUserMap") ;
				if(activeUserMap.containsKey(user.getId())){
					
				}else{
					activeUserMap.put(user.getId(), 0);
				}
			}
			
		}
		writer.write(gson.toJson(mUser));
		writer.flush();
		writer.close();
		
	}
	
	@RequestMapping("/mobile/updateUser")
	public void updateUserM(HttpServletRequest request,HttpServletResponse response) throws Exception {
		
		Gson gson = new Gson();
		PrintWriter writer = null ;
		ResultObject<MobileUser> roj = new ResultObject<MobileUser>() ;
		roj.setSuccess("0") ;
		response.setContentType("application/json;charset=UTF-8");
		writer = response.getWriter();
		
		String updateUserJson = request.getParameter("updateUser") ;
		System.out.println(updateUserJson);
		MobileUser mUser = gson.fromJson(updateUserJson, MobileUser.class) ;
		
		
		User user = new User() ;
		user.setEmail(mUser.getEmail()) ;
		user.setPassword(mUser.getPassword()) ;
		user.setId(mUser.getUserID()) ;
		user.setUsername(mUser.getUserName()) ;
		String result = "fail" ;
		if("expert".equals(user.getRole())){
			Expert expert = new Expert() ;
			expert.setId(user.getId()) ;
			expert.setLocation(mUser.getLocation()) ;
			expert.setRealname(mUser.getRealName());
			expert.setField(mUser.getField());
			expert.setImage(mUser.getImage());
			result = expertService.updateExpert(expert) ;
		}else{
			Company company = new Company() ;
			company.setId(user.getId()) ;
			company.setLocation(mUser.getLocation()) ;
			company.setRealname(mUser.getRealName());
			company.setField(mUser.getField());
			company.setImage(mUser.getImage());
			result = companyService.updateCompany(company) ;
		}
		
		String resultUser = userService.updateUser(user) ;
		if("success".equals(result) && "success".equals(resultUser)){
			roj.setSuccess("1") ;
		}
		writer.write(gson.toJson(roj));
		writer.flush();
		writer.close();
		
	}
	
	@RequestMapping("/resume")
	public ModelAndView resume(HttpServletRequest request) throws Exception {
		
		ModelAndView modelAndView = new ModelAndView();
		
		HttpSession session = request.getSession() ;
		User user = (User) session.getAttribute("user") ;

		if(user == null){
			System.out.println("没有该用户信息！！！");
		}else{
			modelAndView.setViewName("/WEB-INF/jsp/user/resume.jsp");
		}
		return modelAndView;
	}
	@RequestMapping("/getMessage")
	public ModelAndView getMessage(HttpServletRequest request) throws Exception {
		
		ModelAndView modelAndView = new ModelAndView();
		
		User user = (User) request.getSession().getAttribute("user") ;
		
		List<Message> unReadMessageList = messageService.getUnReadMessageByUserID(user.getId()) ;
		List<Message> isReadMessageList = messageService.getIsReadMessageByUserID(user.getId()) ;
		
		modelAndView.addObject("unReadMessageList", unReadMessageList) ;
		modelAndView.addObject("isReadMessageList", isReadMessageList) ;
		
		modelAndView.setViewName("message.jsp");
		return modelAndView;
	}
	@RequestMapping("mobile/getMessage")
	public void getMobileMessage(HttpServletRequest request,HttpServletResponse response) throws Exception {
		
		String id = request.getParameter("id");
		
		List<Message> unReadMessageList = messageService.getUnReadMessageByUserID(Integer.parseInt(id)) ;
		
		for (Message message : unReadMessageList) {
			if(message.getRecept().equals(message.geteId())){
				message.setRecept("message from company:"+message.getcId());
			}else{
				message.setRecept("message from expert:"+message.geteId());
			}
		}
		
		ResultObject<List<Message>> re = new ResultObject<List<Message>>();
		re.setDataInfo(unReadMessageList);
		
		Gson gson = new Gson();
		PrintWriter writer = response.getWriter();
		writer.write(gson.toJson(re));
		writer.flush();
		writer.close();
		
	}
	@RequestMapping("/deleteMessages")
	public ModelAndView deleteMessages(HttpServletRequest request) throws Exception {
		
		ModelAndView modelAndView = new ModelAndView();
		
		String[] ids = request.getParameterValues("select");
		for (String string : ids) {
			System.out.println(string);
		}
		String result = messageService.deleteMessageByIds(ids);
		if(Parameter.SUCCESS.equals(result)){
			modelAndView.setViewName("getMessage.action");
		}else{
			System.out.println("删除错误！");
		}
		
		return modelAndView;
	}
	
	@RequestMapping("/updateMessageRead")
	public ModelAndView updateMessageRead(HttpServletRequest request) throws Exception {
		
		System.out.println("updateMessageRead");
		
		ModelAndView modelAndView = new ModelAndView();
		
		String[] ids = request.getParameterValues("select");
		for (String string : ids) {
			System.out.println(string);
		}
		String result = messageService.updateMessageReadByIds(ids);
		if(Parameter.SUCCESS.equals(result)){
			modelAndView.setViewName("getMessage.action");
		}else{
			System.out.println("update错误！");
		}
		
		return modelAndView;
	}
	
	/**
	 * Android 端
	 * 
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping("mTest")
	public void loginWithStudent(HttpServletRequest request,
			HttpServletResponse response)  {
		ResultObject<User> queryResult = new ResultObject<User>();
		ResultObject<List<User>> queryResult2 = new ResultObject<List<User>>();
		Gson gson = new Gson();
		PrintWriter writer = null ;
		
		User user = new User() ;
		try {
			response.setContentType("application/json;charset=UTF-8");
			writer = response.getWriter();
			
			String studentName = request.getParameter("username");
			String studentPassword = request.getParameter("password");
			System.out.println("testUser:"+studentName);
			
			user.setEmail(studentName) ;
			user.setPassword(studentPassword) ;
			
			user = userService.login(user) ;
			if(user != null){
				queryResult.setSuccess("1");
				queryResult.setDataInfo(user);
				queryResult.setMsg("login success");
			}else{
				queryResult.setSuccess("0");
				queryResult.setError("the user does not exist.");
				queryResult.setMsg("login fail");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			queryResult.setSuccess("0");
			queryResult.setError("System Exception");
			queryResult.setMsg("login fail");
		}
		System.out.println(gson.toJson(queryResult));
		writer.write(gson.toJson(queryResult));
		writer.flush();
		writer.close();
	}
	
	@RequestMapping("/WeChat_login")
	public ModelAndView WeChat_selectUser(HttpServletRequest request) throws Exception {
		String name = request.getParameter("name");
		String password = request.getParameter("password");
		String role = request.getParameter("role");
		
		request.getSession().removeAttribute("selectExpert");
		
		User user = new User();
		user.setUsername(name);;
		user.setPassword(password);
		user.setRole(role);
	
		ModelAndView modelAndView = new ModelAndView();
		
		user = userService.WeChat_login(user);
		if (user == null) {
			request.setAttribute("msg", "信息错误! 请注册后登录！");
			modelAndView.setViewName("WeChat_index.jsp");
		}
		else {
			role = user.getRole();
			if ("company".equals(role)) {		
				ArrayList<ArrayList<Project>> proList;
				proList = projectService.WeChat_selectProjectListByUser(user);
				ArrayList<Project> proList0 = proList.get(0);
  				ArrayList<Project> proList1 = proList.get(1);
  				ArrayList<Project> proList2 = proList.get(2);
  				ArrayList<Project> proList3 = proList.get(3);
				request.getSession().setAttribute("user", user);
				request.setAttribute("proList0", proList0);
				request.setAttribute("proList1", proList1);
				request.setAttribute("proList2", proList2);
				request.setAttribute("proList3", proList3);
				
				modelAndView.setViewName("company/WeChat_compProject.jsp");
			}
			else if ("expert".equals(role)) {
				ArrayList<ArrayList<Project>> proList;
				proList = projectService.WeChat_selectProjectListByUser(user);
				ArrayList<Project> proList0 = proList.get(0);
  				ArrayList<Project> proList1 = proList.get(1);
  				ArrayList<Project> proList2 = proList.get(2);
  				
				request.getSession().setAttribute("user", user);
				request.setAttribute("proList0", proList0);
				request.setAttribute("proList1", proList1);
				request.setAttribute("proList2", proList2);
				
				modelAndView.setViewName("expert/WeChat_expProject.jsp");
			}
			else {
				modelAndView.setViewName("WeChat_error.jsp");
			}
		}
		
		return modelAndView;
	}
	
	@RequestMapping("/WeChat_logout")
	public ModelAndView WeChat_logout(HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		request.getSession().invalidate();
		request.logout();
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("WeChat_index.jsp");
		return modelAndView;
	}
	
	@RequestMapping("/WeChat_switchPage")
	public ModelAndView WeChat_switchPage(HttpServletRequest request) throws Exception {
		String page = request.getParameter("page");
		ModelAndView modelAndView = new ModelAndView();
		
		if ("companyPageOne".equals(page)) {
			User user = (User) request.getSession().getAttribute("user");
			ArrayList<ArrayList<Project>> proList;
			proList = projectService.WeChat_selectProjectListByUser(user);
			ArrayList<Project> proList0 = proList.get(0);
			ArrayList<Project> proList1 = proList.get(1);
			ArrayList<Project> proList2 = proList.get(2);
			ArrayList<Project> proList3 = proList.get(3);
			request.setAttribute("proList0", proList0);
			request.setAttribute("proList1", proList1);
			request.setAttribute("proList2", proList2);
			request.setAttribute("proList3", proList3);
			
			modelAndView.setViewName("company/WeChat_compProject.jsp");
		}
		else if ("companyPageTwo".equals(page)) {
			modelAndView.setViewName("company/WeChat_compSearch.jsp");
		}
		else if ("companyPageThree".equals(page)) {
			modelAndView.setViewName("company/WeChat_compMessage.jsp");
		}
		else if ("companyPageFour".equals(page)) {
			User user = (User) request.getSession().getAttribute("user");
			Company company = companyService.WeChat_selectCompanyById(user.getId());
			ArrayList<Company> comList = new ArrayList<Company>();
			comList.add(company);
			request.getSession().setAttribute("comList", comList);
			modelAndView.setViewName("company/WeChat_compPersonal.jsp");
		}
		else if ("expertPageOne".equals(page)) {
			User user = (User) request.getSession().getAttribute("user");
			ArrayList<ArrayList<Project>> proList;
			proList = projectService.WeChat_selectProjectListByUser(user);
			ArrayList<Project> proList0 = proList.get(0);
			ArrayList<Project> proList1 = proList.get(1);
			ArrayList<Project> proList2 = proList.get(2);
			
			request.setAttribute("proList0", proList0);
			request.setAttribute("proList1", proList1);
			request.setAttribute("proList2", proList2);
			
			modelAndView.setViewName("expert/WeChat_expProject.jsp");
		}
		else if ("expertPageTwo".equals(page)) {
			modelAndView.setViewName("expert/WeChat_expSearch.jsp");
		}
		else if ("expertPageThree".equals(page)) {
			modelAndView.setViewName("expert/WeChat_expMessage.jsp");
		}
		else if ("expertPageFour".equals(page)) {
			User user = (User) request.getSession().getAttribute("user");
			Expert expert = expertService.WeChat_selectExpertById(user.getId());
			List<Expert> expList = new ArrayList<Expert>();
			expList.add(expert);
			request.getSession().setAttribute("expList", expList);
			modelAndView.setViewName("expert/WeChat_expPersonal.jsp");
		}
		else if ("indexPage".equals(page)) {
			modelAndView.setViewName("WeChat_index.jsp");
		}
		else if ("pubProPage".equals(page)) {
			modelAndView.setViewName("company/WeChat_pubProject.jsp");
		}
		else {
			modelAndView.setViewName("WeChat_error.jsp");
		}
		return modelAndView;
	}
	
	@RequestMapping("/WeChat_initRegister")
	public ModelAndView WeChat_initRegister(HttpServletRequest request) throws Exception {
		
		ModelAndView modelAndView = new ModelAndView();	
		modelAndView.setViewName("WeChat_register.jsp");
		return modelAndView;

	}
	
	@RequestMapping("/WeChat_register")
	public ModelAndView WeChat_insertUser(HttpServletRequest request) throws Exception {
		String role = request.getParameter("role");
		ModelAndView modelAndView = new ModelAndView();
		if ("expert".equals(role)) {
			String userName = request.getParameter("userName");
			String password = request.getParameter("password");
			String email = request.getParameter("email");
			String idNumber = request.getParameter("idNumber");
			String realName = request.getParameter("realName");
			String gender = request.getParameter("gender");
			String mobile = request.getParameter("mobile");
			String location = request.getParameter("location");
			String domain = request.getParameter("domain");
			String glory = request.getParameter("glory");
			String gloryUrl = request.getParameter("gloryUrl");
			String personalInfo = request.getParameter("personalInfo");

			User user = new User();
			user.setUsername(userName);
			user.setPassword(password);
			user.setEmail(email);
			user.setRole("expert");
			
			Expert expert = new Expert();
			
			expert.setRealid(idNumber);
			expert.setRealname(realName);
			expert.setGender(gender);
			expert.setMobile(mobile);
			expert.setLocation(location);
			expert.setField(domain);
			expert.setAddition(personalInfo);
			expert.setImage("Temporary Default");
			expert.setIdimage("Temporary Default");
			expert.setGlory(glory);
			expert.setGloryurl(gloryUrl);
			expert.setAccount((double)0);
			
			String result = userService.WeChat_insertExpert(user, expert);
			if (result.equals("success")) {
				request.setAttribute("msg", "恭喜您！注册成功！");
				modelAndView.setViewName("WeChat_index.jsp");
			}
			else {
				modelAndView.setViewName("WeChat_error.jsp");
			}
		}
		if ("company".equals(role)) {
			String userName = request.getParameter("userName");
			String password = request.getParameter("password");
			String email = request.getParameter("email");
			String companyName = request.getParameter("companyName");
			String businessNum = request.getParameter("businessNum");
			String realName = request.getParameter("realName");
			String mobile = request.getParameter("mobile");
			String location = request.getParameter("location");
			String domain = request.getParameter("domain");
			String companyInfo = request.getParameter("companyInfo");
			
			User user = new User();
			user.setUsername(userName);
			user.setPassword(password);
			user.setEmail(email);
			user.setRole("company");
			
			Company company = new Company();
			company.setCompanyname(companyName);
			company.setCompanyid(businessNum);
			company.setRealname(realName);
			company.setMobile(mobile);
			company.setLocation(location);
			company.setField(domain);
			company.setAddition(companyInfo);
			company.setImage("Temporary Default");
			company.setCompanyimage("Temporary Default");
			company.setAccount((double) 0);
			
			String result = userService.WeChat_insertCompany(user, company);
			if (result.equals("success")) {
				request.setAttribute("msg", "恭喜您！注册成功！");
				modelAndView.setViewName("WeChat_index.jsp");
			}
			else {
				modelAndView.setViewName("WeChat_error.jsp");
			}
		}
		return modelAndView;
	}
}
