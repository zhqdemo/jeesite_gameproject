/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.project.modules.game.entity.part;

import org.hibernate.validator.constraints.Length;
import javax.validation.constraints.NotNull;
import java.util.List;
import com.google.common.collect.Lists;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 物品Entity
 * @author 张青
 * @version 2018-03-06
 */
public class GamePart extends DataEntity<GamePart> {
	
	private static final long serialVersionUID = 1L;
	private String partName;		// 物品名称
	private Integer partType;		// 物品类型
	private Integer partState;		// 物品状态
	private String content;		// 描述
	private Long val;		// 值
	private Long minVal;		// 最小值
	private Long maxVal;		// 最大值
	private String valType;		// 取值类型
	private Integer level;		// 品阶
	private Integer star;		// 星级
	private String img;		// 配图
	private Long maxAmount;		// 最大堆数量
	private List<GamePartVal> gamePartValList = Lists.newArrayList();		// 子表列表
	
	public GamePart() {
		super();
	}

	public GamePart(String id){
		super(id);
	}

	@Length(min=1, max=50, message="物品名称长度必须介于 1 和 50 之间")
	public String getPartName() {
		return partName;
	}

	public void setPartName(String partName) {
		this.partName = partName;
	}
	
	@NotNull(message="物品类型不能为空")
	public Integer getPartType() {
		return partType;
	}

	public void setPartType(Integer partType) {
		this.partType = partType;
	}
	
	public Integer getPartState() {
		return partState;
	}

	public void setPartState(Integer partState) {
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
	
	public Integer getLevel() {
		return level;
	}

	public void setLevel(Integer level) {
		this.level = level;
	}
	
	public Integer getStar() {
		return star;
	}

	public void setStar(Integer star) {
		this.star = star;
	}
	
	@Length(min=0, max=200, message="配图长度必须介于 0 和 200 之间")
	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}
	
	public Long getMaxAmount() {
		return maxAmount;
	}

	public void setMaxAmount(Long maxAmount) {
		this.maxAmount = maxAmount;
	}
	
	public List<GamePartVal> getGamePartValList() {
		return gamePartValList;
	}

	public void setGamePartValList(List<GamePartVal> gamePartValList) {
		this.gamePartValList = gamePartValList;
	}
}