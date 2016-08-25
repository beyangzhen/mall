package com.briup.cms.web.action.manager;

import java.util.List;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.InterceptorRef;
import org.apache.struts2.convention.annotation.InterceptorRefs;
import org.apache.struts2.convention.annotation.Result;

import com.briup.cms.bean.User;
import com.briup.cms.service.IUserService;
import com.briup.cms.service.impl.UserServiceImpl;
import com.opensymphony.xwork2.ActionSupport;

public class UserAction extends ActionSupport {
	private static final long serialVersionUID = 1L;
	private Long id;
	private String username;
	private String password;
	private String level; //M为管理员，C为顾客
	private List<User> userList;
	
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
		userService.add(user);
	}
	
	/**
	 * 删除用户
	 * */
	@Action(value="delUser")
	public void delUser(){
		userService.delete(id);
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

	public List<User> getUserList() {
		return userList;
	}

	public void setUserList(List<User> userList) {
		this.userList = userList;
	}
	
}
