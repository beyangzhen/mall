package com.mall.cn.bean;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * 栏目
 * */
@Entity
@Table(name="t_category")
public class Category {
	private Long id;
	private String name;
	private Integer code;
	//一对多
	private Set<Article> articles = new HashSet<Article>();
	//一对多
	private Set<Goods> goods = new HashSet<Goods>();
	
	@Id
	@GeneratedValue
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
	public Integer getCode() {
		return code;
	}
	public void setCode(Integer code) {
		this.code = code;
	}
	@OneToMany(mappedBy="category", 
			cascade={CascadeType.ALL}
	)
	public Set<Article> getArticles() {
		return articles;
	}
	public void setArticles(Set<Article> articles) {
		this.articles = articles;
	}
	@OneToMany(mappedBy="category", 
			cascade={CascadeType.ALL}
	)
	public Set<Goods> getGoods() {
		return goods;
	}
	public void setGoods(Set<Goods> goods) {
		this.goods = goods;
	}	
	
}
