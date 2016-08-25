
package com.briup.cms.web.action.manager;

import java.util.List;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;

import com.briup.cms.bean.Category;
import com.briup.cms.service.ICategoryService;
import com.briup.cms.service.impl.CategoryServiceImpl;
import com.opensymphony.xwork2.ActionSupport;

public class CategoryAction extends ActionSupport {
	/*
	 * struts获取页面请求传来的属性值  和  让"请求的页面"直接用el获取action的属性(struts的自动注入)
	 * 	 1.定义对应private属性
	 * 	 2.定义对应set/get方法
	 * 	 --set方法：把前台的值传到action中的属性值里
	 * 	 --get方法：让"请求的页面"通过el接收action中的属性值,请求中的属性放入值栈中(每个请求对应着一个值栈)
	 * 			 (el表达式是获取"当前请求"中的值) 
	 */
	private static final long serialVersionUID = 1L;
	private Long id;
	private String name;
	private Integer code;
	private List<Category> categoryList;
	
	private Category category;
	private ICategoryService categoryService = new CategoryServiceImpl();
	
	/**
	 * 跳转到添加栏目页面
	 * */
	@Action(value="toAddCategory", results={
			@Result(name="success",location="/WEB-INF/jsp/manager/addCategory.jsp")
			})
	public String toAddCategory(){
		return SUCCESS;//"success"
	}
	
	/**
	 * 跳转到修改栏目页面
	 * */
	@Action(value="toUpdCategory", results={
			@Result(name="success",location="/WEB-INF/jsp/manager/updCategory.jsp")})
	public String toUpdCategory(){
		//调用service层的方法通过id查询要修改栏目的信息
		category = categoryService.findById(id);
		
		return SUCCESS;
	}
	
	/**
	 * 跳转到栏目管理页面
	 * */
	@Action(value="toCategoryManager", results={
			@Result(name="success",location="/WEB-INF/jsp/manager/categoryManager.jsp")
			})
	public String toCategoryManager(){
		//调用service层的方法查询所有的栏目信息，并且将这些值赋给categoryList
		categoryList = categoryService.list();
		
		return SUCCESS;//"success"
	}
	
	/**
	 * 添加栏目
	 * */
	@Action(value="addCategory")
	public void addCategory() {
		Category category = new Category();
		category.setName(name);
		category.setCode(code);
		categoryService.add(category);
	}
	
	/**
	 * 删除栏目
	 * */
	@Action(value="delCategory")
	public void delCategory(){
		categoryService.delete(id);
	}
	
	/**
	 * 修改栏目
	 * */
	@Action(value="updCategory")
	public void updCategory(){
		//将接收到的参数进行封装，封装为一个对象
		Category category = new Category();
		category.setId(id);
		category.setName(name);
		category.setCode(code);
		//调用sercice层的服务，完成添加栏目的功能
		categoryService.update(category);
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

	public Integer getCode() {
		return code;
	}

	public void setCode(Integer code) {
		this.code = code;
	}
	
	public List<Category> getCategoryList() {
		return categoryList;
	}

	public void setCategoryList(List<Category> categoryList) {
		this.categoryList = categoryList;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}
	
}
