package cn.ustc.ep.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import cn.ustc.ep.mobilePo.MobileProject;
import cn.ustc.ep.mobilePo.ReturnMobileProject;
import cn.ustc.ep.po.Apply;
import cn.ustc.ep.po.Company;
import cn.ustc.ep.po.Project;
import cn.ustc.ep.po.User;
import cn.ustc.ep.service.CompanyService;
import cn.ustc.ep.service.ProjectService;
import cn.ustc.ep.util.DateFormat;
import cn.ustc.ep.util.MobileResult;
import cn.ustc.ep.util.Parameter;

/**
 * 
 * theme:ExpertController.java description:项目模块的控制器
 * 
 * @author chengshuo
 * @date 2015-12-10
 */
@Controller
public class ProjectController {

	@Autowired
	private ProjectService projectService;
	
	@Autowired
	private CompanyService companyService;

	@RequestMapping("/initProjectList")
	public ModelAndView initProjectList(HttpServletRequest request, HttpServletResponse response) throws IOException {

		List<Project> projectlist = projectService.selectProjectList();
		ModelAndView modelAndView = new ModelAndView();

		modelAndView.addObject("projectlist", projectlist);
		modelAndView.setViewName("project-list.jsp");

		return modelAndView;

	}

	@RequestMapping("/postProject")
	public ModelAndView postProject(HttpServletRequest request) throws Exception {

		String id = request.getParameter("id");
		String porjectName = request.getParameter("projectname");
		String content = request.getParameter("content");
		String startDate = request.getParameter("startDate");
		String finishDate = request.getParameter("finishDate");
		String budgetStr = request.getParameter("budget");

		System.out.println("budgetStr:" + budgetStr);

		Project project = new Project();
		project.setcId(Integer.parseInt(id));
		project.setName(porjectName);
		project.setContent(content);
		project.seteId(Parameter.NOEXPERT);
		project.setStartdate(DateFormat.String2Date(startDate));
		project.setDeadline(DateFormat.String2Date(finishDate));
		project.setBudget(Double.parseDouble(budgetStr));
		project.setProcess("4");
		project.setCurrent(Parameter.PUBLISH);
		project.setPublicdate(new Date());

		String result = projectService.insertProject(project);
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("project", project);
		modelAndView.setViewName("company-profile.jsp");
		return modelAndView;
	}

	@RequestMapping("/checkProject")
	public ModelAndView checkProject(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id = request.getParameter("id");

		List<Project> projectList = projectService.selectProjectListByCid(Integer.parseInt(id));

		ModelAndView modelAndView = new ModelAndView();

		request.getSession().setAttribute("projectList", projectList);

		modelAndView.setViewName("company-project-list.jsp");

		return modelAndView;
	}
	
	//new 2016.5.26
	@RequestMapping("/selectProjectDetailInfo")
	public ModelAndView selectProjectDetailInfo(HttpServletRequest request) 
			throws Exception {
		String projectId = request.getParameter("id");
		System.out.println("projectId : " + projectId);
		Project project = projectService.selectProjectById(Integer.parseInt(projectId));
	
		String deadline = DateFormat.Date2String(project.getDeadline());
		String publicDate = DateFormat.Date2String(project.getPublicdate());
		project.setDeadline(DateFormat.String2Date(deadline));
		project.setPublicdate(DateFormat.String2Date(publicDate));
		
		request.setAttribute("project", project);

		ModelAndView modelAndView = new ModelAndView();

		modelAndView.setViewName("project-details.jsp");

		return modelAndView;
	}
	
	//new 2016.5.27
	@RequestMapping("/selectProjectLikeName")
	public ModelAndView selectProjectLikeName(HttpServletRequest request) throws Exception {
		
		String keySearch = request.getParameter("keySearch");
		
		List<Project> projectlist = projectService.selectProjectLikeName(keySearch);
		
		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.addObject("projectlist", projectlist);
		
		modelAndView.setViewName("project-list.jsp");
		
		return modelAndView;
	}
	
	//2016.5.27
	@RequestMapping("/selectProjectLikeField")
	public ModelAndView selectProjectLikeField(HttpServletRequest request) throws Exception {
		
		String field = request.getParameter("keySearch");
		List<Company> companylist = companyService.selectCompanyLikeName(field);
		
		ModelAndView modelAndView = new ModelAndView();
		
		List<Project> projectlist = null;
		List<Integer> idList = new ArrayList<Integer>();
		for (Company company : companylist) {
			idList.add(company.getId());
		}
		projectlist = projectService.selectProjectListByCidList(idList);
		
		modelAndView.addObject("projectlist", projectlist);
		modelAndView.setViewName("project-list.jsp");
		return modelAndView;
	}
	
	
	@RequestMapping("/deleteProject")
	public ModelAndView deleteProject(HttpServletRequest request) throws Exception {
		String projectId = request.getParameter("id");

		String result = projectService.deleteProject(projectId);

		@SuppressWarnings("unchecked")
		List<Project> projectList = (List<Project>) request.getSession().getAttribute("projectList");
		Project deleteProject = null;
		for (Project project : projectList) {
			if (project.getId() == Integer.parseInt(projectId)) {
				deleteProject = project;
			}
		}
		projectList.remove(deleteProject);

		ModelAndView modelAndView = new ModelAndView();

		modelAndView.setViewName("company-project-list.jsp");

		return modelAndView;
	}

	@RequestMapping("/mobile/selectProjectListByDate")
	public void selectProjectByNewDate(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int projectSize = 20;
		List<MobileProject> projects = null;
		
		Map<Integer,Integer> activeUserMap = (Map<Integer, Integer>) request.getSession().getAttribute("activeUserMap");
		if(activeUserMap==null){
			projects = projectService.selectProjectByNewDate(projectSize);
		}else{
		
			User user = (User) request.getSession().getAttribute("user");
			int count = activeUserMap.get(user.getId());
			if(count==0){
				projects = projectService.selectProjectByNewDate(projectSize);
				activeUserMap.put(user.getId(), 1);
			}else{
				projects = projectService.selectProjectByNewDate2(projectSize);
				activeUserMap.put(user.getId(), 2);
			}
		}
		
		
		ReturnMobileProject returnMobileProject = new ReturnMobileProject();
		returnMobileProject.setProjects(projects);

		response.setContentType("application/json;charset=UTF-8");
		PrintWriter pw = response.getWriter();
		Gson gson = new Gson();
		pw.write(gson.toJson(returnMobileProject));

	}

	@RequestMapping("/mobile/selectProjectListByEID")
	public void selectProjectListByEID(HttpServletRequest request, HttpServletResponse response) throws IOException {

		String eIdStr = request.getParameter("eId");
		int eId = Integer.parseInt(eIdStr);

		List<MobileProject> projects = projectService.selectProjectListByEID(eId);
		ReturnMobileProject returnMobileProject = new ReturnMobileProject();
		returnMobileProject.setProjects(projects);

		response.setContentType("application/json;charset=UTF-8");
		PrintWriter pw = response.getWriter();
		Gson gson = new Gson();
		pw.write(gson.toJson(returnMobileProject));

	}

	@RequestMapping("/mobile/selectProjectListByCID")
	public void selectProjectListByCID(HttpServletRequest request, HttpServletResponse response) throws IOException {

		String cIdStr = request.getParameter("cId");
		int cId = Integer.parseInt(cIdStr);

		List<MobileProject> projects = projectService.selectProjectListByCID(cId);
		ReturnMobileProject returnMobileProject = new ReturnMobileProject();
		returnMobileProject.setProjects(projects);

		response.setContentType("application/json;charset=UTF-8");
		PrintWriter pw = response.getWriter();
		Gson gson = new Gson();
		pw.write(gson.toJson(returnMobileProject));

	}

	@RequestMapping("/mobile/insertProject")
	public void insertProject(HttpServletRequest request, HttpServletResponse response) throws Exception {

		//TODO
		String c_idStr = request.getParameter("c_id");
		// String cIdStr = request.getParameter("e_id");
		String name = request.getParameter("name");
		String content = request.getParameter("content");
		String budgetStr = request.getParameter("budget");
		String projectCircle = request.getParameter("projectCircle");
		Date publishDate = new Date();

		int cId = Integer.parseInt(c_idStr);

		Project p = new Project();
		p.seteId(Parameter.NOEXPERT);
		p.setcId(cId);
		p.setName(name);
		p.setContent(content);
		p.setBudget(Double.valueOf(budgetStr));
		p.setProjectcircle(projectCircle);
		p.setChecked(Parameter.UNCHECK);
		p.setConfirm(Parameter.UNCONFIRM);
		p.setCurrent(Parameter.PUBLISH);
		p.setPublicdate(publishDate);
		p.setProcess(Parameter.PROCESS);

		String result = projectService.insertProject(p);

		if (Parameter.SUCCESS.equals(result)) {
			result = Parameter.RETURN_SUCCESS;
		} else {
			result = Parameter.RETURN_FAIL;
		}

		MobileResult mr = new MobileResult();
		mr.setStatus(result);

		Gson gson = new Gson();
		PrintWriter writer = null;

		response.setContentType("application/json;charset=UTF-8");
		writer = response.getWriter();
		writer.write(gson.toJson(mr));

	}

	@RequestMapping("/mobile/selectProjectLikeKey")
	public void selectProjectLikeKey(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String key = request.getParameter("key");

		List<MobileProject> projects = projectService.selectProjectLikeKey(key);

		ReturnMobileProject returnMobileProject = new ReturnMobileProject();
		returnMobileProject.setProjects(projects);

		response.setContentType("application/json;charset=UTF-8");
		PrintWriter pw = response.getWriter();
		Gson gson = new Gson();
		pw.write(gson.toJson(returnMobileProject));
	}

	@RequestMapping("/mobile/updateProjectCurrent")
	public void updateProjectCurrent(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String current = request.getParameter("current");
		String pid = request.getParameter("p_id");

		String result = projectService.updateProjectCurrentById(pid, current);

		MobileResult mr = new MobileResult();
		mr.setStatus(result);
		response.setContentType("application/json;charset=UTF-8");
		PrintWriter pw = response.getWriter();
		Gson gson = new Gson();
		pw.write(gson.toJson(mr));
	}
	
	@RequestMapping("/mobile/updateProjectApply")
	public void updateProjectApply(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String e_id = request.getParameter("e_id");
		String pid = request.getParameter("p_id");
		

		String result = projectService.updateProjectApply(pid, e_id);
		
		
		Project project = projectService.selectProjectById(Integer.parseInt(pid));
		Apply apply = new Apply();
		apply.setcId(project.getcId());
		apply.setApplydate(new Date());
		apply.setDirection(Parameter.DIRECTION_APPLY);
		apply.seteId(Integer.parseInt(e_id));
		apply.setIsAgree(Parameter.NOT_AGREE);
		apply.setpId(project.getId());
		
		
		String resultApply = projectService.insertApply(apply);

		if(Parameter.FAIL.equals(resultApply)){
			result = Parameter.FAIL;
		}
		MobileResult mr = new MobileResult();
		mr.setStatus(result);
		response.setContentType("application/json;charset=UTF-8");
		PrintWriter pw = response.getWriter();
		Gson gson = new Gson();
		pw.write(gson.toJson(mr));
	}

	@RequestMapping("/selectProjectByExpertID")
	public ModelAndView selectProjectByExpertID(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String id = request.getParameter("id");

		List<Project> projectlist = projectService.selectProjectListByEid(Integer.parseInt(id));
		ModelAndView modelAndView = new ModelAndView();

		modelAndView.addObject("projectlist", projectlist);
		modelAndView.setViewName("project-list.jsp");

		return modelAndView;

	}

	@RequestMapping("/WeChat_pubProject")
	public ModelAndView WeChat_pubProject(HttpServletRequest request) throws Exception {
		ModelAndView modelAndView = new ModelAndView();
		String proName = request.getParameter("proName");
		String proContent = request.getParameter("proContent");
		String proProcess = request.getParameter("proProcess");
		String proBudge = request.getParameter("proBudge");
		String deadLine = request.getParameter("deadLine");
		String projectCircle = request.getParameter("projectCircle");
		String proAddition = request.getParameter("proAddition");

		User u = (User) request.getSession().getAttribute("user");

		Project project = new Project();
		project.setcId(u.getId());
		project.seteId(-1);
		project.setName(proName);
		project.setContent(proContent);
		project.setProcess(proProcess);
		project.setBudget(Double.valueOf(proBudge));
		project.setProjectcircle(projectCircle);
		project.setAddition(proAddition);
		project.setCurrent("1");
		project.setPublicdate(
				new SimpleDateFormat("yyyy-MM-dd").parse(new SimpleDateFormat("yyyy-MM-dd").format(new Date())));
		project.setDeadline(new SimpleDateFormat("yyyy-MM-dd").parse(deadLine));

		String result = projectService.WeChat_insertProject(project);
		if (result.equals("success")) {
			request.setAttribute("msg", "\"" + proName + "\"发布成功！");
			modelAndView.setViewName("company/WeChat_pubProject.jsp");
		} else {
			request.setAttribute("msg", "抱歉！项目发布失败！");
			modelAndView.setViewName("company/WeChat_pubProject.jsp");
		}

		return modelAndView;
	}

	@RequestMapping("/WeChat_viewProjectDetail")
	public ModelAndView WeChat_viewProjectDetail(HttpServletRequest request) throws Exception {
		ModelAndView modelAndView = new ModelAndView();
		String role = request.getParameter("role");
		String proId = request.getParameter("proId");
		String circle = request.getParameter("circle");
		String origin = request.getParameter("origin");

		Project project = projectService.WeChat_selectProjectById(Integer.valueOf(proId));
		ArrayList<Project> proList = new ArrayList<Project>();
		proList.add(project);
		request.setAttribute("proList", proList);
		request.setAttribute("circle", circle);
		request.setAttribute("origin", origin);
		if (role.equals("company")) {
			modelAndView.setViewName("company/WeChat_projectDetail.jsp");
		} else if (role.equals("expert")) {
			modelAndView.setViewName("expert/WeChat_projectDetail.jsp");
		}

		return modelAndView;
	}

	@RequestMapping("/WeChat_projectGoingToEnded")
	public ModelAndView WeChat_projectGoingToEnded(HttpServletRequest request) throws Exception {
		ModelAndView modelAndView = new ModelAndView();
		String proId = request.getParameter("proId");

		Project project = new Project();
		project.setId(Integer.valueOf(proId));
		project.setCurrent("2");
		project.setFinishdate(
				new SimpleDateFormat("yyyy-MM-dd").parse(new SimpleDateFormat("yyyy-MM-dd").format(new Date())));
		String result = projectService.WeChat_updateProject(project);

		if (result.equals("success")) {
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
		} else {
			modelAndView.setViewName("WeChat_error.jsp");
		}

		return modelAndView;
	}

	@RequestMapping("/WeChat_projectPublishedToCanceled")
	public ModelAndView WeChat_projectPublishedToCanceled(HttpServletRequest request) throws Exception {
		ModelAndView modelAndView = new ModelAndView();
		String proId = request.getParameter("proId");

		Apply apply = new Apply();
		apply.setpId(Integer.valueOf(proId));
		apply.setDirection("apply");
		apply.setIsAgree("false");
		projectService.WeChat_deleteRedundantApply(apply);

		Project project = new Project();
		project.setId(Integer.valueOf(proId));
		project.setCurrent("3");
		String result = projectService.WeChat_updateProject(project);

		if (result.equals("success")) {
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
		} else {
			modelAndView.setViewName("WeChat_error.jsp");
		}

		return modelAndView;
	}

	@RequestMapping("/WeChat_deleteProject")
	public ModelAndView WeChat_deleteProject(HttpServletRequest request) throws Exception {
		ModelAndView modelAndView = new ModelAndView();
		String proId = request.getParameter("proId");

		String result = projectService.WeChat_deleteProject(Integer.valueOf(proId));

		if (result.equals("success")) {
			User user = (User) request.getSession().getAttribute("user");
			ArrayList<ArrayList<Project>> proList;
			proList = projectService.WeChat_selectProjectListByUser(user);
			if (user.getRole().equals("company")) {
				ArrayList<Project> proList0 = proList.get(0);
				ArrayList<Project> proList1 = proList.get(1);
				ArrayList<Project> proList2 = proList.get(2);
				ArrayList<Project> proList3 = proList.get(3);
				request.setAttribute("proList0", proList0);
				request.setAttribute("proList1", proList1);
				request.setAttribute("proList2", proList2);
				request.setAttribute("proList3", proList3);

				modelAndView.setViewName("company/WeChat_compProject.jsp");
			} else if (user.getRole().equals("expert")) {
				ArrayList<Project> proList0 = proList.get(0);
				ArrayList<Project> proList1 = proList.get(1);
				ArrayList<Project> proList2 = proList.get(2);
				request.setAttribute("proList0", proList0);
				request.setAttribute("proList1", proList1);
				request.setAttribute("proList2", proList2);

				modelAndView.setViewName("expert/WeChat_expProject.jsp");
			}
		} else {
			modelAndView.setViewName("WeChat_error.jsp");
		}

		return modelAndView;
	}

	@RequestMapping("/WeChat_applyProject")
	public ModelAndView WeChat_applyProject(HttpServletRequest request) throws Exception {
		ModelAndView modelAndView = new ModelAndView();

		String proId = request.getParameter("proId");
		User user = (User) request.getSession().getAttribute("user");

		Apply apply = new Apply();
		apply.seteId(user.getId());
		Project project = projectService.WeChat_selectProjectById(Integer.valueOf(proId));
		apply.setcId(project.getcId());
		apply.setpId(Integer.valueOf(proId));
		apply.setDirection("apply");
		apply.setApplydate(
				new SimpleDateFormat("yyyy-MM-dd").parse(new SimpleDateFormat("yyyy-MM-dd").format(new Date())));
		apply.setIsAgree("false");

		String result = projectService.WeChat_insertApply(apply);
		if (result.equals("success")) {
			ArrayList<Project> list = (ArrayList<Project>) request.getSession().getAttribute("seaProList");
			int index = 0;
			for (Project pro : list) {
				if (pro.getId().equals(Integer.valueOf(proId))) {
					index = list.indexOf(pro);
				}
			}
			list.remove(index);

			request.getSession().setAttribute("seaProList", list);
			modelAndView.setViewName("expert/WeChat_expSearch.jsp");
		} else {
			modelAndView.setViewName("WeChat_error.jsp");
		}

		return modelAndView;
	}

	@RequestMapping("/WeChat_cancelApply")
	public ModelAndView WeChat_cancelApply(HttpServletRequest request) throws Exception {
		ModelAndView modelAndView = new ModelAndView();
		String proId = request.getParameter("proId");
		User user = (User) request.getSession().getAttribute("user");

		Apply apply = new Apply();
		apply.setpId(Integer.valueOf(proId));
		apply.seteId(user.getId());
		apply.setDirection("apply");
		apply.setIsAgree("false");
		String result = projectService.WeChat_deleteApply(apply);

		if (result.equals("success")) {
			ArrayList<ArrayList<Project>> proList;
			proList = projectService.WeChat_selectProjectListByUser(user);
			ArrayList<Project> proList0 = proList.get(0);
			ArrayList<Project> proList1 = proList.get(1);
			ArrayList<Project> proList2 = proList.get(2);

			request.setAttribute("proList0", proList0);
			request.setAttribute("proList1", proList1);
			request.setAttribute("proList2", proList2);

			modelAndView.setViewName("expert/WeChat_expProject.jsp");
		} else {
			modelAndView.setViewName("WeChat_error.jsp");
		}

		return modelAndView;
	}

	@RequestMapping("/WeChat_agreeApply")
	public ModelAndView WeChat_agreeApply(HttpServletRequest request) throws Exception {
		ModelAndView modelAndView = new ModelAndView();
		String expId = request.getParameter("expId");
		String proId = (String) request.getSession().getAttribute("curProId");
		User user = (User) request.getSession().getAttribute("user");

		Apply apply = new Apply();
		apply.seteId(Integer.valueOf(expId));
		apply.setpId(Integer.valueOf(proId));
		apply.setDirection("apply");
		apply.setIsAgree("false");

		Project project = new Project();
		project.setId(Integer.valueOf(proId));
		project.seteId(Integer.valueOf(expId));
		project.setCurrent("0");
		project.setStartdate(
				new SimpleDateFormat("yyyy-MM-dd").parse(new SimpleDateFormat("yyyy-MM-dd").format(new Date())));

		String result = projectService.WeChat_agreeApply(apply, project);
		if (result.equals("success")) {
			ArrayList<ArrayList<Project>> proList;
			proList = projectService.WeChat_selectProjectListByUser(user);
			ArrayList<Project> proList0 = proList.get(0);
			ArrayList<Project> proList1 = proList.get(1);
			ArrayList<Project> proList2 = proList.get(2);

			request.setAttribute("proList0", proList0);
			request.setAttribute("proList1", proList1);
			request.setAttribute("proList2", proList2);

			modelAndView.setViewName("company/WeChat_compProject.jsp");
		} else {
			modelAndView.setViewName("WeChat_error.jsp");
		}
		return modelAndView;
	}

	@RequestMapping("/WeChat_findProject")
	public ModelAndView WeChat_findProject(HttpServletRequest request) throws Exception {
		String field = request.getParameter("field");
		String budget = request.getParameter("budget");

		User user = (User) request.getSession().getAttribute("user");
		List<Project> list = projectService.WeChat_selectProjectListByCondition(field, budget, user);

		ModelAndView modelAndView = new ModelAndView();
		request.getSession().setAttribute("seaProList", list);
		modelAndView.setViewName("expert/WeChat_expSearch.jsp");

		return modelAndView;
	}
}
