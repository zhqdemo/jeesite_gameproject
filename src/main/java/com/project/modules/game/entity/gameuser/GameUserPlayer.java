/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.project.modules.game.entity.gameuser;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 用户Entity
 * @author 张青
 * @version 2018-03-06
 */
public class GameUserPlayer extends DataEntity<GameUserPlayer> {
	
	private static final long serialVersionUID = 1L;
	private GameStgUser gameStgUser;		// 帐号 父类
	private String playerName;		// 角色名称
	private String img;		// 配图
	
	public GameUserPlayer() {
		super();
	}

	public GameUserPlayer(String id){
		super(id);
	}

	public GameUserPlayer(GameStgUser gameStgUser){
		this.gameStgUser = gameStgUser;
	}

	@Length(min=0, max=30, message="帐号长度必须介于 0 和 30 之间")
	public GameStgUser getGameStgUser() {
		return gameStgUser;
	}

	public void setGameStgUser(GameStgUser gameStgUser) {
		this.gameStgUser = gameStgUser;
	}
	
	@Length(min=0, max=30, message="角色名称长度必须介于 0 和 30 之间")
	public String getPlayerName() {
		return playerName;
	}

	public void setPlayerName(String playerName) {
		this.playerName = playerName;
	}
	
	@Length(min=0, max=200, message="配图长度必须介于 0 和 200 之间")
	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}
	
}