package cn.ustc.ep.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.springframework.beans.factory.annotation.Autowired;

import cn.ustc.ep.mapper.ApplyMapper;
import cn.ustc.ep.mapper.EducationMapper;
import cn.ustc.ep.mapper.ExperienceMapper;
import cn.ustc.ep.mapper.ExpertMapper;
import cn.ustc.ep.mapper.HonorMapper;
import cn.ustc.ep.po.Apply;
import cn.ustc.ep.po.ApplyExample;
import cn.ustc.ep.po.Company;
import cn.ustc.ep.po.Education;
import cn.ustc.ep.po.EducationExample;
import cn.ustc.ep.po.Experience;
import cn.ustc.ep.po.ExperienceExample;
import cn.ustc.ep.po.Expert;
import cn.ustc.ep.po.ExpertExample;
import cn.ustc.ep.po.ExpertExample.Criteria;
import cn.ustc.ep.po.Honor;
import cn.ustc.ep.po.HonorExample;
import cn.ustc.ep.po.Project;
import cn.ustc.ep.po.ProjectExample;
import cn.ustc.ep.service.ExpertService;

public class ExpertServiceImpl implements ExpertService {

	@Autowired
	private ExpertMapper expertMapper;
	@Autowired
	private EducationMapper educationMapper;
	@Autowired
	private HonorMapper honorMapper;
	@Autowired
	private ExperienceMapper experienceMapper;
	@Autowired
	private ApplyMapper applyMapper;

	@Override
	public String updateExpert(Expert record) throws Exception {
		int resultInt = expertMapper.updateByPrimaryKeySelective(record);
		String result = "fail";
		if (resultInt >= 1) {
			result = "success";
		} else {
			result = "fail";
		}
		return result;
	}

	@Override
	public String insertExpert(Expert record) throws Exception {
		int resultInt = expertMapper.insertSelective(record);
		String result = "fail";
		if (resultInt == 1) {
			result = "success";
		} else {
			result = "fail";
		}
		return result;
	}

	@Override
	public Expert selectExpertByName(String name) {
		ExpertExample expertExample = new ExpertExample();
		Expert returnExpert = new Expert();

		expertExample.createCriteria().andRealnameLike("%"+name+"%");
		List<Expert> expertlist = expertMapper.selectByExample(expertExample);

		if (expertlist.size() > 0) {
			returnExpert = expertlist.get(0);
		} else {
			returnExpert = null;
		}
		return returnExpert;
	}

	@Override
	public Expert selectExpertById(String id) {
		Expert expert = expertMapper.selectByPrimaryKey(Integer.parseInt(id));
		return expert;
	}

	@Override
	public List<Education> getExpertEducationById(String id) {

		EducationExample eduExample = new EducationExample();
		eduExample.createCriteria().andEIdEqualTo(Integer.parseInt(id));

		List<Education> eduList = educationMapper.selectByExample(eduExample);
		return eduList;
	}

	@Override
	public List<Honor> getExpertHonorById(String id) {
		HonorExample honorExample = new HonorExample();
		honorExample.createCriteria().andEIdEqualTo(Integer.parseInt(id));

		List<Honor> honorList = honorMapper.selectByExample(honorExample);
		return honorList;
	}

	@Override
	public List<Experience> getExpertExperienceById(String id) {
		ExperienceExample ExpExample = new ExperienceExample();
		ExpExample.createCriteria().andEIdEqualTo(Integer.parseInt(id));

		List<Experience> expList = experienceMapper.selectByExample(ExpExample);
		return expList;
	}

	@Override
	public String addHonor(Honor honorObj) {
		int r = honorMapper.insert(honorObj);
		String result = "fail";
		if (r == 1) {
			result = "success";
		}
		return result;
	}

	@Override
	public String addEducation(Education edu) {
		int r = educationMapper.insert(edu);
		String result = "fail";
		if (r == 1) {
			result = "success";
		}
		return result;
	}

	@Override
	public String addExperience(Experience ex) {
		int r = experienceMapper.insert(ex);
		String result = "fail";
		if (r == 1) {
			result = "success";
		}
		return result;
	}

	@Override
	public String addBasicInfo(Expert expert) {
		int r = expertMapper.insert(expert);
		String result = "fail";
		if (r == 1) {
			result = "success";
		}
		return result;
	}

	@Override
	public String updateEducation(Education edu) {

		int r = educationMapper.updateByPrimaryKeySelective(edu);
		String result = "fail";
		if (r == 1) {
			result = "success";
		}
		return result;
	}

	@Override
	public String deleteEducationById(Education edu) {
		int r = educationMapper.deleteByPrimaryKey(edu.getId());
		String result = "fail";
		if (r == 1) {
			result = "success";
		}
		return result;
	}

	@Override
	public String updateExperience(Experience ex) {
		int r = experienceMapper.updateByPrimaryKeySelective(ex);
		String result = "fail";
		if (r == 1) {
			result = "success";
		}
		return result;
	}

	@Override
	public String deleteExperienceById(Experience exp) {
		int r = experienceMapper.deleteByPrimaryKey(exp.getId());
		String result = "fail";
		if (r == 1) {
			result = "success";
		}
		return result;
	}

	@Override
	public String updateHonor(Honor honorObj) {
		int r = honorMapper.updateByPrimaryKeySelective(honorObj);
		String result = "fail";
		if (r == 1) {
			result = "success";
		}
		return result;
	}

	@Override
	public String deleteHonorById(Honor honorObj) {
		int r = honorMapper.deleteByPrimaryKey(honorObj.getId());
		String result = "fail";
		if (r == 1) {
			result = "success";
		}
		return result;
	}

	@Override
	public List<Expert> selectExpertListByCompany(Company company) {
		String companyFields = company.getField();
		String[] fields = companyFields.split("#");
		int count = 0;// 用于标识只取前三个field
		List<Expert> expertList = new LinkedList<Expert>();
		for (String field : fields) {
			expertList.addAll(selectExpertLikeField(field));
			count++;
			if (count == 3) {
				break;
			}
		}

		List<Expert> returnList = new LinkedList<Expert>();
		Map<Integer, Expert> hashMap = new HashMap<Integer, Expert>();
		int hashCount = 0 ;//用于退出循环
		int allCount = 20 ;
		while (hashCount<4 && allCount>0) {
			
			hashCount = 0 ;
			allCount -- ;
			int index = (int) Math.random();
			
			Expert expertRelated;
			if (index < expertList.size()) {
				expertRelated = expertList.get(index);
				hashMap.put(expertRelated.getId(), expertRelated);
			}else if(index/2 < expertList.size()){
				index = index/2 ;
				expertRelated = expertList.get(index);
				hashMap.put(expertRelated.getId(), expertRelated);
			}
			for (Entry<Integer, Expert> entry : hashMap.entrySet()) {
				hashCount++ ;
			}
			
		}
		for (Entry<Integer, Expert> entry : hashMap.entrySet()) {
			returnList.add(entry.getValue());
		}

		for (Expert expert : returnList) {
			System.out.println(expert.getRealname());
		}
		
		return returnList;
	}

	@Override
	public List<Expert> selectExpertLikeField(String field) {
		ExpertExample expertExample = new ExpertExample();
		expertExample.createCriteria().andFieldLike("%" + field + "%");
		List<Expert> list = expertMapper.selectByExample(expertExample);
		return list;
	}
	@Override
	public String WeChat_updateExpert(Expert record) throws Exception {
		
		int resultInt = expertMapper.updateByPrimaryKeySelective(record);
		String result = "fail" ;
		if(resultInt == 1) {
			result = "success";
		}
		else {
			result = "fail" ;
		}
		return result;
	}
	
	@Override
	public List<Expert> WeChat_selectExpertListByCondition(Expert record) throws Exception {
		ExpertExample pe = new ExpertExample();
		Criteria criteria = pe.createCriteria();
		criteria.andFieldLike("%" + record.getField() + "%");
		if (record.getLocation().equals("notLimit")) {
		}
		else {
			criteria.andLocationLike("%" + record.getLocation() + "%");
		}

		ArrayList<Expert> list = (ArrayList<Expert>) expertMapper.selectByExample(pe);
		
		return list;
	}

	@Override
	public Expert WeChat_selectExpertById(Integer id) {
		Expert expert = expertMapper.selectByPrimaryKey(id);
		return expert;
	}
	
	@Override
	public List<Expert> WeChat_selectExpertApplyListBypid(String proId) throws Exception {
		List<Apply> applyList = new ArrayList<Apply>();
		List<Integer> idList = new ArrayList<Integer>();
		List<Expert> expertList = new ArrayList<Expert>();
		
		ApplyExample ae = new ApplyExample();
		ae.createCriteria().andPIdEqualTo(Integer.valueOf(proId)).andDirectionEqualTo("apply").andIsAgreeEqualTo("false");
		applyList = applyMapper.selectByExample(ae);
		
		ExpertExample ee = new ExpertExample();
		if (applyList.isEmpty() == false) {
			for (Apply a : applyList) {
				idList.add(a.geteId());
			}
			ee.createCriteria().andIdIn(idList);
		}
		else {
			ee.createCriteria().andIdEqualTo(-1);
		}
		expertList = expertMapper.selectByExample(ee);
		
		return expertList;
	}

	
	//得到所有的專家
	@Override
	public List<Expert> selectExpertList() {
		ExpertExample ExpertExample = new ExpertExample();
		
		List<Expert> ExpertList = expertMapper.selectByExample(ExpertExample);
		
		return ExpertList;
	}

	
}
