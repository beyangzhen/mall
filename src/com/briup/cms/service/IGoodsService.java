package com.mall.cn.service;

import java.util.List;

import com.mall.cn.bean.Goods;

/**
 * 商品管理的业务逻辑
 * */
public interface IGoodsService {
	//添加商品
	void add(Goods goods);
	//列出所有商品
	List<Goods> list();
	//通过id获取商品信息
	Goods findById(long id);
	//通过name获取商品信息
	List<Goods> findByName(String name);
	//删除商品
	void delete(long id);
	//修改商品信息
	void update(Goods goods);
}
