package com.mall.cn.bean;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;


/**
 * 文章类
 */
@Entity
@Table(name = "t_article")
public class Article {
	private Long id;
	private String title;	// 标题
	private String author;	// 作者
	private String content;	// 内容
	private Date publisurDate;	// 发布日期
	private Integer clickTimes;	// 点击次数
	// 多对一
	private Category category;

	@Id
	@GeneratedValue
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getPublisurDate() {
		return publisurDate;
	}

	public void setPublisurDate(Date publisurDate) {
		this.publisurDate = publisurDate;
	}

	public Integer getClickTimes() {
		return clickTimes;
	}

	public void setClickTimes(Integer clickTimes) {
		this.clickTimes = clickTimes;
	}

	@ManyToOne
	@JoinColumn(name = "c_id")
	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	@Override
	public String toString() {
		return "Article [id=" + id + ", title=" + title + ", author=" + author + ", content=" + content
				+ ", publisurDate=" + publisurDate + ", clickTimes=" + clickTimes + ", category=" + category + "]";
	}

}
