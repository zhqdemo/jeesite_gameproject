/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.project.modules.front.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 前端用户Entity
 * @author 张青
 * @version 2018-01-14
 */
public class GameFrontUser extends DataEntity<GameFrontUser> {
	
	private static final long serialVersionUID = 1L;
	private String account;		// 帐号
	private String password;		// 密码
	private String email;		// 邮箱
	private String telphone;		// 电话
	private String idcard;		// 身份证号
	private String state;		// 状态
	private String img;		// 头像
	private String lastLogintime;		// 最后登录时间
	private String lastLoginaddress;		// 最后登录地点
	private String beginLastLogintime;		// 开始 最后登录时间
	private String endLastLogintime;		// 结束 最后登录时间
	
	public GameFrontUser() {
		super();
	}

	public GameFrontUser(String id){
		super(id);
	}

	@Length(min=1, max=50, message="帐号长度必须介于 1 和 50 之间")
	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}
	
	@Length(min=1, max=50, message="密码长度必须介于 1 和 50 之间")
	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
	@Length(min=0, max=50, message="邮箱长度必须介于 0 和 50 之间")
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
	@Length(min=0, max=50, message="电话长度必须介于 0 和 50 之间")
	public String getTelphone() {
		return telphone;
	}

	public void setTelphone(String telphone) {
		this.telphone = telphone;
	}
	
	@Length(min=0, max=50, message="身份证号长度必须介于 0 和 50 之间")
	public String getIdcard() {
		return idcard;
	}

	public void setIdcard(String idcard) {
		this.idcard = idcard;
	}
	
	@Length(min=1, max=6, message="状态长度必须介于 1 和 6 之间")
	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}
	
	@Length(min=0, max=1000, message="头像长度必须介于 0 和 1000 之间")
	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}
	
	@Length(min=0, max=30, message="最后登录时间长度必须介于 0 和 30 之间")
	public String getLastLogintime() {
		return lastLogintime;
	}

	public void setLastLogintime(String lastLogintime) {
		this.lastLogintime = lastLogintime;
	}
	
	@Length(min=0, max=20, message="最后登录地点长度必须介于 0 和 20 之间")
	public String getLastLoginaddress() {
		return lastLoginaddress;
	}

	public void setLastLoginaddress(String lastLoginaddress) {
		this.lastLoginaddress = lastLoginaddress;
	}
	
	public String getBeginLastLogintime() {
		return beginLastLogintime;
	}

	public void setBeginLastLogintime(String beginLastLogintime) {
		this.beginLastLogintime = beginLastLogintime;
	}
	
	public String getEndLastLogintime() {
		return endLastLogintime;
	}

	public void setEndLastLogintime(String endLastLogintime) {
		this.endLastLogintime = endLastLogintime;
	}
		
}