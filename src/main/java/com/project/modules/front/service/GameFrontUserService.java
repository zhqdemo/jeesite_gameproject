/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.project.modules.front.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.project.modules.front.entity.GameFrontUser;
import com.project.modules.front.dao.GameFrontUserDao;

/**
 * 前端用户Service
 * @author 张青
 * @version 2018-01-14
 */
@Service
@Transactional(readOnly = true)
public class GameFrontUserService extends CrudService<GameFrontUserDao, GameFrontUser> {

	public GameFrontUser get(String id) {
		return super.get(id);
	}
	
	public List<GameFrontUser> findList(GameFrontUser gameFrontUser) {
		return super.findList(gameFrontUser);
	}
	
	public Page<GameFrontUser> findPage(Page<GameFrontUser> page, GameFrontUser gameFrontUser) {
		return super.findPage(page, gameFrontUser);
	}
	
	@Transactional(readOnly = false)
	public void save(GameFrontUser gameFrontUser) {
		super.save(gameFrontUser);
	}
	
	@Transactional(readOnly = false)
	public void delete(GameFrontUser gameFrontUser) {
		super.delete(gameFrontUser);
	}
	
}