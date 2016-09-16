package com.mall.cn.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import com.mall.cn.bean.Category;
import com.mall.cn.common.util.HibernateSessionFactory;

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
		session.save(category); // 此处体现OR-Mapping，将category对象自动存到对应数据库表中
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
		
		// 注意延迟加载的问题（使用get()解决）
		Category category = (Category)session.load(Category.class, id);
		
		return category;
	}
	
}
