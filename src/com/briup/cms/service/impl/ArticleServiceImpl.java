package com.mall.cn.service.impl;

import java.util.List;

import org.hibernate.Session;

import com.mall.cn.bean.Article;
import com.mall.cn.common.util.HibernateSessionFactory;
import com.mall.cn.dao.ArticleDao;
import com.mall.cn.service.IArticleService;

public class ArticleServiceImpl implements IArticleService {
	
	private ArticleDao articleDao = new ArticleDao();
	
	@Override
	public void add(Article article) {
		Session session = HibernateSessionFactory.getSession();
		session.beginTransaction();
		
		articleDao.save(article);
		
		//Assert.assertTrue(article.getId > 0); //junit的函数，测试是否满足条件
		
		session.getTransaction().commit();
		session.close();
	}

	@Override
	public List<Article> list() {
		Session session = HibernateSessionFactory.getSession();
		session.beginTransaction();
		
		List<Article> list = articleDao.findAll();
		
		session.getTransaction().commit();
		session.close(); //可能包延迟加载异常
		
		return list;
	}

	@Override
	public void delete(long id) {
		Session session = HibernateSessionFactory.getSession();
		session.beginTransaction();
		
		articleDao.deleteById(id);
		
		session.getTransaction().commit();
		session.close();	//可能包延迟加载异常
	}

	@Override
	public Article scanner(long id) {
		return null;
	}

	@Override
	public List<Article> listByCategory(long c_id) {

		return null;
	}

}
