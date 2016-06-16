package cn.ustc.ep.mobilePo;


import cn.ustc.ep.po.Company;
import cn.ustc.ep.po.Expert;
import cn.ustc.ep.po.User;

public class MobileUser {
	int userID ;
	String userName ;
	String field ;
	String role ;
	String image ;
	String location ;
	String realName ;
	String email ;
	String password ;
	
	public MobileUser() {
		super() ;
	}
	public MobileUser(User user) {
		this.userID = user.getId() ;
		this.role = user.getRole() ;
		this.userName = user.getUsername() ;
		this.email = user.getEmail() ;
		this.password = user.getPassword() ;
	}
	public MobileUser(Expert expert ,User user) {
		this.userID = user.getId() ;
		this.field = expert.getField();
		this.role = user.getRole() ;
		this.image = expert.getImage() ;
		this.location = expert.getLocation() ;
		this.realName = expert.getRealname() ;
		this.userName = user.getUsername() ;
		this.email = user.getEmail() ;
		this.password = user.getPassword() ;
	}
	
	public MobileUser(Company company ,User user) {
		this.userID = user.getId() ;
		this.field = company.getField();
		this.role = user.getRole() ;
		this.image = company.getImage() ;
		this.location = company.getLocation() ;
		this.realName = company.getRealname() ;
		this.userName = user.getUsername() ;
		this.email = user.getEmail() ;
		this.password = user.getPassword() ;
	}

	public int getUserID() {
		return userID;
	}

	public void setUserID(int userID) {
		this.userID = userID;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getField() {
		return field;
	}

	public void setField(String field) {
		this.field = field;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getRealName() {
		return realName;
	}

	public void setRealName(String realName) {
		this.realName = realName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
	
}
