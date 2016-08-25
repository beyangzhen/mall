package com.briup.cms.web.action;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;

import com.briup.cms.bean.Category;
import com.briup.cms.bean.User;
import com.briup.cms.service.ICategoryService;
import com.briup.cms.service.IUserService;
import com.briup.cms.service.impl.CategoryServiceImpl;
import com.briup.cms.service.impl.UserServiceImpl;
import com.opensymphony.xwork2.ActionSupport;

public class BaseAction extends ActionSupport {
	private static final long serialVersionUID = 1L;
	private Long id;
	private String username;
	private String password;
	private String level; //M为管理员，U为顾客
	private List<Category> categoryList;
	
	private IUserService userService = new UserServiceImpl();
	private ICategoryService categoryService = new CategoryServiceImpl();
	
	//action中获取servlet的session对象
	HttpSession session = ServletActionContext.getRequest().getSession();
	
	/**
	 * 跳转到首页
	 * ip:port/项目名称/命名空间/url
	 * http://localhost:8888/cms/toIndex.action
	 * */
	@Action(value="toIndex",results={
			@Result(name="success",location="/WEB-INF/jsp/index.jsp")})
	public String toIndex(){
		System.out.println("hello---toIndex");
		//调用service层的方法查询所有的栏目信息，并且将这些值赋给categoryList
		categoryList = categoryService.list(); //为了每次页面跳转，首页都会显示导航的菜单
		
		return "success";
	}
	
	/**
	 * 跳转到登录界面
	 */
	@Action(value="toLogin", results={
			@Result(name="success",location="/WEB-INF/jsp/login.jsp")
			})
	public String toLogin() {
		return SUCCESS;
	}
	
	/**
	 * 跳转到列表页
	 * */
	@Action(value="toList",results={
			@Result(name="success",location="/WEB-INF/jsp/list.jsp")})
	public String toList(){
		return "success";
	}
	
	/**
	 * 跳转到内容页
	 * */
	@Action(value="toContent",results={
			@Result(name="success",location="/WEB-INF/jsp/content.jsp")})
	public String toContent(){
		return "success";
	}
	
	/**
	 * 跳转到用户信息界面
	 */
	@Action(value="toUserInfor", results={
			@Result(name="success",location="/WEB-INF/jsp/userInfor.jsp")})
	public String toUserInfor() {
		return SUCCESS;
	}
	
	/**
	 * 处理登录
	 */
	@Action(value="login", results={
			@Result(name="success", location="/WEB-INF/jsp/index.jsp"),
			@Result(name="error", location="/WEB-INF/jsp/loginFail.jsp")
			})
	public String login() {
		User user = new User();
		user.setUsername(username);
		user.setPassword(password);
		User user2 = userService.find(user);
		if(user2.getPassword().equals(password)) {
			categoryList = categoryService.list(); //为了每次页面跳转，首页都会显示导航的菜单
			//将登陆的用户添加到session对象中保存
			session.setAttribute("user", user2);
			
			return SUCCESS;
		} else {
			return ERROR;
		}
	}
	
	/**
	 * 注销用户
	 */
	@Action(value="cancel", results={
			@Result(name="success", location="/WEB-INF/jsp/index.jsp"),
			})
	public String cancel() {
			categoryList = categoryService.list(); //为了每次页面跳转，首页都会显示导航的菜单
			//移除session中的用户
			session.removeAttribute("user");
			
			return SUCCESS;
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

	public List<Category> getCategoryList() {
		return categoryList;
	}

	public void setCategoryList(List<Category> categoryList) {
		this.categoryList = categoryList;
	}

}
