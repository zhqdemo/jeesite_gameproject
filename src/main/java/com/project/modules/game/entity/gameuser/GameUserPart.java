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
public class GameUserPart extends DataEntity<GameUserPart> {
	
	private static final long serialVersionUID = 1L;
	private GameStgUser gameStgUser;		// 帐号 父类
	private Long roleId;		// 角色ID
	private String partName;		// 物品名称
	private String partType;		// 物品类型
	private String partState;		// 物品状态
	private String content;		// 描述
	private Long val;		// 值
	private Long minVal;		// 最小值
	private Long maxVal;		// 最大值
	private String valType;		// 取值类型
	private String level;		// 品阶
	private String star;		// 星级
	private String position;		// 物品位置
	private String img;		// 配图
	private Long amount;		// 物品数量
	private Long modelId;		// 物品模板ID
	
	public GameUserPart() {
		super();
	}

	public GameUserPart(String id){
		super(id);
	}

	public GameUserPart(GameStgUser gameStgUser){
		this.gameStgUser = gameStgUser;
	}

	@Length(min=0, max=30, message="帐号长度必须介于 0 和 30 之间")
	public GameStgUser getGameStgUser() {
		return gameStgUser;
	}

	public void setGameStgUser(GameStgUser gameStgUser) {
		this.gameStgUser = gameStgUser;
	}
	
	public Long getRoleId() {
		return roleId;
	}

	public void setRoleId(Long roleId) {
		this.roleId = roleId;
	}
	
	@Length(min=1, max=50, message="物品名称长度必须介于 1 和 50 之间")
	public String getPartName() {
		return partName;
	}

	public void setPartName(String partName) {
		this.partName = partName;
	}
	
	@Length(min=1, max=6, message="物品类型长度必须介于 1 和 6 之间")
	public String getPartType() {
		return partType;
	}

	public void setPartType(String partType) {
		this.partType = partType;
	}
	
	@Length(min=0, max=6, message="物品状态长度必须介于 0 和 6 之间")
	public String getPartState() {
		return partState;
	}

	public void setPartState(String partState) {
		this.partState = partState;
	}
	
	@Length(min=0, max=1000, message="描述长度必须介于 0 和 1000 之间")
	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
	
	public Long getVal() {
		return val;
	}

	public void setVal(Long val) {
		this.val = val;
	}
	
	public Long getMinVal() {
		return minVal;
	}

	public void setMinVal(Long minVal) {
		this.minVal = minVal;
	}
	
	public Long getMaxVal() {
		return maxVal;
	}

	public void setMaxVal(Long maxVal) {
		this.maxVal = maxVal;
	}
	
	@Length(min=0, max=6, message="取值类型长度必须介于 0 和 6 之间")
	public String getValType() {
		return valType;
	}

	public void setValType(String valType) {
		this.valType = valType;
	}
	
	@Length(min=0, max=11, message="品阶长度必须介于 0 和 11 之间")
	public String getLevel() {
		return level;
	}

	public void setLevel(String level) {
		this.level = level;
	}
	
	@Length(min=0, max=11, message="星级长度必须介于 0 和 11 之间")
	public String getStar() {
		return star;
	}

	public void setStar(String star) {
		this.star = star;
	}
	
	@Length(min=0, max=6, message="物品位置长度必须介于 0 和 6 之间")
	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}
	
	@Length(min=0, max=200, message="配图长度必须介于 0 和 200 之间")
	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}
	
	public Long getAmount() {
		return amount;
	}

	public void setAmount(Long amount) {
		this.amount = amount;
	}
	
	public Long getModelId() {
		return modelId;
	}

	public void setModelId(Long modelId) {
		this.modelId = modelId;
	}
	
}