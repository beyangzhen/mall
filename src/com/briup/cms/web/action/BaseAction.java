package com.mall.cn.web.action;

import java.io.UnsupportedEncodingException;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;

import com.mall.cn.bean.Category;
import com.mall.cn.bean.Goods;
import com.mall.cn.bean.User;
import com.mall.cn.common.util.TokenProccessor;
import com.mall.cn.service.ICategoryService;
import com.mall.cn.service.IGoodsService;
import com.mall.cn.service.IUserService;
import com.mall.cn.service.impl.CategoryServiceImpl;
import com.mall.cn.service.impl.GoodsServiceImpl;
import com.mall.cn.service.impl.UserServiceImpl;
import com.opensymphony.xwork2.ActionSupport;


public class BaseAction extends ActionSupport {
	private static final long serialVersionUID = 1L;
	private Long id;
	private String name;  // 商品名称
	private String size; 
	private int count;    // 购买数量
	private Double money; // 支付金额
	private String username;
	private String password;
	private List<Category> categoryList;
	private List<Goods> goodsList;
	private Goods goods;
	
	private String goUrl; // 上一个页面的url
	
	private IUserService userService = new UserServiceImpl();
	private ICategoryService categoryService = new CategoryServiceImpl();
	private IGoodsService goodsService = new GoodsServiceImpl();
	
	// action中获取session对象
	HttpServletRequest request = ServletActionContext.getRequest();
	
	HttpSession session = request.getSession();
	

	/**
	 * 跳转到首页
	 * ip:port/项目名称/命名空间/url
	 * http://localhost:8888/cms/toIndex.action
	 * */
	@Action(value="toIndex", results={
			@Result(name="success",location="/WEB-INF/jsp/index.jsp")})
	public String toIndex() {
		System.out.println("hello---toIndex");
		// 调用service层的方法查询所有的栏目信息，并且将这些值赋给categoryList
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
	 * 跳转到注册界面
	 */
	@Action(value="toRegister", results={
			@Result(name="success",location="/WEB-INF/jsp/register.jsp")
			})
	public String toRegister() {
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
	 * 跳转到商品列表页面
	 */
	@Action(value="toGoodsList", results={
			@Result(name="success", location="/WEB-INF/jsp/coat.jsp")})
	public String toGoodsList() {
		goodsList = goodsService.list();
		
		return SUCCESS;
	}
	
	/**
	 * 跳转到商品页面
	 */
	@Action(value="toGoods", results={
			@Result(name="success", location="/WEB-INF/jsp/coat_info.jsp")})
	public String toGoods() throws UnsupportedEncodingException {
		
		// 保存当前页面的url信息（方便用户登录后可以回到此页面）
 		String goUrl = request.getRequestURI();
 		Enumeration<String> params = request.getParameterNames();
 		if(null != params) {
 			goUrl = goUrl.concat("?");
 			while(params.hasMoreElements()) {
 				String param = params.nextElement();
 				String urlParam = param + "=" + request.getParameter(param) + "&";
 				goUrl = goUrl.concat(urlParam);
 			}
 			goUrl = goUrl.substring(request.getContextPath().length(), goUrl.length() - 1);
 		}
 		// 保存(第一次访问) 或  更新(再次访问) session中goUrl的当前页面信息
 		request.getSession().setAttribute("goUrl", goUrl);
		
		
		String name2 = new String(name.getBytes("ISO-8859-1"), "UTF-8");
		goodsList = goodsService.findByName(name2);
		
		return SUCCESS;
	}
	
	/**
	 * 跳转到支付页面
	 */
	@Action(value="toPay", results={
			@Result(name="success", location="/WEB-INF/jsp/pay.jsp")})
	public String toPay() {
		// 将生成的token存入session中（用于检测是否重复提交）
		String token = TokenProccessor.getInstance().makeToken(); //创建令牌
        System.out.println("TokenProccessor中生成的token：" + token);
        request.getSession().setAttribute("token", token); //在服务器使用session保存token(令牌)

      
		goodsList = goodsService.findByName(name);
		// 筛选出购买的是哪个规格的商品
		for(Goods g : goodsList) {
			if(size.equals(g.getSize())) {
				goods = g;
			}
		}
		
		return SUCCESS;
	}
	
	/**
	 * 处理登录
	 */
	@Action(value="login", results={
			@Result(name="index", location="/WEB-INF/jsp/index.jsp"),
			@Result(name="goUrl", type="redirect", location="${goUrl}"), // 默认是 "转发" 的方式
			@Result(name="error", location="/WEB-INF/jsp/loginFail.jsp")
			})
	public String login() {
		User user = new User();
		user.setUsername(username);
		user.setPassword(password);
		User user2 = userService.findByUser(user);
		if(user2.getPassword().equals(password)) {
			categoryList = categoryService.list(); // 为了每次页面跳转，首页都会显示导航的菜单
			//将登陆的用户添加到session对象中保存
			session.setAttribute("user", user2); // 登录过程中，全局都有用户信息
			
			// 判断session中上一个url是否为空
			String goUrl = (String)session.getAttribute("goUrl");
			// 将goUrl设置到action的request域中，然后在location中使用el表达式获取
			this.setGoUrl(goUrl); 
			
			if(null != goUrl) {
				// 登录后回到之前的页面
				return "goUrl";
			} else {
				// 用户直接访问登录页面时，转到首页
				return "index";
			}
		} else {
			return ERROR;
		}
	}
	
	/**
	 * 处理注册
	 */
	@Action(value="register", results={
			@Result(name="success", location="/WEB-INF/jsp/login.jsp")})
	public String register() {
		User user = new User();
		user.setUsername(username);
		user.setPassword(password);
		user.setLevel("C");
		userService.add(user);
		System.out.println("恭喜您，注册成功！");
	
		return SUCCESS;
	}
	
	/**
	 * 处理支付
	 */
	@Action(value="pay", results={
			@Result(name="success",location="/WEB-INF/jsp/paySuccess.jsp"),
			@Result(name="error", location="/WEB-INF/jsp/error.jsp")
			})
	public String pay() {
		// 判断是否重复提交，支付表单
		boolean b = isRepeatSubmit(request);
        if(b == true) {
            return ERROR;
        }
        request.getSession().removeAttribute("token"); // 移除session中的token
        System.out.println("处理用户提交请求！！");
		
		
		// 修改购买后，用户账户金额
		User user = (User)session.getAttribute("user");
		if(user != null) {
			user.setAccount(user.getAccount() - money);
			userService.update(user);
		}
		// 修改购买后，商品数量
		goods = goodsService.findById(id); // 需要使用get()，否则可能存在session懒加载错误
		goods.setAmount(goods.getAmount() - count);
		goodsService.update(goods);
		
		return SUCCESS;
	}
	
	/**
	 * 注销用户
	 */
	@Action(value="cancel", results={
			@Result(name="success", location="/WEB-INF/jsp/index.jsp")})
	public String cancel() {
			categoryList = categoryService.list(); //为了每次页面跳转，首页都会显示导航的菜单
			//移除session中的用户
			session.removeAttribute("user");
			
			return SUCCESS;
	}
	
	/**
	 *  检测用户是否重复提交
	 *      true ：用户重复提交了表单 
	 *      false：用户没有重复提交表单
	 */
	private boolean isRepeatSubmit(HttpServletRequest request) {
		String client_token = request.getParameter("token");
		String server_token = (String) request.getSession().getAttribute("token");
		
		// 1、如果用户提交的表单数据中没有token，则用户是重复提交了表单
		if(client_token == null){
			return true;
		}
		
		// 2、如果当前用户的Session中不存在Token(令牌)，则用户是重复提交了表单
		if(server_token == null){
			return true;
		}
		
		// 3、存储在Session中的Token(令牌)与表单提交的Token(令牌)不同，则用户是重复提交了表单
		if(!client_token.equals(server_token)){
			return true;
		}
		
		return false;
	}
	
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSize() {
		return size;
	}

	public void setSize(String size) {
		this.size = size;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public Double getMoney() {
		return money;
	}

	public void setMoney(Double money) {
		this.money = money;
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

	public List<Category> getCategoryList() {
		return categoryList;
	}

	public void setCategoryList(List<Category> categoryList) {
		this.categoryList = categoryList;
	}

	public List<Goods> getGoodsList() {
		return goodsList;
	}

	public void setGoodsList(List<Goods> goodsList) {
		this.goodsList = goodsList;
	}

	public Goods getGoods() {
		return goods;
	}

	public void setGoods(Goods goods) {
		this.goods = goods;
	}

	public String getGoUrl() {
		return goUrl;
	}

	public void setGoUrl(String goUrl) {
		this.goUrl = goUrl;
	}
	
}
