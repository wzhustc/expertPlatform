package cn.ustc.ep.controller;

import java.util.List;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import cn.ustc.ep.mobilePo.MobileUser;
import cn.ustc.ep.po.Company;
import cn.ustc.ep.po.Expert;
import cn.ustc.ep.po.Honor;
import cn.ustc.ep.po.Message;
import cn.ustc.ep.po.User;
import cn.ustc.ep.service.CompanyService;
import cn.ustc.ep.service.ExpertService;
import cn.ustc.ep.service.MessageService;
import cn.ustc.ep.service.impl.CompanyServiceImpl;
import cn.ustc.ep.util.DateFormat;
import cn.ustc.ep.util.Parameter;

/**
 * 
 * theme:ExpertController.java
 * description:企业模块的控制器
 * @author chengshuo
 * @date 2015-12-10
 */

@Controller
public class CompanyController {
	

	@Autowired
	private CompanyService companyService ;
	@Autowired
	private ExpertService expertService ;
	@Autowired
	private MessageService messageService;
	

	@RequestMapping("/WeChat_viewCompanyDetail")
	public ModelAndView WeChat_viewCompanyDetail(HttpServletRequest request) throws Exception {
		ModelAndView modelAndView = new ModelAndView();
		String comId = request.getParameter("comId");
		
		Company company = companyService.WeChat_selectCompanyById(Integer.valueOf(comId));
		request.setAttribute("company", company);
		modelAndView.setViewName("company/WeChat_companyDetail.jsp");
		
		return modelAndView;
	}
	
	@RequestMapping("/WeChat_updateCompanyInfo")
	public ModelAndView WeChat_updateCompanyInfo(HttpServletRequest request) throws Exception {
		String companyId = request.getParameter("id");
		String companyName = request.getParameter("companyName");
		String businessNum = request.getParameter("companyid");
		String realName = request.getParameter("realName");
		String mobile = request.getParameter("mobile");
		String location = request.getParameter("location");
		String domain = request.getParameter("field");
		String companyInfo = request.getParameter("addition");
		
		ModelAndView modelAndView = new ModelAndView();
		Company company = new Company();
		company.setId(Integer.valueOf(companyId));
		company.setRealname(realName);
		company.setMobile(mobile);
		company.setLocation(location);
		company.setCompanyname(companyName);
		company.setCompanyid(businessNum);
		company.setField(domain);
		company.setAddition(companyInfo);
		
		String result = companyService.WeChat_updateCompany(company);
		if (result.equals("success")) {
			request.setAttribute("company", company);
			request.setAttribute("msg", "信息修改成功！");
			modelAndView.setViewName("company/WeChat_companyDetail.jsp");
		}
		else {
			modelAndView.setViewName("WeChat_error.jsp");
		}
		
		
		return modelAndView;
	}
	@RequestMapping("/selectCompanyById")
	public ModelAndView selectCompanyById(HttpServletRequest request) throws Exception {
		String companyIdStr = request.getParameter("id") ;
		int companyId = Integer.parseInt(companyIdStr) ;
		
		ModelAndView modelAndView = new ModelAndView();
		
		Company company = companyService.selectCompanyById(companyId) ;

		if(company != null){
			List<Expert> expertRelatedList  = expertService.selectExpertListByCompany(company);
			
			modelAndView.addObject("company", company);
			modelAndView.addObject("expertRelatedList", expertRelatedList);
			modelAndView.setViewName("company-profile.jsp");
		}else{
			modelAndView.setViewName("error.jsp");
		}
		return modelAndView;	
	}
	
	@RequestMapping("/selectCompanyDetailInfo")
	public ModelAndView selectCompanyDetailInfo(HttpServletRequest request) throws Exception {
		String companyIdStr = request.getParameter("id") ;
		int companyId = Integer.parseInt(companyIdStr) ;
		
		ModelAndView modelAndView = new ModelAndView();
		
		Company company = companyService.selectCompanyById(companyId) ;
		modelAndView.addObject("company", company);
		modelAndView.setViewName("company-details.jsp");
		
		return modelAndView;	
	}
	
	@RequestMapping("/initCompanyInfo")
	public ModelAndView initCompanyInfo(HttpServletRequest request) throws Exception {
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/WEB-INF/jsp/company/companyInfo.jsp");
		return modelAndView;	
	}
	
	@RequestMapping("/initCompanyList")
	public ModelAndView initCompanyList(HttpServletRequest request) throws Exception {
		
		List<Company> companyList = companyService.selectCompanyList();
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("companyList", companyList);
		modelAndView.setViewName("company-list.jsp");
		return modelAndView;	
	}
	
	@RequestMapping("/showCompanyList")
	public ModelAndView showCompanyList(HttpServletRequest request) throws Exception {
		
		String pageStr = request.getParameter("page") ;
		if(pageStr==null){
			pageStr = "1" ;
		}
		int page = Integer.parseInt(pageStr) ;
		
		
		List<Company> companyList = companyService.selectCompanyListByPage(page);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("companyList", companyList);
		modelAndView.setViewName("company-list.jsp");
		return modelAndView;	
	}
	@RequestMapping("/selectCompanyLikeName")
	public ModelAndView selectCompanyLikeName(HttpServletRequest request) throws Exception {
		
		String keySearch = request.getParameter("keySearch") ;
		
		List<Company> companyList = companyService.selectCompanyLikeName(keySearch);
		
		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.addObject("companyList", companyList);
		modelAndView.setViewName("company-list.jsp");
		return modelAndView;	
	}
	@RequestMapping("/selectCompanyLikeField")
	public ModelAndView selectCompanyLikeField(HttpServletRequest request) throws Exception {
		
		String keySearch = request.getParameter("keySearch") ;
		System.out.println("keyfield:"+keySearch);
		
		List<Company> companyList = companyService.selectCompanyListByField(keySearch);
		
		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.addObject("companyList", companyList);
		modelAndView.setViewName("company-list.jsp");
		return modelAndView;	
	}
	
	
	@RequestMapping("/messageCompanyToExpert")
	public ModelAndView selectUserM(HttpServletRequest request,HttpServletResponse response) throws Exception {
		
		String eIdStr = request.getParameter("eId");
		String cIdStr = request.getParameter("cId");
		String message = request.getParameter("message");
		
		int eId = Integer.parseInt(eIdStr);
		int cId = Integer.parseInt(cIdStr);
		
		Message messageObj = new Message(); 
		messageObj.setcId(cId);
		messageObj.seteId(eId);
		messageObj.setMessage(message);
		messageObj.setIsRead(Parameter.UNREAD);
		messageObj.setRecept(eIdStr);
		messageObj.setSenddate(new Date());


		messageService.messageCompanyToExpert(messageObj);
        ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.setViewName("initExpertList.action");
		return modelAndView;	
		
	}
	
	@RequestMapping("/updateCompanyInfo")
	public ModelAndView updateCompanyInfo(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String idStr = request.getParameter("id");
		Integer id = Integer.parseInt(idStr);
	
		System.out.println(id);
		String username = request.getParameter("username");
		String realName = request.getParameter("realname");
		String mobile = request.getParameter("mobile");
		String companyid = request.getParameter("companyid"); 
		String companyName = request.getParameter("companyname");
		String field = request.getParameter("field");
		String country = request.getParameter("country");
		String city = request.getParameter("city");
		String street = request.getParameter("street");
		String addition = request.getParameter("addition");
		String location = country +"#" + city + "#" + street;
		
		Company company = new Company();
		company.setId(id);
		
		company.setRealname(realName);
		company.setMobile(mobile);
		company.setCompanyid(companyid);
		company.setCompanyname(companyName);
		company.setField(field);
		company.setLocation(location);
		company.setAddition(addition);
		company.setAccount(0.0);
		
		String result = companyService.updateCompany(company);
		
		//定义一个返回用的modelAndView
		ModelAndView modelAndView = new ModelAndView();
		
		//将company信息放到modelAndView
		modelAndView.addObject("company", company);
		
		//设置返回的页面
		modelAndView.setViewName("/company-profile.jsp");
		
		return modelAndView;
	}
}
