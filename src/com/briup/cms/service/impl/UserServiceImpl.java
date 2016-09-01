package com.briup.cms.service.impl;

import java.util.List;

import org.hibernate.Session;

import com.briup.cms.bean.User;
import com.briup.cms.common.HibernateSessionFactory;
import com.briup.cms.dao.UserDao;
import com.briup.cms.service.IUserService;

public class UserServiceImpl implements IUserService {
	UserDao userDao;
	
	public UserServiceImpl() {
		userDao = new UserDao();
	}

	@Override
	public void add(User user) {
		Session session = HibernateSessionFactory.getSession();
		session.beginTransaction();
		
		userDao.save(user);
		
		Assert.assertTrue(user.getId > 0);
		
		session.getTransaction().commit();
		session.close();
	}

	@Override
	public List<User> list() {
		Session session = HibernateSessionFactory.getSession();
		session.beginTransaction();
		
		List<User> list = userDao.findAll();
		
		session.getTransaction().commit();
		session.close(); //可能包延迟加载异常
		
		return list;
	}
	
	@Override
	public User find(User user) {
		Session session = HibernateSessionFactory.getSession();
		session.beginTransaction();
		
		User user2 = userDao.query(user);
		
		session.getTransaction().commit();
		session.close(); //可能包延迟加载异常
		
		return user2;
	}

	@Override
	public void delete(long id) {
		Session session = HibernateSessionFactory.getSession();
		session.beginTransaction();
		
		userDao.deleteById(id);
		
		session.getTransaction().commit();
		session.close(); //可能包延迟加载异常
	}

}
