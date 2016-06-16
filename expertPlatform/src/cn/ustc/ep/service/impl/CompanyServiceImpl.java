package cn.ustc.ep.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import cn.ustc.ep.mapper.CompanyMapper;
import cn.ustc.ep.mapper.ExpertMapper;
import cn.ustc.ep.mapper.ProjectMapper;
import cn.ustc.ep.po.Company;
import cn.ustc.ep.po.CompanyExample;
import cn.ustc.ep.po.CompanyExample.Criteria;
import cn.ustc.ep.po.Expert;
import cn.ustc.ep.po.Project;
import cn.ustc.ep.po.ProjectExample;
import cn.ustc.ep.service.CompanyService;


public class CompanyServiceImpl implements CompanyService {

	@Autowired
	private CompanyMapper companyMapper ;
	
	@Autowired
	private ProjectMapper projectMapper ;
	
	@Autowired
	private ExpertMapper expertMapper;
	
	//更新公司信息
	@Override
	public String updateCompany(Company record) throws Exception {
		int resultInt = companyMapper.updateByPrimaryKeySelective(record) ;
		String result = "fail" ;
		if (resultInt >= 1) {
			result = "success" ;
		}
		return result;
	}

	//插入公司信息
	@Override
	public String insertCompany(Company record) throws Exception {
		int resultInt = companyMapper.insert(record);
		String result = "fail";
		if (resultInt >= 1) {
			result = "success";
		} 
		return result;
	}

	//根据专家找公司
	@Override
	public List<Company> selectCompanyListByExpert(Expert record)
			throws Exception {
		ProjectExample projectExample = new ProjectExample();
		projectExample.createCriteria().andEIdEqualTo(record.getId());
		List<Project> projectList = projectMapper.selectByExample(projectExample);
		List<Company> companyList = null;
		for (Project project : projectList) {
			companyList = this.selectCompanyListByProject(project);
		}
		return companyList;
	}
	
	//根据project查询公司
	@Override
	public List<Company> selectCompanyListByProject(Project project){
		CompanyExample companyExample = new CompanyExample();
		companyExample.createCriteria().andAdditionEqualTo(project.getName());
		
		List<Company> companyList = companyMapper.selectByExample(companyExample);
		return companyList;
		
	}

	//根据公司的field来查询公司
	@Override
	public List<Company> selectCompanyListByField(String field) throws Exception {

		CompanyExample companyExample = new CompanyExample();
		companyExample.createCriteria().andFieldLike("%"+field+"%");
		List<Company> companyList = companyMapper.selectByExample(companyExample);
		return companyList;
	}
	
	//对公司进行审核
	@Override
	public String checkCompany(Company record) throws Exception {
		int resultInt = companyMapper.updateByPrimaryKeySelective(record);
		String result = "fail";
		if (resultInt >= 1) {
			result = "success";
		}
		return result;
	}
	
	//把企业推送给专家
	@Override
	public String pushCompanyToExpert(Expert expert) throws Exception {
		//TODO
		int resultInt = expertMapper.updateByPrimaryKey(expert);
		String result = "fail";
		if (resultInt >= 1) {
			result = "success";
		}
		return result;
	}
	

	//实现根据company的标签来查找对应的公司
	@Override
	public List<Company> selectCompanyByTag(String tag) throws Exception {

		CompanyExample companyExample = new CompanyExample();
		companyExample.createCriteria().andAdditionLike(tag);
		List<Company> returnCompany = companyMapper.selectByExample(companyExample);
		return returnCompany;
	}
	
	//根据公司地址查询公司
	@Override
	public List<Company> selectCompanyListByLocation(String location) throws Exception {

		CompanyExample companyExample = new CompanyExample();
		companyExample.createCriteria().andLocationLike(location);
		List<Company> companyList = companyMapper.selectByExample(companyExample);
		return companyList;
	}
	
	//根据公司名字返回公司列表
	@Override
	public List<Company> selectCompanyListByName(String companyname) throws Exception {

		CompanyExample companyExample = new CompanyExample();
		companyExample.createCriteria().andCompanynameLike(companyname);
		List<Company> companyList = companyMapper.selectByExample(companyExample);
		return companyList;
	}
	
	//实现根据company的id来查找公司
	@Override
	public Company selectCompanyById(int companyId) {
		Company company = companyMapper.selectByPrimaryKey(companyId) ;
		return company;
	}

	//根据company的name来查找公司
	@Override
	public Company selectCompanyByName(String companyname) throws Exception {

		CompanyExample companyExample = new CompanyExample();
		Company returnCompany = new Company();
		companyExample.createCriteria().andRealnameEqualTo(companyname);
		
		List<Company> companyList = companyMapper.selectByExample(companyExample);
		
		if (companyList.size() > 0) {
			returnCompany = companyList.get(0);
		} else {
			returnCompany = null;
		}
		return returnCompany;
	}
	

	//根据公司id来删除公司信息
	@Override
	public String deleteCompanyById(Company company) throws Exception {
		
		int resultInt = companyMapper.deleteByPrimaryKey(company.getId());
		String result = "fail";
		if (resultInt >= 1) {
			result = "success";
		}
		return result;
	}
	
	//根据公司名称删除公司
	@Override
	public String deleteCompanyByName(Company company) throws Exception {

		CompanyExample companyExample = new CompanyExample();
		int resultInt = companyMapper.deleteByExample(companyExample);
		String result = "fail";
		if (resultInt >= 1) {
			result = "success";
		}
		return result;
	}

	@Override
	public List<Company> selectCompanyListByPage(int page) {
		int defaultListSize = 3 ;
		//判断
		int count = selectCompanyCount();
		int begin = (page-1)*defaultListSize ;
		if(page*defaultListSize>count){
			if((page*defaultListSize-count)<defaultListSize){
				defaultListSize = defaultListSize - (page*defaultListSize - count) ;
			}else{
				begin = count - 3 ;
			}
		}
		
		if(count < defaultListSize){
			begin = 0 ;
			defaultListSize = count;
		}
		
		
		List<Company> companyList = companyMapper.selectCompanyListByPageNum(begin, defaultListSize) ;
		return companyList;
		
	}
	
	@Override
	public int selectCompanyCount() {
		int count = companyMapper.selectCount() ;
		return count;
	}

	@Override
	public List<Company> selectCompanyLikeName(String keySearch) {
		
		CompanyExample companyExample = new CompanyExample() ;
		companyExample.createCriteria().andCompanynameLike("%"+keySearch+"%") ;
		
		List<Company> list = companyMapper.selectByExample(companyExample);
		return list;
	}
	
	@Override
	public List<Company> WeChat_selectCompanyByField(String field) throws Exception {
		
		CompanyExample ce = new CompanyExample();
		Criteria criteria = ce.createCriteria();
		criteria.andFieldLike("%" + field + "%");
		
		List<Company> list = companyMapper.selectByExample(ce);
		
		return list;
	}
	
	@Override
	public String WeChat_updateCompany(Company record) throws Exception {
		
		int line = companyMapper.updateByPrimaryKeySelective(record);
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
	public Company WeChat_selectCompanyById(int companyId) throws Exception {
		Company company = companyMapper.selectByPrimaryKey(companyId) ;
		return company;
	}

	@Override
	public List<Company> selectCompanyList() {
		CompanyExample companyExample = new CompanyExample();
		
		List<Company> companyList = companyMapper.selectByExample(companyExample);
		
		return companyList;
	}
	

}
