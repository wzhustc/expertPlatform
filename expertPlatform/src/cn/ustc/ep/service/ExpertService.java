package cn.ustc.ep.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import cn.ustc.ep.po.Company;
import cn.ustc.ep.po.Education;
import cn.ustc.ep.po.Experience;
import cn.ustc.ep.po.Expert;
import cn.ustc.ep.po.Honor;

/**
 * 专家的service接口
 * @author chengshuo
 *
 */
public interface ExpertService {
	//更新专家
	String updateExpert(Expert record) throws Exception;
	//新建专家信息
	String insertExpert(Expert record) throws Exception;
	//根据名称查找
	Expert selectExpertByName(String name);
	//根据id查找
	Expert selectExpertById(String id);
	//根据id查找专家教育经历
	List<Education> getExpertEducationById(String id);
	//根据id查找专家获得荣誉
	List<Honor> getExpertHonorById(String id);
	//根据id查找专家工作经历
	List<Experience> getExpertExperienceById(String id);
	//添加荣誉
	String addHonor(Honor honorObj);
	//添加教育经历
	String addEducation(Education edu);
	//添加工作经历
	String addExperience(Experience ex);
	//添加基础信息
	String addBasicInfo(Expert expert);
	//修改教育经历
	String updateEducation(Education edu);
	//根据id删除教育经历
	String deleteEducationById(Education edu);
	//更新工作经历
	String updateExperience(Experience ex);
	//删除工作经历
	String deleteExperienceById(Experience exp);
	//更新荣誉
	String updateHonor(Honor honorObj);
	//删除荣誉
	String deleteHonorById(Honor honorObj);
	
	//根据领域查找专家
	List<Expert> selectExpertLikeField(String field);
	
	//根据公司的领域找到其领域相关的专家
	List<Expert> selectExpertListByCompany(Company company);
	
	List<Expert> WeChat_selectExpertListByCondition(Expert record) throws Exception;
	Expert WeChat_selectExpertById(Integer id);
	//更新专家
	String WeChat_updateExpert(Expert record) throws Exception;
	List<Expert> WeChat_selectExpertApplyListBypid(String pId) throws Exception;
	
	//得所有專家
	List<Expert> selectExpertList();
}
