package com.mall.cn.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import com.mall.cn.bean.Goods;
import com.mall.cn.common.util.HibernateSessionFactory;

public class GoodsDao {
	
	//封装供本类用
	private Session getSession(){
		return HibernateSessionFactory.getSession();
	}
	
	/**
	 * 保存
	 * */
	public void save(Goods goods) {
		Session session = getSession();
		session.save(goods);
	}
	
	/**
	 * 删除
	 * */
	public void deleteById(long id){
		Session session = getSession();
		Goods g = (Goods)session.load(Goods.class, id);
		if(g != null){
			session.delete(g);
		}
	}
	
	/**
	 * 修改
	 * */
	public void update(Goods goods){
		Session session = getSession();
	    session.update(goods);
	}
	
	/**
	 * 查询
	 * */
	@SuppressWarnings("unchecked") //为了"return query.list()"不报警告
	public List<Goods> findAll() {
		String hql = "from Goods";
		Query query = getSession().createQuery(hql);
		
		return query.list();
	}
	
	/**
	 * 通过id查询
	 * */
	public Goods findById(long id){
		Session session = getSession();
		
		//Goods goods = (Goods)session.load(Goods.class, id); // 会存在延迟加载错误（session关闭后，才用到相应属性，hibernate才发出sql导致此时抄找不到session）
		Goods goods = (Goods)session.get(Goods.class, id);
		
		return goods;
	}

	/**
	 * 通过name查询
	 * */
	@SuppressWarnings("unchecked") //为了"return query.list()"不报警告
	public List<Goods> findByName(String name) {
		String hql = "from Goods g where g.name=?"; // g代表Goods的对象(非别名)，也可以from Goods where name=?
		Query query = getSession().createQuery(hql).setParameter(0, name);
		
		return query.list();
	}
}
