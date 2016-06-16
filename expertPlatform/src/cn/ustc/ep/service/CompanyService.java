package cn.ustc.ep.service;

import java.util.List;

import cn.ustc.ep.po.Company;
import cn.ustc.ep.po.Expert;
import cn.ustc.ep.po.Project;

/**
 * 企业的service接口s
 * @author zhangwei
 *
 */
public interface CompanyService {
	//更新公司
	String updateCompany(Company record) throws Exception;
	
	//新建公司信息
	String insertCompany(Company record) throws Exception;
	
	//根据expert，返回与其签约的company
	List<Company> selectCompanyListByExpert(Expert record) throws Exception;
	
	//审核公司
	String checkCompany(Company record) throws Exception;
	
	//企业信息推送，将根据expert的需求，推送相关领域的公司到expert
	String pushCompanyToExpert(Expert expert)  throws Exception;
	
	//企业分类查找,输入相关标签，返回对应的公司List
	List<Company> selectCompanyByTag(String tag) throws Exception;
	
	//企业id查找,输入id，返回对应的公司信息
	Company selectCompanyById(int companyId) throws Exception;
	
	//根据company的name来查找公司
	Company selectCompanyByName(String companyname) throws Exception;

	//企业项目查找，输入项目，返回对应的公司信息
	List<Company> selectCompanyListByProject(Project project) throws Exception;
	
	//根据公司的field来查询公司
	List<Company> selectCompanyListByField(String field) throws Exception;
	
	//根据公司地址查询公司
	List<Company> selectCompanyListByLocation(String location) throws Exception;
	
	//根据公司名字返回公司列表
	List<Company> selectCompanyListByName(String companyname) throws Exception;
	
	//根据公司id删除公司的信息
	String deleteCompanyById(Company company) throws Exception;
	
	//根据公司名称删除公司信息
	String deleteCompanyByName(Company company) throws Exception;

	List<Company> selectCompanyListByPage(int page);
	
	int selectCompanyCount() ;

	List<Company> selectCompanyLikeName(String keySearch);
	
	String WeChat_updateCompany(Company record) throws Exception;
	//企业id查找,输入id，返回对应的公司信息
	Company WeChat_selectCompanyById(int companyId) throws Exception;
	List<Company> WeChat_selectCompanyByField(String field) throws Exception;

	//得到所有的公司
	List<Company> selectCompanyList();
	
	
	
}
