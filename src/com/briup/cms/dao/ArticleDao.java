package com.briup.cms.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import com.briup.cms.bean.Article;
import com.briup.cms.common.HibernateSessionFactory;

public class ArticleDao  {
	
	//封装供本类用
	private Session getSession(){
		return HibernateSessionFactory.getSession();
	}
	
	/**
	 * 保存
	 * */
	public void save(Article article){
		Session session = getSession();
		session.save(article);
	}
	
	/**
	 * 删除
	 * */
	public void deleteById(long id){
		Session session = getSession();
		Article a = (Article)session.load(Article.class, id);
		if(a != null){
			session.delete(a);
		}
	}
	
	/**
	 * 查询所有
	 * */
	@SuppressWarnings("unchecked") //为了"return query.list()"不报警告
	public List<Article> findAll(){
		String hql = "from Article";
		Query query = getSession().createQuery(hql);
		
		return query.list();
	}
	
	
}
