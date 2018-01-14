/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.project.modules.front.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.project.modules.front.entity.GameFrontUser;

/**
 * 前端用户DAO接口
 * @author 张青
 * @version 2018-01-14
 */
@MyBatisDao
public interface GameFrontUserDao extends CrudDao<GameFrontUser> {
	
}