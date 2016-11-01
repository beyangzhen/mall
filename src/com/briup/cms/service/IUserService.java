package com.mall.cn.service;

import java.util.List;

import com.mall.cn.bean.User;

public interface IUserService {
	// 添加用户
	void add(User user);
	// 列出所有用户
	List<User> list();
	// 查询当前用户
	User findByUser(User user);
	// 根据id查询当前用户
	User findById(long id);
	// 删除用户
	void delete(long id);
	// 修改用户
	public void update(User user);
}
