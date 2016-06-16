package cn.ustc.ep.service;

import cn.ustc.ep.po.Company;
import cn.ustc.ep.po.Expert;
import cn.ustc.ep.po.User;

/**
 * 
 * @author 
 *
 */
public interface UserService {
	String insertUser(User record) throws Exception;
	User login(User user) throws Exception;
	User getUserIdByUser(User user);
	String updateUser(User user);
	
	String WeChat_insertExpert(User record, Expert expert) throws Exception;
	String WeChat_insertCompany(User record, Company company) throws Exception;
	User WeChat_login(User user) throws Exception;
}
