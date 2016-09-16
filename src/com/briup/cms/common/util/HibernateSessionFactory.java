package com.mall.cn.common.util;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

/**
 * 提供Session对象
 * session
 * */
public class HibernateSessionFactory {
	
	private static Configuration config;
	private static SessionFactory sessionFactory;
	private static ThreadLocal<Session> threadLocal;
	
	static{
		// 创建配置对象
		config = new Configuration();
		// 读取配置文件
		config.configure();
		// 创建工厂
		sessionFactory = config.buildSessionFactory();
		// 用来判断当前session为空或未打开
		threadLocal = new ThreadLocal<Session>();
	}
	
	public static Session getSession(){
		Session session = threadLocal.get();
		if(session==null || !session.isOpen()){
			session = sessionFactory.openSession();
			threadLocal.set(session);
		}
		//获取Session
		return session;
	}
}
