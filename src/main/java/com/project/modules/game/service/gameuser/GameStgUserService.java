/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.project.modules.game.service.gameuser;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.project.modules.game.entity.gameuser.GameStgUser;
import com.project.modules.game.dao.gameuser.GameStgUserDao;
import com.project.modules.game.entity.gameuser.GameUserPart;
import com.project.modules.game.dao.gameuser.GameUserPartDao;
import com.project.modules.game.entity.gameuser.GameUserPlayer;
import com.project.modules.game.dao.gameuser.GameUserPlayerDao;

/**
 * 用户Service
 * @author 张青
 * @version 2018-03-06
 */
@Service
@Transactional(readOnly = true)
public class GameStgUserService extends CrudService<GameStgUserDao, GameStgUser> {

	@Autowired
	private GameUserPartDao gameUserPartDao;
	@Autowired
	private GameUserPlayerDao gameUserPlayerDao;
	
	public GameStgUser get(String id) {
		GameStgUser gameStgUser = super.get(id);
		gameStgUser.setGameUserPartList(gameUserPartDao.findList(new GameUserPart(gameStgUser)));
		gameStgUser.setGameUserPlayerList(gameUserPlayerDao.findList(new GameUserPlayer(gameStgUser)));
		return gameStgUser;
	}
	
	public List<GameStgUser> findList(GameStgUser gameStgUser) {
		return super.findList(gameStgUser);
	}
	
	public Page<GameStgUser> findPage(Page<GameStgUser> page, GameStgUser gameStgUser) {
		return super.findPage(page, gameStgUser);
	}
	
	@Transactional(readOnly = false)
	public void save(GameStgUser gameStgUser) {
		super.save(gameStgUser);
		for (GameUserPart gameUserPart : gameStgUser.getGameUserPartList()){
			if (gameUserPart.getId() == null){
				continue;
			}
			if (GameUserPart.DEL_FLAG_NORMAL.equals(gameUserPart.getDelFlag())){
				if (StringUtils.isBlank(gameUserPart.getId())){
					gameUserPart.setGameStgUser(gameStgUser);
					gameUserPart.preInsert();
					gameUserPartDao.insert(gameUserPart);
				}else{
					gameUserPart.preUpdate();
					gameUserPartDao.update(gameUserPart);
				}
			}else{
				gameUserPartDao.delete(gameUserPart);
			}
		}
		for (GameUserPlayer gameUserPlayer : gameStgUser.getGameUserPlayerList()){
			if (gameUserPlayer.getId() == null){
				continue;
			}
			if (GameUserPlayer.DEL_FLAG_NORMAL.equals(gameUserPlayer.getDelFlag())){
				if (StringUtils.isBlank(gameUserPlayer.getId())){
					gameUserPlayer.setGameStgUser(gameStgUser);
					gameUserPlayer.preInsert();
					gameUserPlayerDao.insert(gameUserPlayer);
				}else{
					gameUserPlayer.preUpdate();
					gameUserPlayerDao.update(gameUserPlayer);
				}
			}else{
				gameUserPlayerDao.delete(gameUserPlayer);
			}
		}
	}
	
	@Transactional(readOnly = false)
	public void delete(GameStgUser gameStgUser) {
		super.delete(gameStgUser);
		gameUserPartDao.delete(new GameUserPart(gameStgUser));
		gameUserPlayerDao.delete(new GameUserPlayer(gameStgUser));
	}
	
}