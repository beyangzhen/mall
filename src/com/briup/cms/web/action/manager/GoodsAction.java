package com.mall.cn.web.action.manager;

import org.apache.struts2.convention.annotation.Action;

import com.mall.cn.bean.Goods;
import com.mall.cn.service.IGoodsService;
import com.mall.cn.service.impl.GoodsServiceImpl;
import com.opensymphony.xwork2.ActionSupport;

public class GoodsAction extends ActionSupport{
	private static final long serialVersionUID = 1L;
	private Long id;
	private String name;  
	private Double price; 
	private String size;  
	private int amount;   
	private String type;  

	private IGoodsService goodsService = new GoodsServiceImpl();
	
	/**
	 * 修改商品
	 * */
	@Action(value="updGoods")
	public void updGoods(){
		//将接收到的参数进行封装，封装为一个对象
		Goods goods = new Goods();
		goods.setId(id);
		goods.setName(name);
		goods.setPrice(price);
		goods.setSize(size);
		goods.setAmount(amount);
		goods.setType(type);
		
		//调用sercice层的服务，完成修改商品的功能
		goodsService.update(goods);
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public String getSize() {
		return size;
	}

	public void setSize(String size) {
		this.size = size;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
	
}
