package com.briup.cms.service.impl;

import java.util.List;

import org.hibernate.Session;

import com.briup.cms.bean.Category;
import com.briup.cms.common.HibernateSessionFactory;
import com.briup.cms.dao.CategoryDao;
import com.briup.cms.service.ICategoryService;

public class CategoryServiceImpl implements ICategoryService {
	private CategoryDao categoryDao;
	
	public CategoryServiceImpl() {
		categoryDao = new CategoryDao();
	}
	
	@Override
	public void add(Category category) {
		Session session = HibernateSessionFactory.getSession();
		session.beginTransaction();
		
		categoryDao.save(category);
		
		//Assert.assertTrue(category.getId > 0); //junit的函数，测试是否满足条件
		
		session.getTransaction().commit();
		session.close();
	}

	@Override
	public List<Category> list() {
		Session session = HibernateSessionFactory.getSession();
		session.beginTransaction();
		
		List<Category> list = categoryDao.findAll();
		
		session.getTransaction().commit();
		session.close(); //可能包延迟加载异常
		
		return list;
	}
	
	@Override
	public Category findById(long id) {
		Session session = HibernateSessionFactory.getSession();
		session.beginTransaction();
		
		Category category = categoryDao.findById(id);
		
		session.getTransaction().commit();
		session.close(); //可能包延迟加载异常
		
		return category;
	}
	
	@Override
	public void delete(long id) {
		Session session = HibernateSessionFactory.getSession();
		session.beginTransaction();
		
		categoryDao.deleteById(id);
		
		session.getTransaction().commit();
		session.close();	//可能包延迟加载异常
	}

	@Override
	public void update(Category category) {
		Session session = HibernateSessionFactory.getSession();
		session.beginTransaction();
		
		categoryDao.update(category);
		
		session.getTransaction().commit();
		session.close();	//可能包延迟加载异常
	}

}
