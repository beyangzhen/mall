package com.mall.cn.service.impl;

import java.util.List;

import org.hibernate.Session;

import com.mall.cn.bean.Goods;
import com.mall.cn.common.util.HibernateSessionFactory;
import com.mall.cn.dao.GoodsDao;
import com.mall.cn.service.IGoodsService;

public class GoodsServiceImpl implements IGoodsService {
	private GoodsDao goodsDao;
	
	public GoodsServiceImpl() {
		goodsDao = new GoodsDao();
	}

	@Override
	public void add(Goods goods) {
		Session session = HibernateSessionFactory.getSession();
		session.beginTransaction();
		
		goodsDao.save(goods);
		
		//Assert.assertTrue(goods.getId > 0); //junit的函数，测试是否满足条件
		
		session.getTransaction().commit();
		session.close();
	}

	@Override
	public List<Goods> list() {
		Session session = HibernateSessionFactory.getSession();
		session.beginTransaction();
		
		List<Goods> list = goodsDao.findAll();
		
		session.getTransaction().commit();
		session.close(); //可能包延迟加载异常
		
		return list;
	}
	
	@Override
	public Goods findById(long id) {
		Session session = HibernateSessionFactory.getSession();
		session.beginTransaction();
		
		Goods goods = goodsDao.findById(id);
		
		session.getTransaction().commit();
		session.close(); //可能包延迟加载异常
		
		return goods;
	}
	
	@Override
	public List<Goods> findByName(String name) {
		Session session = HibernateSessionFactory.getSession();
		session.beginTransaction();
		
		List<Goods> list = goodsDao.findByName(name);
		
		session.getTransaction().commit();
		session.close(); //可能包延迟加载异常
		
		return list;
	}
	
	@Override
	public void delete(long id) {
		Session session = HibernateSessionFactory.getSession();
		session.beginTransaction();
		
		goodsDao.deleteById(id);
		
		session.getTransaction().commit();
		session.close(); //可能包延迟加载异常
	}

	@Override
	public void update(Goods goods) {
		Session session = HibernateSessionFactory.getSession();
		session.beginTransaction();
		
		goodsDao.update(goods);
		
		session.getTransaction().commit();
		session.close(); //可能包延迟加载异常
	}
}
