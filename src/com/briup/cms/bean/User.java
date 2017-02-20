package com.mall.cn.bean;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;


/**
 * 用户类
 */
@Entity
@Table(name = "t_user")
public class User {
	private Long id;
	private String username; // 用户名
	private String password; // 密码
	/**
	 * 用户级别（M为管理员，A为钻石会员，B为黄金会员，C为大众会员） M：折扣为 0.85 A：>1000 积分，折扣为 0.85 B：500~1000积分，折扣为 0.9 C：<500
	 * 积分，折扣为 1
	 */
	private String level;
	/**
	 * 用户积分（每消费1元，增加1积分）
	 */
	private Integer score;
	private String phone; 	 // 联系电话
	private String address;  // 地址
	private Double account;  // 账户金额

	@Id
	@GeneratedValue
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getLevel() {
		return level;
	}

	public void setLevel(String level) {
		this.level = level;
	}

	public Integer getScore() {
		return score;
	}

	public void setScore(Integer score) {
		this.score = score;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Double getAccount() {
		return account;
	}

	public void setAccount(Double account) {
		this.account = account;
	}

}
