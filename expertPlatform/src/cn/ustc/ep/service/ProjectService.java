package cn.ustc.ep.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import cn.ustc.ep.mobilePo.MobileProject;
import cn.ustc.ep.po.Apply;
import cn.ustc.ep.po.Project;
import cn.ustc.ep.po.User;

/**
 * 项目的service接口
 * @author zhangwei
 *
 */
public interface ProjectService {
	
	//通过project的id查询project
	Project selectProjectById(Integer id) throws Exception;
	
	//通过project的name查询project
	Project selectProjectByName(String name) throws Exception;
	
	//通过project的专家id来查找project
	List<Project> selectProjectListByEid(Integer expertId) throws Exception;
	
	//通过project的公司id来查找project
	List<Project> selectProjectListByCid(Integer companyId) throws Exception;
	
	//通过预算查找project
	List<Project> selectProjectByBudget(Double minBudget, Double maxBudget) throws Exception;
	
	//通过project的合同id来查找project
	Project selectProjectByContractId(String contractid) throws Exception;
	
	//通过project的name查询project组
	List<Project> selectProjectListByName(String name) throws Exception;
	
	//通过Project的时间来查询Project list
	List<Project> selectProjectListByDate(Date startdate, Date deadline) throws Exception;
	
	//更新Project信息
	String updateProject(Project record) throws Exception;
	
	//插入Project信息
	String insertProject(Project record) throws Exception;
	
	//删除Project信息
	String deleteProject(Project record) throws Exception;
	
    //删除project信息
	String deleteProject(String projectId);
	
	//项目的审核情况
	String checkProject(Project record) throws Exception;

	//取出最新的projectSize的project的list
	List<MobileProject> selectProjectByNewDate(int projectSize);
	List<MobileProject> selectProjectByNewDate2(int projectSize);
	//根据专家id查询的project的list
	List<MobileProject> selectProjectListByEID(int eId);
	//根据企业id查询的project的list
	List<MobileProject> selectProjectListByCID(int cId);
	//根据关键字查询的project的list
	List<MobileProject> selectProjectLikeKey(String key);
	//根据p_id 修改状态
	String updateProjectCurrentById(String pid, String current);
	
	String WeChat_updateProject(Project record) throws Exception;
	String WeChat_insertProject(Project record) throws Exception;
	String WeChat_insertApply(Apply record) throws Exception;
	String WeChat_deleteApply(Apply record) throws Exception;
	String WeChat_deleteRedundantApply(Apply apply) throws Exception;
	String WeChat_agreeApply(Apply apply, Project project) throws Exception;
	ArrayList<ArrayList<Project>> WeChat_selectProjectListByUser(User record) throws Exception;
	Project WeChat_selectProjectById(Integer id) throws Exception;
	String WeChat_deleteProject(Integer id) throws Exception;
	List<Project> WeChat_selectProjectListByCondition(String field, String budget, User user) throws Exception;

	//查找所有project
	List<Project> selectProjectList();
	
	//TODO 2016.5.27日新增 模糊查找含某个名称的项目
	List<Project> selectProjectLikeName(String name) throws Exception;
	//TODO
	List<Project> selectProjectListByCidList(List<Integer> idList) throws Exception;

	String updateProjectApply(String pid, String e_id);

	//向申请表中添加记录
	String insertApply(Apply apply);

	
	
	
}
