package cn.ustc.ep.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.Servlet;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.jspsmart.upload.Request;
import com.jspsmart.upload.SmartUpload;
import com.jspsmart.upload.SmartUploadException;

import cn.ustc.ep.po.Education;
import cn.ustc.ep.po.Experience;
import cn.ustc.ep.po.Expert;
import cn.ustc.ep.po.Honor;
import cn.ustc.ep.po.User;
import cn.ustc.ep.po.UserExample;
import cn.ustc.ep.service.CompanyService;
import cn.ustc.ep.service.ExpertService;
import cn.ustc.ep.service.MessageService;
import cn.ustc.ep.service.UserService;
import cn.ustc.ep.util.DateFormat;

/**
 * 
 * theme:ExpertController.java description:专家模块的控制器
 * 
 * @author
 * @date 2015-12-10
 */
@Controller
public class ExpertController {

	@Autowired
	private ExpertService expertService;
	@Autowired
	private MessageService messageService;

	@RequestMapping("/initExpertList")
	public ModelAndView initExpertList(HttpServletRequest request)
			throws Exception {
		List<Expert> expertList = expertService.selectExpertList();
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("expertList", expertList);
		modelAndView.setViewName("expert.jsp");

		return modelAndView;
	}
	
	@RequestMapping("/showExpertDetailsByEID")
	public ModelAndView showExpertDetailsByEID(HttpServletRequest request)
			throws Exception {

		String id = request.getParameter("id");

		ModelAndView modelAndView = new ModelAndView();

		Expert expert = new Expert();
		List<Education> educationList = new ArrayList<Education>();
		List<Honor> honorList = new ArrayList<Honor>();
		List<Experience> experienceList = new ArrayList<Experience>();

		expert = expertService.selectExpertById(id);
		educationList = expertService.getExpertEducationById(id);
		honorList = expertService.getExpertHonorById(id);
		experienceList = expertService.getExpertExperienceById(id);

		modelAndView.addObject("expert", expert);
		modelAndView.addObject("educationList", educationList);
		modelAndView.addObject("honorList", honorList);
		modelAndView.addObject("experienceList", experienceList);

		modelAndView.setViewName("expert-details.jsp");

		return modelAndView;
	}
	
	@RequestMapping("/updateExpertResume")
	public ModelAndView updateResume(HttpServletRequest request)
			throws Exception {

		ModelAndView modelAndView = new ModelAndView();

		User user = (User) request.getSession().getAttribute("user");

		return modelAndView;
	}
	
	@RequestMapping("/selectExpertByUsername")
	public ModelAndView selectExpertByUsername(HttpServletRequest request)
			throws Exception {

		String expertName = request.getParameter("expertName");

		ModelAndView modelAndView = new ModelAndView();

		Expert expert = expertService.selectExpertByName(expertName);
		
		System.out.println(expert.getRealname());
		
		modelAndView.addObject("selectExpert", expert);

		modelAndView.setViewName("expert.jsp");

		return modelAndView;
	}
	
	@RequestMapping("/selectExpertById")
	public ModelAndView selectExpertById(HttpServletRequest request)
			throws Exception {

		String id = request.getParameter("id");

		ModelAndView modelAndView = new ModelAndView();

		HttpSession session = request.getSession();

		Expert expert = new Expert();
		List<Education> educationList = new ArrayList<Education>();
		List<Honor> honorList = new ArrayList<Honor>();
		List<Experience> experienceList = new ArrayList<Experience>();

		expert = expertService.selectExpertById(id);
		educationList = expertService.getExpertEducationById(id);
		honorList = expertService.getExpertHonorById(id);
		experienceList = expertService.getExpertExperienceById(id);

		if (expert != null) {
			session.setAttribute("expert", expert);
		} else {
			session.setAttribute("expertMsg", "no related information");
		}

		session.setAttribute("educationList", educationList);
		session.setAttribute("honorList", honorList);
		session.setAttribute("experienceList", experienceList);

		modelAndView.setViewName("expert-profile.jsp");

		return modelAndView;
	}

	@RequestMapping("/selectExpertEducationById")
	public ModelAndView selectExpertEducationById(HttpServletRequest request)
			throws Exception {

		String id = request.getParameter("id");

		ModelAndView modelAndView = new ModelAndView();

		List<Education> educationList = new ArrayList<Education>();
		// educatioinList eduList = expertService.getExpertEducationById(id) ;
		//
		// if(expert != null){
		// request.getSession().setAttribute("expert",expert) ;
		// }else{
		// request.getSession().setAttribute("expertMsg","no related information")
		// ;
		// }
		modelAndView.setViewName("expert-profile.jsp");

		return modelAndView;
	}

	@RequestMapping("/addHonor")
	public void addHonor(HttpServletRequest request,
			HttpServletResponse response) throws IOException, ParseException {
		String id = request.getParameter("id");
		String honor = request.getParameter("honor");
		String honordate = request.getParameter("honordate");
		String honorurl = request.getParameter("honorurl");

		Honor honorObj = new Honor();
		honorObj.seteId(Integer.parseInt(id));
		honorObj.setHonor(honor);
		honorObj.setHonorurl(honorurl);
		honorObj.setHonordate(DateFormat.String2Date(honordate));

		String result = expertService.addHonor(honorObj);
		PrintWriter pw = response.getWriter();
		Gson g = new Gson();
		pw.write(g.toJson(result));
		pw.flush();
		pw.close();

	}

	@RequestMapping("/addEducation")
	public void addEducation(HttpServletRequest request,
			HttpServletResponse response) throws IOException, ParseException {
		String id = request.getParameter("id");
		String fromdate = request.getParameter("fromdate");
		String todate = request.getParameter("todate");
		String school = request.getParameter("school");
		String degree = request.getParameter("degree");

		Education edu = new Education();
		edu.setDegree(degree);
		edu.seteId(Integer.parseInt(id));
		edu.setFromdate(DateFormat.String2Date(fromdate));
		edu.setSchool(school);
		edu.setTodate(DateFormat.String2Date(todate));

		String result = expertService.addEducation(edu);
		System.out.println("!!!!!!!!!!result:" + result);
		PrintWriter pw = response.getWriter();
		Gson g = new Gson();
		pw.write(g.toJson(result));
		pw.flush();
		pw.close();

	}

	@RequestMapping("/addExperience")
	public void addExperience(HttpServletRequest request,
			HttpServletResponse response) throws IOException, ParseException {
		String id = request.getParameter("id");
		String fromdate = request.getParameter("fromdate");
		String todate = request.getParameter("todate");
		String place = request.getParameter("place");
		String jobdescription = request.getParameter("jobdescription");

		Experience ex = new Experience();
		ex.setDescription(jobdescription);
		ex.seteId(Integer.parseInt(id));
		ex.setFromdate(DateFormat.String2Date(fromdate));
		ex.setPlace(place);
		ex.setTodate(DateFormat.String2Date(todate));

		String result = expertService.addExperience(ex);
		PrintWriter pw = response.getWriter();
		Gson g = new Gson();
		pw.write(g.toJson(result));
		pw.flush();
		pw.close();

	}

	@RequestMapping("/insertBasicInfo")
	public void insertBasicInfo(HttpServletRequest request,
			HttpServletResponse response) throws IOException, ParseException {
		String id = request.getParameter("id");

		String gender = request.getParameter("gender");
		String mobile = request.getParameter("mobile");

		String realId = request.getParameter("realId");
		String realname = request.getParameter("realname");
		String country = request.getParameter("country");
		String province = request.getParameter("province");
		String city = request.getParameter("city");
		String field = request.getParameter("field");
		String addition = request.getParameter("addition");

		String location = country + "#" + province + "#" + city;

		Expert expert = new Expert();
		expert.setAccount(0.0);
		expert.setAddition(addition);
		expert.setField(field);
		expert.setGender(gender);
		expert.setId(Integer.parseInt(id));
		expert.setLocation(location);
		expert.setMobile(mobile);
		expert.setRealid(realId);
		expert.setRealname(realname);

		String result = expertService.addBasicInfo(expert);
		PrintWriter pw = response.getWriter();
		Gson g = new Gson();
		pw.write(g.toJson(result));
		pw.flush();
		pw.close();

	}

	@RequestMapping("/uploadFile")
	public void uploadFile(HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		System.out.println("in to !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
		Enumeration<String> params = request.getParameterNames();
		while (params.hasMoreElements()) {
			String object = (String) params.nextElement();
			System.out.println("para name:" + object);
		}
	}

	@RequestMapping("/logout")
	public ModelAndView logout(HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		request.getSession().invalidate();
		request.logout();
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("page-login.jsp");
		return modelAndView;
	}

	@RequestMapping("/saveEduChange")
	public void saveEduChange(HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException,
			ParseException {
		String id = request.getParameter("id");
		String fromdate = request.getParameter("fromdate");
		String todate = request.getParameter("todate");
		String school = request.getParameter("school");
		String degree = request.getParameter("degree");

		Education edu = new Education();
		edu.setDegree(degree);
		edu.setId(Integer.parseInt(id));
		edu.setFromdate(DateFormat.String2Date(fromdate));
		edu.setSchool(school);
		edu.setTodate(DateFormat.String2Date(todate));

		String result = expertService.updateEducation(edu);
		PrintWriter pw = response.getWriter();
		Gson g = new Gson();
		pw.write(g.toJson(result));
		pw.flush();
		pw.close();
	}
	
	@RequestMapping("/saveExpChange")
	public void saveExpChange(HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException,
			ParseException {
		String id = request.getParameter("id");
		String fromdate = request.getParameter("fromdate");
		String todate = request.getParameter("todate");
		String place = request.getParameter("place");
		String jobDescription = request.getParameter("jobDescription");

		Experience ex = new Experience();
		ex.setDescription(jobDescription);
		ex.setId(Integer.parseInt(id));
		ex.setFromdate(DateFormat.String2Date(fromdate));
		ex.setPlace(place);
		ex.setTodate(DateFormat.String2Date(todate));

		String result = expertService.updateExperience(ex);
		PrintWriter pw = response.getWriter();
		Gson g = new Gson();
		pw.write(g.toJson(result));
		pw.flush();
		pw.close();
	}
	
	@RequestMapping("/saveHonorChange")
	public void saveHonorChange(HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException,
			ParseException {
		String id = request.getParameter("id");
		String honor = request.getParameter("honor");
		String honordate = request.getParameter("honorDate");
		String honorurl = request.getParameter("honorURL");

		
		System.out.println("honorDate"+honordate);
		
		Honor honorObj = new Honor();
		honorObj.setId(Integer.parseInt(id));
		honorObj.setHonor(honor);
		honorObj.setHonorurl(honorurl);
		honorObj.setHonordate(DateFormat.String2Date(honordate));

		String result = expertService.updateHonor(honorObj);
		PrintWriter pw = response.getWriter();
		Gson g = new Gson();
		pw.write(g.toJson(result));
		pw.flush();
		pw.close();
	}
	@RequestMapping("/deleteEduById")
	public void deleteEduById(HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException,
			ParseException {

		String id = request.getParameter("id");
		

		Education edu = new Education();
		
		edu.setId(Integer.parseInt(id));
		
		String result = expertService.deleteEducationById(edu);
		PrintWriter pw = response.getWriter();
		Gson g = new Gson();
		pw.write(g.toJson(result));
		pw.flush();
		pw.close();
	}
	
	@RequestMapping("/deleteExpById")
	public void deleteExpById(HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException,
			ParseException {

		String id = request.getParameter("id");
		

		Experience exp = new Experience();
		
		exp.setId(Integer.parseInt(id));
		
		String result = expertService.deleteExperienceById(exp);
		PrintWriter pw = response.getWriter();
		Gson g = new Gson();
		pw.write(g.toJson(result));
		pw.flush();
		pw.close();
	}
	
	@RequestMapping("/deleteHonorById")
	public void deleteHonorById(HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException,
			ParseException {

		String id = request.getParameter("id");
		

		Honor honorObj = new Honor();
		
		honorObj.setId(Integer.parseInt(id));
		
		String result = expertService.deleteHonorById(honorObj);
		PrintWriter pw = response.getWriter();
		Gson g = new Gson();
		pw.write(g.toJson(result));
		pw.flush();
		pw.close();
	}
	
	@RequestMapping("/WeChat_findExpert")
	public ModelAndView WeChat_findExpert(HttpServletRequest request) throws Exception {
		String field = request.getParameter("field");
		String location = request.getParameter("location");
		
		Expert expert = new Expert();
		expert.setField(field);
		expert.setLocation(location);
		
		ArrayList<Expert> list = (ArrayList<Expert>) expertService.WeChat_selectExpertListByCondition(expert);
		
		ModelAndView modelAndView = new ModelAndView();
		request.getSession().setAttribute("seaExpList", list);
		modelAndView.setViewName("company/WeChat_compSearch.jsp");
		
		return modelAndView;
	}
	
	@RequestMapping("/WeChat_viewExpertInfo")
	public ModelAndView WeChat_viewExpertInfo(HttpServletRequest request) throws Exception {
		ModelAndView modelAndView = new ModelAndView();
		String expId = request.getParameter("expId");
		
		Expert expert = expertService.WeChat_selectExpertById(Integer.valueOf(expId));
		request.setAttribute("expert", expert);
		modelAndView.setViewName("expert/WeChat_expertDetail.jsp");
		
		return modelAndView;
	}
	
	@RequestMapping("/WeChat_updateExpertInfo")
	public ModelAndView WeChat_updateCompanyInfo(HttpServletRequest request) throws Exception {
		String expertId = request.getParameter("id");
		String realName = request.getParameter("realName");
		String realId = request.getParameter("realId");
		String gender = request.getParameter("gender");
		String location = request.getParameter("location");
		String mobile = request.getParameter("mobile");
		String field = request.getParameter("field");
		String glory = request.getParameter("glory");
		String gloryUrl = request.getParameter("gloryUrl");
		String addition = request.getParameter("addition");
		
		ModelAndView modelAndView = new ModelAndView();
		Expert expert = new Expert();
		expert.setId(Integer.valueOf(expertId));
		expert.setRealname(realName);
		expert.setRealid(realId);
		expert.setGender(gender);
		expert.setLocation(location);
		expert.setMobile(mobile);
		expert.setField(field);
		expert.setGlory(glory);
		expert.setGloryurl(gloryUrl);
		expert.setAddition(addition);
		
		String result = expertService.WeChat_updateExpert(expert);
		if (result.equals("success")) {
			request.setAttribute("expert", expert);
			request.setAttribute("msg", "信息修改成功！");
			modelAndView.setViewName("expert/WeChat_expertDetail.jsp");
		}
		else {
			modelAndView.setViewName("WeChat_error.jsp");
		}
		
		
		return modelAndView;
	}
	
	@RequestMapping("/WeChat_viewExpertDetail")
	public ModelAndView WeChat_viewExpertDetail(HttpServletRequest request) throws Exception {
		ModelAndView modelAndView = new ModelAndView();
		String expId = request.getParameter("expId");
		String origin = request.getParameter("origin");
		
		Expert expert = expertService.WeChat_selectExpertById(Integer.valueOf(expId));
		request.setAttribute("expert", expert);
		request.setAttribute("origin", origin);
		modelAndView.setViewName("company/WeChat_expertDetail.jsp");
		
		return modelAndView;
	}
	
	@RequestMapping("/WeChat_viewExpertApplyList")
	public ModelAndView WeChat_viewExpertApplyList(HttpServletRequest request) throws Exception {
		ModelAndView modelAndView = new ModelAndView();
		String proId = request.getParameter("proId");
		
		List<Expert> expList = expertService.WeChat_selectExpertApplyListBypid(proId);
		request.setAttribute("expList", expList);
		request.getSession().setAttribute("curProId", proId);
		modelAndView.setViewName("company/WeChat_expApplyList.jsp");
		
		return modelAndView;
	}
}
