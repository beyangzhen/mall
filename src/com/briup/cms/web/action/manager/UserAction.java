package com.mall.cn.web.action.manager;

import java.util.List;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;

import com.mall.cn.bean.User;
import com.mall.cn.service.IUserService;
import com.mall.cn.service.impl.UserServiceImpl;
import com.opensymphony.xwork2.ActionSupport;

public class UserAction extends ActionSupport {
	private static final long serialVersionUID = 1L;
	private Long id;
	private String username;
	private String password;
	private String level; //M为管理员，C为顾客
	private String phone; 	
	private String address;
	private double account;
	private List<User> userList;
	
	private User user;
	
	private IUserService userService = new UserServiceImpl();
	
	/**
	 * 跳转到添加用户界面
	 */
	@Action(value="toAddUser", results={
			@Result(name="success",location="/WEB-INF/jsp/manager/addUser.jsp")
			})
	public String toAddUser() {
		return SUCCESS;
	}
	
	/**
	 * 跳转到修改用户页面
	 * */
	@Action(value="toUpdUser", results={
			@Result(name="success",location="/WEB-INF/jsp/manager/updUser.jsp")})
	public String toUpdUser() {
		//调用service层的方法通过id查询要修改用户的信息
		user = userService.findById(id);
		
		return SUCCESS;
	}
	
	/**
	 * 跳转到用户管理页面
	 * */
	@Action(value="toUserManager", results={
			@Result(name="success",location="/WEB-INF/jsp/manager/userManager.jsp")
			})
	public String toUserManager(){
		//调用service层的方法查询所有的栏目信息，并且将这些值赋给categoryList
		userList = userService.list();
		
		return SUCCESS;//"success"
	}
	
	/**
	 * 添加用户
	 */
	@Action(value="addUser")
	public void addUser() {
		User user = new User();
		user.setUsername(username);
		user.setPassword(password);
		user.setLevel(level);
		user.setPhone(phone);
		user.setAddress(address);
		user.setAccount(account);
		userService.add(user);
	}
	
	/**
	 * 删除用户
	 * */
	@Action(value="delUser")
	public void delUser(){
		userService.delete(id);
	}
	
	/**
	 * 修改用户
	 * */
	@Action(value="updUser")
	public void updUser(){
		//将接收到的参数进行封装，封装为一个对象
		User user = new User();
		user.setId(id);
		user.setUsername(username);
		user.setPassword(password);
		user.setLevel(level);
		//调用sercice层的服务，完成修改用户的功能
		userService.update(user);
	}
	
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getLevel() {
		return level;
	}

	public void setLevel(String level) {
		this.level = level;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public double getAccount() {
		return account;
	}

	public void setAccount(double account) {
		this.account = account;
	}

	public List<User> getUserList() {
		return userList;
	}

	public void setUserList(List<User> userList) {
		this.userList = userList;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
}
