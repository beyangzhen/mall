package com.mall.cn.web.action.manager;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
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
	/**
	 * 用户级别：M为管理员，A为钻石会员（>1500 积分），B为黄金会员（500~1500积分），C为大众会员（<500积分）。 M：折扣为 0.85，A：折扣为 0.85， B：折扣为
	 * 0.9 ， C：折扣为 1
	 */
	private String level;
	/**
	 * 用户积分（每消费1元，增加1积分）
	 */
	private Integer score;
	private String phone;
	private String address;
	private double account; // 账户余额
	private Integer money; // 账户充值金额
	private List<User> userList;

	private User user;

	private IUserService userService = new UserServiceImpl();

	// action中获取session对象
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpServletResponse response = ServletActionContext.getResponse();
	HttpSession session = request.getSession();

	/**
	 * 跳转到添加用户界面
	 */
	@Action(value = "toAddUser", results = { @Result(name = "success", location = "/WEB-INF/jsp/manager/addUser.jsp") })
	public String toAddUser() {
		return SUCCESS;
	}

	/**
	 * 跳转到修改用户页面
	 */
	@Action(value = "toUpdUser", results = { @Result(name = "success", location = "/WEB-INF/jsp/manager/updUser.jsp") })
	public String toUpdUser() {
		// 调用service层的方法通过id查询要修改用户的信息
		user = userService.findById(id);

		return SUCCESS;
	}

	/**
	 * 跳转到账户充值界面
	 */
	@Action(value = "toRechargeUser", results = { @Result(name = "success", location = "/WEB-INF/jsp/recharge.jsp") })
	public String toRechargeUser() {
		return SUCCESS;
	}

	/**
	 * 跳转到用户管理页面
	 */
	@Action(value = "toUserManager", results = {
			@Result(name = "success", location = "/WEB-INF/jsp/manager/userManager.jsp") })
	public String toUserManager() {
		// 调用service层的方法查询所有的栏目信息，并且将这些值赋给categoryList
		userList = userService.list();

		return SUCCESS;// "success"
	}

	/**
	 * 添加用户
	 */
	@Action(value = "addUser")
	public void addUser() {
		User user = new User();
		user.setUsername(username);
		user.setPassword(password);
		user.setLevel(level);
		if ("M".equals(level)) {
			user.setScore(-1); // 管理员不存在积分
		} else if ("A".equals(level)) {
			user.setScore(1500);
		} else if ("B".equals(level)) {
			user.setScore(500);
		} else if ("C".equals(level)) {
			user.setScore(0);
		}
		user.setPhone(phone);
		user.setAddress(address);
		userService.add(user);
	}

	/**
	 * 删除用户
	 */
	@Action(value = "delUser")
	public void delUser() {
		userService.delete(id);
	}

	/**
	 * 修改用户
	 */
	@Action(value = "updUser")
	public void updUser() {
		// 将接收到的参数封装为一个对象
		User user = new User();
		user.setId(id);
		user.setUsername(username);
		user.setPassword(password);
		user.setLevel(level);
		if ("M".equals(level)) {
			user.setScore(-1); // 管理员不存在积分
		} else if ("A".equals(level)) {
			user.setScore(1500);
		} else if ("B".equals(level)) {
			user.setScore(500);
		} else if ("C".equals(level)) {
			user.setScore(0);
		}
		user.setPhone(phone);
		user.setAddress(address);
		// 调用sercice层的服务，完成修改用户的功能
		userService.update(user);
		// 修改的为当前session中user时，同时修改session中的值
		User userSession = (User) session.getAttribute("user");
		if (id == userSession.getId()) {
			session.setAttribute("user", user);
		}
	}

	/**
	 * 账户充值（1、前台充值后返回userInfor.jsp 2、后台充值返回userInfor.jsp后，还会接着模拟点击'用户管理'按钮）
	 * 
	 * @throws IOException
	 */
	@Action(value = "rechargeUser", results = { @Result(name = "success", location = "/WEB-INF/jsp/userInfor.jsp") })
	public String rechargeUser() throws IOException {
		// 调用service层的方法通过id查询充值用户的信息
		User u = userService.findById(id);
		// 调用sercice层的服务，完成账户充值的功能
		u.setAccount(u.getAccount() + money);
		userService.recharge(u);
		// 充值后同时修改session中的值
		session.setAttribute("user", u);

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

	public Integer getScore() {
		return score;
	}

	public void setScore(Integer score) {
		this.score = score;
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

	public Integer getMoney() {
		return money;
	}

	public void setMoney(Integer money) {
		this.money = money;
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
