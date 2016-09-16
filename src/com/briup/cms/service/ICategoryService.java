package com.mall.cn.service;

import java.util.List;

import com.mall.cn.bean.Category;

/**
 * 栏目管理的业务逻辑
 * */
public interface ICategoryService {
	//添加栏目
	void add(Category category);
	//列出所有栏目
	List<Category> list();
	//通过id获取栏目信息
	Category findById(long id);
	//删除栏目
	void delete(long id);
	//修改栏目信息
	void update(Category category);
}
