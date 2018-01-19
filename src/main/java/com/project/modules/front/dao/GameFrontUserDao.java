/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.project.modules.front.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.project.modules.front.entity.GameFrontUser;

/**
 * 前端用户DAO接口
 * @author 张青
 * @version 2018-01-14
 */
@MyBatisDao
public interface GameFrontUserDao extends CrudDao<GameFrontUser> {
	@Select("select * from game_front_user where account=#{account} and del_flag = "+GameFrontUser.DEL_FLAG_NORMAL)
	public List<GameFrontUser> getUserByAccount(String account);
}