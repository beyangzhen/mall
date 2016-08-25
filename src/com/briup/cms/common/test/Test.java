package com.briup.cms.common.test;


import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;


public class Test {
	public static void main(String[] args) {
		//1.创建配置对象 
		Configuration config = new Configuration();
		//2. 读取配置文件  src/hibernate.cfg.xml
		config.configure();
		//3. 创建连接工厂
		SessionFactory factory= config.buildSessionFactory();
		//4.创建会话
		Session session = factory.openSession();
		//5.开启事务
		Transaction tran = session.beginTransaction();
		
		//6.事务提交
		tran.commit();
		//7.会话结束
		session.close();
		System.out.println("----");
	}
}
