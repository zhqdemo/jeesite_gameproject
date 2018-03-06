/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.project.modules.game.entity.part;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 物品Entity
 * @author 张青
 * @version 2018-03-06
 */
public class GamePartVal extends DataEntity<GamePartVal> {
	
	private static final long serialVersionUID = 1L;
	private Integer partType1;		// 一级类别
	private Integer partType2;		// 二级类别
	private Integer type;		// type
	private Long val;		// 值
	private GamePart gamePart;		// 物品ID 父类
	private String content;		// 内容
	private Long minVal;		// 最小值
	private Long maxVal;		// 最大值
	private String valType;		// 取值类型
	
	public GamePartVal() {
		super();
	}

	public GamePartVal(String id){
		super(id);
	}

	public GamePartVal(GamePart gamePart){
		this.gamePart = gamePart;
	}

	public Integer getPartType1() {
		return partType1;
	}

	public void setPartType1(Integer partType1) {
		this.partType1 = partType1;
	}
	
	public Integer getPartType2() {
		return partType2;
	}

	public void setPartType2(Integer partType2) {
		this.partType2 = partType2;
	}
	
	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}
	
	public Long getVal() {
		return val;
	}

	public void setVal(Long val) {
		this.val = val;
	}
	
	public GamePart getGamePart() {
		return gamePart;
	}

	public void setGamePart(GamePart gamePart) {
		this.gamePart = gamePart;
	}
	
	@Length(min=0, max=500, message="内容长度必须介于 0 和 500 之间")
	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
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
	
}