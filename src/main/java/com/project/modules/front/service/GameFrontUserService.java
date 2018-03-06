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
import com.project.util.Error;
import com.project.modules.front.dao.GameFrontUserDao;

/**
 * 前端用户Service
 * @author 张青
 * @version 2018-03-06
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
		if(gameFrontUser.getId()!=null){
			GameFrontUser temp = this.get(new GameFrontUser(gameFrontUser.getId()));
			if(gameFrontUser.getPassword()==null){
				gameFrontUser.setPassword(temp.getPassword());
			}
		}
		super.save(gameFrontUser);
	}
	
	@Transactional(readOnly = false)
	public void delete(GameFrontUser gameFrontUser) {
		super.delete(gameFrontUser);
	}
	public int login(String account,String password){
		List<GameFrontUser> userlist = this.dao.getUserByAccount(account);
		if(userlist==null||userlist.size()==0){
			return Error.ERR_ACCOUNT_NOT_EXIST;
		}
		GameFrontUser user = userlist.get(0);
		if(!user.getPassword().equals(password)){
			return Error.ERR_PASSWORD_WRONG;
		}		
		return Error.ERR_SUCCESS;
	}
	public GameFrontUser getUserByAccount(String account){
		List<GameFrontUser> userlist = this.dao.getUserByAccount(account);
		if(userlist==null||userlist.size()==0){
			return null;
		}else{
			return userlist.get(0);
		}
	}
	
}