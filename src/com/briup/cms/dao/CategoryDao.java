package com.briup.cms.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import com.briup.cms.bean.Category;
import com.briup.cms.common.HibernateSessionFactory;

public class CategoryDao {
	
	//封装供本类用
	private Session getSession(){
		return HibernateSessionFactory.getSession();
	}
	
	/**
	 * 保存
	 * */
	public void save(Category category) {
		Session session = getSession();
		session.save(category);
	}
	
	/**
	 * 删除
	 * */
	public void deleteById(long id){
		Session session = getSession();
		Category c = (Category)session.load(Category.class, id);
		if(c != null){
			session.delete(c);
		}
	}
	
	/**
	 * 修改
	 * */
	public void update(Category category){
		Session session = getSession();
	    session.update(category);
	}
	
	/**
	 * 查询
	 * */
	@SuppressWarnings("unchecked") //为了"return query.list()"不报警告
	public List<Category> findAll() {
		String hql = "from Category";
		Query query = getSession().createQuery(hql);
		
		return query.list();
	}
	
	/**
	 * 通过id查询
	 * */
	public Category findById(long id){
		Session session = getSession();
		Category category = (Category)session.load(Category.class, id);
		System.out.println(category);
		
		return category;
	}
	
}
