package com.briup.cms.service;

import java.util.List;

import com.briup.cms.bean.User;

public interface IUserService {
	//添加用户
	void add(User user);
	//列出所有用户
	List<User> list();
	//查询当前用户
	User find(User user);
	//删除用户
	void delete(long id);
}
