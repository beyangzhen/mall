package com.mall.cn.service.impl;

import java.util.List;

import org.hibernate.Session;

import com.mall.cn.bean.User;
import com.mall.cn.common.util.HibernateSessionFactory;
import com.mall.cn.dao.UserDao;
import com.mall.cn.service.IUserService;


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

		// Assert.assertTrue(user.getId > 0); //junit的函数，测试是否满足条件

		session.getTransaction().commit();
		session.close();
	}

	@Override
	public List<User> list() {
		Session session = HibernateSessionFactory.getSession();
		session.beginTransaction();

		List<User> list = userDao.findAll();

		session.getTransaction().commit();
		session.close(); // 可能包延迟加载异常

		return list;
	}

	@Override
	public User findByUser(User user) {
		Session session = HibernateSessionFactory.getSession();
		session.beginTransaction();

		User user2 = userDao.query(user);

		session.getTransaction().commit();
		session.close(); // 可能包延迟加载异常

		return user2;
	}

	@Override
	public User findById(long id) {
		Session session = HibernateSessionFactory.getSession();
		session.beginTransaction();

		User user = userDao.findById(id);

		session.getTransaction().commit();
		session.close(); // 可能包延迟加载异常

		return user;
	}

	@Override
	public void delete(long id) {
		Session session = HibernateSessionFactory.getSession();
		session.beginTransaction();

		userDao.deleteById(id);

		session.getTransaction().commit();
		session.close(); // 可能包延迟加载异常
	}

	@Override
	public void update(User user) {
		Session session = HibernateSessionFactory.getSession();
		session.beginTransaction();

		userDao.update(user);

		session.getTransaction().commit();
		session.close(); // 可能包延迟加载异常
	}

	@Override
	public void recharge(User user) {
		Session session = HibernateSessionFactory.getSession();
		session.beginTransaction();

		userDao.update(user);

		session.getTransaction().commit();
		session.close(); // 可能包延迟加载异常
	}

}
