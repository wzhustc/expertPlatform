package cn.ustc.ep.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.ustc.ep.mapper.CompanyMapper;
import cn.ustc.ep.mapper.ExpertMapper;
import cn.ustc.ep.mapper.UserMapper;
import cn.ustc.ep.po.Company;
import cn.ustc.ep.po.Expert;
import cn.ustc.ep.po.User;
import cn.ustc.ep.po.UserExample;
import cn.ustc.ep.po.UserExample.Criteria;
import cn.ustc.ep.service.UserService;

@Service
public class UserServiceImpl implements UserService {

	
	@Autowired
	private UserMapper userMapper ;
	@Autowired
	private ExpertMapper expertMapper;
	@Autowired
	private CompanyMapper companyMapper;
	
	@Override
	public String insertUser(User record) throws Exception {
		int row = userMapper.insertSelective(record) ;
		String result = "fail" ;
		if(row >= 1){
			result = "success" ;
		}else{
		    result = "fail";
		}
		return result ;
	}

	@Override
	public User login(User user) throws Exception {
		
		UserExample ue = new UserExample() ;
		Criteria criteria = ue.createCriteria() ;
		criteria.andEmailEqualTo(user.getEmail()) ;
		criteria.andPasswordEqualTo(user.getPassword()) ;
		
		ArrayList<User> userList = (ArrayList<User>) userMapper.selectByExample(ue) ;
		if(userList.isEmpty()){
			return null ;
		}else{
			return userList.get(0);
		}
		
	}

	@Override
	public User getUserIdByUser(User user) {
		UserExample ue = new UserExample() ;
		Criteria c = ue.createCriteria() ;
		c.andEmailEqualTo(user.getEmail()) ;
		c.andUsernameEqualTo(user.getUsername()) ;
		List<User> userList = userMapper.selectByExample(ue) ;
		if(userList.isEmpty()){
			return null ;
		}else{
			return userList.get(0);
		}
	}

	@Override
	public String updateUser(User user) {
		int r = userMapper.updateByPrimaryKeySelective(user) ;
		String result = "fail" ;
		if(r >= 1){
			result = "success" ;
		}else{
		    result = "fail";
		}
		return result ;
	}

	@Override
	public User WeChat_login(User user) throws Exception {
		
		UserExample ue = new UserExample();
		Criteria criteria = ue.createCriteria();
		criteria.andEmailEqualTo(user.getUsername());
		criteria.andPasswordEqualTo(user.getPassword());
		criteria.andRoleEqualTo(user.getRole());
		
		ArrayList<User> userList = (ArrayList<User>) userMapper.selectByExample(ue);
		if (userList.isEmpty()) {
			return null ;
		}
		else {
			return userList.get(0);
		}		
	}

	@Override
	public String WeChat_insertExpert(User record, Expert expert) throws Exception {
		
		int row = userMapper.insertSelective(record);
		
		String result = "fail";
		if (row == 1) {
			UserExample ue = new UserExample();
			Criteria criteria = ue.createCriteria();
			criteria.andUsernameEqualTo(record.getUsername());
			criteria.andPasswordEqualTo(record.getPassword());
			criteria.andEmailEqualTo(record.getEmail());
			
			ArrayList<User> userList = (ArrayList<User>) userMapper.selectByExample(ue);
			expert.setId(userList.get(0).getId());
			int row2 = expertMapper.insertSelective(expert);
			result = (row2 == 1 ? "success" : "fail");
		} 
		else {
		    result = "fail";
		}
		return result ;
	}
	
	@Override
	public String WeChat_insertCompany(User record, Company company) throws Exception {
		int row = userMapper.insertSelective(record);
		String result = "fail";
		if (row == 1) {
			UserExample ue = new UserExample();
			Criteria criteria = ue.createCriteria();
			criteria.andUsernameEqualTo(record.getUsername());
			criteria.andPasswordEqualTo(record.getPassword());
			criteria.andEmailEqualTo(record.getEmail());
			
			ArrayList<User> userList = (ArrayList<User>) userMapper.selectByExample(ue);	
			company.setId(userList.get(0).getId()); 
			int row2 = companyMapper.insertSelective(company);
			result = (row2 == 1 ? "success" : "fail");
		} 
		else {
		    result = "fail";
		}
		return result ;
	}
}
