/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.test.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.test.entity.TestData;

/**
 * 单表生成DAO接口
 * @author ThinkGem
 * @version 2018-01-31
 */
@MyBatisDao
public interface TestDataDao extends CrudDao<TestData> {
	
}