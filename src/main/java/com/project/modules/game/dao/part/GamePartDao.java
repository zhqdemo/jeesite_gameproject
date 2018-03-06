/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.project.modules.game.dao.part;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.project.modules.game.entity.part.GamePart;

/**
 * 物品DAO接口
 * @author 张青
 * @version 2018-03-06
 */
@MyBatisDao
public interface GamePartDao extends CrudDao<GamePart> {
	
}