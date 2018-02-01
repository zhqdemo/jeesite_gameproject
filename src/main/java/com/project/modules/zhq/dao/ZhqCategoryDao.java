/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.project.modules.zhq.dao;

import com.thinkgem.jeesite.common.persistence.TreeDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.project.modules.zhq.entity.ZhqCategory;

/**
 * 分类信息DAO接口
 * @author 张青
 * @version 2018-02-01
 */
@MyBatisDao
public interface ZhqCategoryDao extends TreeDao<ZhqCategory> {
	
}