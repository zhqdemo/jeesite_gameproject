/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.project.modules.zhq.entity;

import com.fasterxml.jackson.annotation.JsonBackReference;
import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.TreeEntity;

/**
 * 分类信息Entity
 * @author 张青
 * @version 2018-02-01
 */
public class ZhqCategory extends TreeEntity<ZhqCategory> {
	
	private static final long serialVersionUID = 1L;
	private ZhqCategory parent;		// 父ID
	private String parentIds;		// 路径
	private String name;		// 分类名字
	private String img;		// 配图
	private String code;		// 识别码
	private Integer state;		// 状态
	private Integer level;		// 级别
	private Integer confType;		// 其他配置类型
	private String confValue;		// 其他配置值
	private Integer sort;		// 排序
	
	public ZhqCategory() {
		super();
	}

	public ZhqCategory(String id){
		super(id);
	}

	@JsonBackReference
	public ZhqCategory getParent() {
		return parent;
	}

	public void setParent(ZhqCategory parent) {
		this.parent = parent;
	}
	
	@Length(min=0, max=20, message="路径长度必须介于 0 和 20 之间")
	public String getParentIds() {
		return parentIds;
	}

	public void setParentIds(String parentIds) {
		this.parentIds = parentIds;
	}
	
	@Length(min=0, max=200, message="分类名字长度必须介于 0 和 200 之间")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	@Length(min=0, max=200, message="配图长度必须介于 0 和 200 之间")
	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}
	
	@Length(min=0, max=20, message="识别码长度必须介于 0 和 20 之间")
	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}
	
	public Integer getState() {
		return state;
	}

	public void setState(Integer state) {
		this.state = state;
	}
	
	public Integer getLevel() {
		return level;
	}

	public void setLevel(Integer level) {
		this.level = level;
	}
	
	public Integer getConfType() {
		return confType;
	}

	public void setConfType(Integer confType) {
		this.confType = confType;
	}
	
	@Length(min=0, max=200, message="其他配置值长度必须介于 0 和 200 之间")
	public String getConfValue() {
		return confValue;
	}

	public void setConfValue(String confValue) {
		this.confValue = confValue;
	}
	
	public Integer getSort() {
		return sort;
	}

	public void setSort(Integer sort) {
		this.sort = sort;
	}
	
	public String getParentId() {
		return parent != null && parent.getId() != null ? parent.getId() : "0";
	}
}