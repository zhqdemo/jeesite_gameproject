/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.project.modules.game.entity.gameuser;

import org.hibernate.validator.constraints.Length;
import java.util.List;
import com.google.common.collect.Lists;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 用户Entity
 * @author 张青
 * @version 2018-03-06
 */
public class GameStgUser extends DataEntity<GameStgUser> {
	
	private static final long serialVersionUID = 1L;
	private String account;		// account
	private String username;		// 用户名称
	private String img;		// 用户头像
	private String state;		// 状态
	private String unbanTime;		// 解封时间
	private String expireTime;		// 到期时间
	private Long integral;		// 积分
	private Long residue;		// 剩余时间/点数
	private String chargeMode;		// 计费方式
	private List<GameUserPart> gameUserPartList = Lists.newArrayList();		// 子表列表
	private List<GameUserPlayer> gameUserPlayerList = Lists.newArrayList();		// 子表列表
	
	public GameStgUser() {
		super();
	}

	public GameStgUser(String id){
		super(id);
	}

	@Length(min=1, max=50, message="account长度必须介于 1 和 50 之间")
	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}
	
	@Length(min=0, max=60, message="用户名称长度必须介于 0 和 60 之间")
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}
	
	@Length(min=0, max=200, message="用户头像长度必须介于 0 和 200 之间")
	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}
	
	@Length(min=0, max=6, message="状态长度必须介于 0 和 6 之间")
	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}
	
	@Length(min=0, max=30, message="解封时间长度必须介于 0 和 30 之间")
	public String getUnbanTime() {
		return unbanTime;
	}

	public void setUnbanTime(String unbanTime) {
		this.unbanTime = unbanTime;
	}
	
	@Length(min=0, max=30, message="到期时间长度必须介于 0 和 30 之间")
	public String getExpireTime() {
		return expireTime;
	}

	public void setExpireTime(String expireTime) {
		this.expireTime = expireTime;
	}
	
	public Long getIntegral() {
		return integral;
	}

	public void setIntegral(Long integral) {
		this.integral = integral;
	}
	
	public Long getResidue() {
		return residue;
	}

	public void setResidue(Long residue) {
		this.residue = residue;
	}
	
	@Length(min=0, max=6, message="计费方式长度必须介于 0 和 6 之间")
	public String getChargeMode() {
		return chargeMode;
	}

	public void setChargeMode(String chargeMode) {
		this.chargeMode = chargeMode;
	}
	
	public List<GameUserPart> getGameUserPartList() {
		return gameUserPartList;
	}

	public void setGameUserPartList(List<GameUserPart> gameUserPartList) {
		this.gameUserPartList = gameUserPartList;
	}
	public List<GameUserPlayer> getGameUserPlayerList() {
		return gameUserPlayerList;
	}

	public void setGameUserPlayerList(List<GameUserPlayer> gameUserPlayerList) {
		this.gameUserPlayerList = gameUserPlayerList;
	}
}