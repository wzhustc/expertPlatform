package cn.ustc.ep.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import cn.ustc.ep.mapper.ApplyMapper;
import cn.ustc.ep.mapper.ProjectMapper;
import cn.ustc.ep.mobilePo.MobileProject;
import cn.ustc.ep.po.Apply;
import cn.ustc.ep.po.ApplyExample;
import cn.ustc.ep.po.Company;
import cn.ustc.ep.po.Project;
import cn.ustc.ep.po.ProjectExample;
import cn.ustc.ep.po.ProjectExample.Criteria;
import cn.ustc.ep.po.User;
import cn.ustc.ep.service.CompanyService;
import cn.ustc.ep.service.ProjectService;
import cn.ustc.ep.util.Parameter;

public class ProjectServiceImpl implements ProjectService {
	
	@Autowired
	ProjectMapper projectMapper;
	@Autowired
	private ApplyMapper applyMapper;
	@Autowired
	private CompanyService companyService;
	
	

	////通过project的id查询project
	@Override
	public Project selectProjectById(Integer id) throws Exception {

		Project project = projectMapper.selectByPrimaryKey(id);
		return project;
	}

	//通过project的name查询project
	@Override
	public Project selectProjectByName(String name) throws Exception {
		ProjectExample projectExample = new ProjectExample();
		projectExample.createCriteria().andAdditionEqualTo(name);
		
		Project returnProject = new Project();
		List<Project> project = projectMapper.selectByExample(projectExample);
		
		if (project.size() > 0) {
			returnProject =  project.get(0);
		} else {
			returnProject = null;
		}
		return returnProject;
	}
	
	//通过project的专家id来查找project
	@Override
	public List<Project> selectProjectListByEid(Integer expertId) throws Exception {

		ProjectExample projectExample = new ProjectExample();
		projectExample.createCriteria().andEIdEqualTo(expertId);
		
		List<Project> projectList = projectMapper.selectByExample(projectExample);
		
		return projectList;
	}

	//通过project的公司id来查找project
	@Override
	public List<Project> selectProjectListByCid(Integer companyId) throws Exception {

		ProjectExample projectExample = new ProjectExample();
		projectExample.createCriteria().andCIdEqualTo(companyId);
		
		List<Project> projectList = projectMapper.selectByExample(projectExample);
		
		return projectList;
	}
	
	@Override
	public List<Project> selectProjectListByCidList(List<Integer> idList) throws Exception {

		ProjectExample projectExample = new ProjectExample();
		projectExample.createCriteria().andCIdIn(idList);
		
		List<Project> projectList = projectMapper.selectByExample(projectExample);
		
		return projectList;
	}

	//通过预算查找project
	@Override
	public List<Project> selectProjectByBudget(Double minBudget, Double maxBudget) throws Exception {

		ProjectExample projectExample = new ProjectExample();
		projectExample.createCriteria().andBudgetBetween(minBudget, maxBudget);
		List<Project> projectList = projectMapper.selectByExample(projectExample);
		return projectList;
	}

	//通过project的合同id来查找project
	@Override
	public Project selectProjectByContractId(String contractid) throws Exception {

		ProjectExample projectExample = new ProjectExample();
		projectExample.createCriteria().andContractidEqualTo(contractid);
		//用于接收返回参数
		Project project = new Project();
		
		List<Project> projectList = projectMapper.selectByExample(projectExample);
		
		//判断list的大小是否>0,如果大于，取第一个元素赋给project，否则返回null
		if (projectList.size() > 0) {
			project = projectList.get(0);
		} else {
			project = null;
		}
		return project;
	}

	//通过project的name查询project list
	@Override
	public List<Project> selectProjectListByName(String name) throws Exception {

		ProjectExample projectExample = new ProjectExample();
		projectExample.createCriteria().andNameLike(name);
		
		List<Project> projectList = projectMapper.selectByExample(projectExample);
		
		return projectList;
	}

	//通过Project的时间来查询Project list
	@Override
	public List<Project> selectProjectListByDate(Date startdate, Date deadline) throws Exception {
		
		ProjectExample projectExample = new ProjectExample();
		projectExample.createCriteria().andDeadlineBetween(startdate, deadline);
		
		List<Project> projectList = projectMapper.selectByExample(projectExample);
		
		return projectList;
	}
	//返回所有Project list
	@Override
	public List<Project> selectProjectList() {
		ProjectExample projectExample = new ProjectExample();
		
		List<Project> projectList = projectMapper.selectByExample(projectExample);
		
		return projectList;
	}

	//更新Project信息
	@Override
	public String updateProject(Project record) throws Exception {
		
		int resultInt = projectMapper.updateByPrimaryKey(record);
		String result = "fail";
		//如果update返回的是1，则表示更新成功
		if (resultInt == 1) {
			result = "success";
		} 
		return result;
	}

	//插入Project信息
	@Override
	public String insertProject(Project record) throws Exception {
		//insert（插入一条数据）和insertSelect（插入一条数据，但只插入不为null的字段）
		int resultInt = projectMapper.insertSelective(record);
		String result = "fail";
		//如果update返回的是1，则表示插入成功
		if (resultInt == 1) {
			result = "success";
		}
		return result;
	}

	//删除Project信息
	@Override
	public String deleteProject(Project record) throws Exception {
		
		int resultInt = projectMapper.deleteByPrimaryKey(record.getId());
		String result = "fail";
		
	if (resultInt == 1) {
			result = "success";
		}
		return result;
	}
	@Override
	public String deleteProject(String projectId) {
		
		int resultInt = projectMapper.deleteByPrimaryKey(Integer.parseInt(projectId));
		String result = "fail";
		if (resultInt == 1) {
			result = "success";
		}
		return result;
	}

	//项目的审核情况
	@Override
	public String checkProject(Project record) throws Exception {
		ProjectExample projectExample = new ProjectExample();
		projectExample.createCriteria().andCheckedEqualTo(record.getChecked());
		int resultInt = projectMapper.updateByExample(record, projectExample);
		String result = "fail";
		
		if (resultInt == 1) {
			result = "success";
		}
		return result;
	}

	@Override
	public List<MobileProject> selectProjectByNewDate(int projectSize) {
		List<MobileProject> projectList = projectMapper.selectProjectByNewDate(projectSize) ;
		return projectList;
	}

	@Override
	public List<MobileProject> selectProjectByNewDate2(int projectSize) {
		List<MobileProject> projectList = projectMapper.selectProjectByNewDate2(projectSize) ;
		return projectList;
	}
	
	@Override
	public List<MobileProject> selectProjectListByEID(int eId) {
		List<MobileProject> projectList = projectMapper.selectProjectListByEID(eId) ;
		return projectList;
	}

	@Override
	public List<MobileProject> selectProjectListByCID(int cId) {
		List<MobileProject> projectList = projectMapper.selectProjectListByCID(cId) ;
		return projectList;
	}

	@Override
	public List<MobileProject> selectProjectLikeKey(String key) {
		
		List<MobileProject> projectList = projectMapper.selectProjectLikeKey("%"+key+"%") ;
		return projectList;
	}

	@Override
	public String updateProjectCurrentById(String pid, String current) {
		Project pe = new Project();
		pe.setCurrent(current);
		pe.setId(Integer.parseInt(pid));
		int row = projectMapper.updateByPrimaryKeySelective(pe);
		String result = Parameter.RETURN_FAIL;
		if(row>=1){
			result = Parameter.RETURN_SUCCESS;
		}else{
			result = Parameter.RETURN_FAIL;
		}
		return result;
	}
	@Override
	public String WeChat_updateProject(Project record) throws Exception {
		int line = projectMapper.updateByPrimaryKeySelective(record);
		String result = "fail" ;
		if (line == 1) {
			result = "success";
		}
		else {
			result = "fail" ;
		}
		return result;
	}

	@Override
	public String WeChat_insertProject(Project record) throws Exception {
		int row = projectMapper.insertSelective(record);
		String result = "fail";
		if (row == 1) {
			result = "success";
		}
		else {
			result = "fail";
		}
		return result;
	}
	
	@Override
	public String WeChat_insertApply(Apply record) throws Exception {
		int row = applyMapper.insertSelective(record);
		String result = "fail";
		if (row == 1) {
			result = "success";
		}
		else {
			result = "fail";
		}
		return result;
	}	
	
	@Override
	public String WeChat_deleteApply(Apply record) throws Exception {
		ApplyExample ae = new ApplyExample();
		ae.createCriteria().andEIdEqualTo(record.geteId()).andPIdEqualTo(record.getpId())
		.andDirectionEqualTo(record.getDirection()).andIsAgreeEqualTo(record.getIsAgree());
		int row = applyMapper.deleteByExample(ae);
		String result = "fail";
		if (row == 1) {
			result = "success";
		}
		else {
			result = "fail";
		}
		return result;
	}
	
	@Override
	public String WeChat_deleteRedundantApply(Apply apply) throws Exception {
		ApplyExample ae = new ApplyExample();
		ae.createCriteria().andPIdEqualTo(apply.getpId())
		.andDirectionEqualTo(apply.getDirection()).andIsAgreeEqualTo(apply.getIsAgree());
		int row = applyMapper.deleteByExample(ae);
		String result = "fail";
		if (row >= 0) {
			result = "success";
		}
		else {
			result = "fail";
		}
		return result;
	}
	
	@Override
	public String WeChat_agreeApply(Apply apply, Project project) throws Exception {
		ApplyExample ae1 = new ApplyExample();
		ae1.createCriteria().andEIdEqualTo(apply.geteId()).andPIdEqualTo(apply.getpId()).andDirectionEqualTo(apply.getDirection()).andIsAgreeEqualTo(apply.getIsAgree());
		List<Apply> selectApply = applyMapper.selectByExample(ae1);
		selectApply.get(0).setIsAgree("true");
		int row1 = applyMapper.updateByPrimaryKeySelective(selectApply.get(0));
		
		ApplyExample ae2 = new ApplyExample();
		ae2.createCriteria().andPIdEqualTo(apply.getpId()).andDirectionEqualTo(apply.getDirection()).andIsAgreeEqualTo(apply.getIsAgree());
		int row2 = applyMapper.deleteByExample(ae2);
		
		String result = "fail";
		if (row1 == 1 && row2 >= 0) {
			int row3 = projectMapper.updateByPrimaryKeySelective(project);
			if (row3 == 1) {
				result = "success";
			}
			else {
				result = "fail";
			}
		}
		else {
			result = "fail";
		}
		return result;
	}	

	@Override
	public ArrayList<ArrayList<Project>> WeChat_selectProjectListByUser(User record) throws Exception {
		ArrayList<ArrayList<Project>> list = new ArrayList<ArrayList<Project>>();
		
		if (record.getRole().equals("company")) {
			ProjectExample pe1 = new ProjectExample();
			Criteria criteria = pe1.createCriteria();
			criteria.andCIdEqualTo(record.getId());
			criteria.andCurrentEqualTo("0");

			ArrayList<Project> proGoingList = (ArrayList<Project>) projectMapper.selectByExample(pe1);
			list.add(proGoingList);
		
			ProjectExample pe2 = new ProjectExample();
			criteria = pe2.createCriteria();
			criteria.andCIdEqualTo(record.getId());
			criteria.andCurrentEqualTo("1");

			ArrayList<Project> proPublishedList = (ArrayList<Project>) projectMapper.selectByExample(pe2);
			list.add(proPublishedList);
		
			ProjectExample pe3 = new ProjectExample();
			criteria = pe3.createCriteria();
			criteria.andCIdEqualTo(record.getId());
			criteria.andCurrentEqualTo("2");

			ArrayList<Project> proEndedList = (ArrayList<Project>) projectMapper.selectByExample(pe3);
			list.add(proEndedList);
		
			ProjectExample pe4 = new ProjectExample();
			criteria = pe4.createCriteria();
			criteria.andCIdEqualTo(record.getId());
			criteria.andCurrentEqualTo("3");

			ArrayList<Project> proCanceledList = (ArrayList<Project>) projectMapper.selectByExample(pe4);
			list.add(proCanceledList);
		}
		else if (record.getRole().equals("expert")) {
			ArrayList<Integer> idList = new ArrayList<Integer>();
			ProjectExample pe1 = new ProjectExample();
			Criteria criteria = pe1.createCriteria();
			criteria.andEIdEqualTo(record.getId());
			criteria.andCurrentEqualTo("0");

			ArrayList<Project> proGoingList = (ArrayList<Project>) projectMapper.selectByExample(pe1);
			list.add(proGoingList);
		
			ProjectExample pe2 = new ProjectExample();
			criteria = pe2.createCriteria();
			ApplyExample ae = new ApplyExample();
			ae.createCriteria().andEIdEqualTo(record.getId()).andDirectionEqualTo("apply").andIsAgreeEqualTo("false");
			List<Apply> applyList = applyMapper.selectByExample(ae);
			if (applyList.isEmpty() == false) {
				for (Apply a : applyList) {
					idList.add(a.getpId());
				}
				criteria.andIdIn(idList);
			}
			else {
				criteria.andIdEqualTo(-1);
			}
			criteria.andCurrentEqualTo("1");

			ArrayList<Project> proPublishedList = (ArrayList<Project>) projectMapper.selectByExample(pe2);
			list.add(proPublishedList);
		
			ProjectExample pe3 = new ProjectExample();
			criteria = pe3.createCriteria();
			criteria.andEIdEqualTo(record.getId());
			criteria.andCurrentEqualTo("2");

			ArrayList<Project> proEndedList = (ArrayList<Project>) projectMapper.selectByExample(pe3);
			list.add(proEndedList);
		}
		return list;
	}
	@Override
	public String WeChat_deleteProject(Integer id) throws Exception {
		int row = projectMapper.deleteByPrimaryKey(id);
		String result = "fail";
		if (row == 1) {
			result = "success";
		}
		else {
			result = "fail";
		}
		return result;
	}

	@Override
	public Project WeChat_selectProjectById(Integer id) throws Exception {
		Project project = projectMapper.selectByPrimaryKey(id);
		return project;
	}
	
	@Override
	public List<Project> WeChat_selectProjectListByCondition(String field, String budget, User user) throws Exception {
		
		List<Company> compList = companyService.WeChat_selectCompanyByField(field);
		ArrayList<Integer> idList = new ArrayList<Integer>();
		ArrayList<Integer> pidList = new ArrayList<Integer>();
		
		ProjectExample pe = new ProjectExample();
		Criteria criteria = pe.createCriteria();
		if (compList.isEmpty() == false) {
			for (Company c : compList) {
				idList.add(c.getId());
			}
			criteria.andCIdIn(idList);
		}
		else {
			criteria.andCIdEqualTo(-1);
		}
		criteria.andCurrentEqualTo("1");
		if (budget.equals("notLimit")) {
		}
		else if (budget.equals("lt")) {
			criteria.andBudgetLessThan(10000.0);
		}
		else if (budget.equals("bt")) {
			criteria.andBudgetBetween(10000.0, 100000.0);
		}
		else if (budget.equals("gt")) {
			criteria.andBudgetGreaterThan(100000.0);
		}
		
		ApplyExample ae = new ApplyExample();
		ae.createCriteria().andEIdEqualTo(user.getId()).andDirectionEqualTo("apply").andIsAgreeEqualTo("false");
		List<Apply> applyList = applyMapper.selectByExample(ae);
		if (applyList.isEmpty() == false) {
			for (Apply a : applyList) {
				pidList.add(a.getpId());
			}
			criteria.andIdNotIn(pidList);
		}
		ArrayList<Project> list = (ArrayList<Project>) projectMapper.selectByExample(pe);
		return list;
	}

	@Override
	public List<Project> selectProjectLikeName(String name) throws Exception {
		// TODO  2016.5.27新增
		ProjectExample projectExample = new ProjectExample();
		projectExample.createCriteria().andNameLike("%" + name + "%");
	
		List<Project> projectlist = projectMapper.selectByExample(projectExample);
		
		return projectlist;
	}

	@Override
	public String updateProjectApply(String pid, String e_id) {
		
		String result = Parameter.FAIL;
		
		ProjectExample projectExample = new ProjectExample();
		projectExample.createCriteria().andIdEqualTo(Integer.parseInt(pid));
		
		
		Project projectOld = projectMapper.selectByPrimaryKey(Integer.parseInt(pid));
		if(projectOld == null || projectOld.geteId()!=Parameter.NOEXPERT){
			return result;
		}
		
		Project project = new Project();
		project.seteId(Integer.parseInt(e_id));
		int resultInt = projectMapper.updateByExampleSelective(project, projectExample);
		
		//如果update返回的是1，则表示更新成功
		if (resultInt == 1) {
			result = Parameter.SUCCESS;
		} 
		return result;
	}

	@Override
	public String insertApply(Apply apply) {
		String result = Parameter.FAIL;
		int row = applyMapper.insertSelective(apply);
		if(row >= 1){
			result = Parameter.SUCCESS;
		}
		return result;
	}

	

	
}
