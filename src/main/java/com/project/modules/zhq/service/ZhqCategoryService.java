/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.project.modules.zhq.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.service.TreeService;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.project.modules.zhq.entity.ZhqCategory;
import com.project.modules.zhq.dao.ZhqCategoryDao;

/**
 * 分类信息Service
 * @author 张青
 * @version 2018-02-01
 */
@Service
@Transactional(readOnly = true)
public class ZhqCategoryService extends TreeService<ZhqCategoryDao, ZhqCategory> {

	public ZhqCategory get(String id) {
		return super.get(id);
	}
	
	public List<ZhqCategory> findList(ZhqCategory zhqCategory) {
		if (StringUtils.isNotBlank(zhqCategory.getParentIds())){
			zhqCategory.setParentIds(","+zhqCategory.getParentIds()+",");
		}
		return super.findList(zhqCategory);
	}
	
	@Transactional(readOnly = false)
	public void save(ZhqCategory zhqCategory) {
		super.save(zhqCategory);
	}
	
	@Transactional(readOnly = false)
	public void delete(ZhqCategory zhqCategory) {
		super.delete(zhqCategory);
	}
	
}