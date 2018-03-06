/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.project.modules.game.service.part;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.project.modules.game.entity.part.GamePart;
import com.project.modules.game.dao.part.GamePartDao;
import com.project.modules.game.entity.part.GamePartVal;
import com.project.modules.game.dao.part.GamePartValDao;

/**
 * 物品Service
 * @author 张青
 * @version 2018-03-06
 */
@Service
@Transactional(readOnly = true)
public class GamePartService extends CrudService<GamePartDao, GamePart> {

	@Autowired
	private GamePartValDao gamePartValDao;
	
	public GamePart get(String id) {
		GamePart gamePart = super.get(id);
		gamePart.setGamePartValList(gamePartValDao.findList(new GamePartVal(gamePart)));
		return gamePart;
	}
	
	public List<GamePart> findList(GamePart gamePart) {
		return super.findList(gamePart);
	}
	
	public Page<GamePart> findPage(Page<GamePart> page, GamePart gamePart) {
		return super.findPage(page, gamePart);
	}
	
	@Transactional(readOnly = false)
	public void save(GamePart gamePart) {
		super.save(gamePart);
		for (GamePartVal gamePartVal : gamePart.getGamePartValList()){
			if (gamePartVal.getId() == null){
				continue;
			}
			if (GamePartVal.DEL_FLAG_NORMAL.equals(gamePartVal.getDelFlag())){
				if (StringUtils.isBlank(gamePartVal.getId())){
					gamePartVal.setGamePart(gamePart);
					gamePartVal.preInsert();
					gamePartValDao.insert(gamePartVal);
				}else{
					gamePartVal.preUpdate();
					gamePartValDao.update(gamePartVal);
				}
			}else{
				gamePartValDao.delete(gamePartVal);
			}
		}
	}
	
	@Transactional(readOnly = false)
	public void delete(GamePart gamePart) {
		super.delete(gamePart);
		gamePartValDao.delete(new GamePartVal(gamePart));
	}
	
}