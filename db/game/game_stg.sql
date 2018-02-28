SET SESSION FOREIGN_KEY_CHECKS=0;

/* Drop Tables */

DROP TABLE IF EXISTS game_gift_config;
DROP TABLE IF EXISTS game_gift_record;
DROP TABLE IF EXISTS game_log;
DROP TABLE IF EXISTS game_part;
DROP TABLE IF EXISTS game_part_val;
DROP TABLE IF EXISTS game_player_part;
DROP TABLE IF EXISTS game_role_bag;
DROP TABLE IF EXISTS game_stg_user;
DROP TABLE IF EXISTS game_user_bag;
DROP TABLE IF EXISTS game_user_part;
DROP TABLE IF EXISTS game_user_part_val;
DROP TABLE IF EXISTS game_user_player;
DROP TABLE IF EXISTS zhq_category;




/* Create Tables */

CREATE TABLE game_gift_config
(
	id bigint NOT NULL AUTO_INCREMENT,
	PRIMARY KEY (id)
);


CREATE TABLE game_gift_record
(
	id bigint NOT NULL AUTO_INCREMENT,
	PRIMARY KEY (id)
);


CREATE TABLE game_log
(
	id bigint NOT NULL AUTO_INCREMENT,
	-- 帐号
	account varchar(30) COMMENT '帐号',
	-- 操作类型
	opertype smallint COMMENT '操作类型',
	-- 受影响表
	affect_table varchar(50) COMMENT '受影响表',
	-- 受影响ID
	affect_id bigint COMMENT '受影响ID',
	-- 操作内容
	content varchar(1000) COMMENT '操作内容',
	-- 创建者
	create_by varchar(64) NOT NULL COMMENT '创建者',
	-- 创建时间
	create_date datetime NOT NULL COMMENT '创建时间',
	-- 更新者
	update_by varchar(64) NOT NULL COMMENT '更新者',
	-- 更新时间
	update_date datetime NOT NULL COMMENT '更新时间',
	-- 备注信息
	remarks varchar(255) COMMENT '备注信息',
	-- 删除标记（0：正常；1：删除）
	del_flag char(1) DEFAULT '0' NOT NULL COMMENT '删除标记（0：正常；1：删除）',
	PRIMARY KEY (id)
);


CREATE TABLE game_part
(
	id bigint NOT NULL AUTO_INCREMENT,
	-- 物品名称
	part_name varchar(50) NOT NULL COMMENT '物品名称',
	-- 物品类型
	part_type smallint DEFAULT 0 NOT NULL COMMENT '物品类型',
	-- 物品状态
	part_state smallint DEFAULT 0 COMMENT '物品状态',
	-- 描述
	content varchar(1000) COMMENT '描述',
	-- 值
	val bigint DEFAULT 0 COMMENT '值',
	-- 最小值
	min_val bigint DEFAULT 0 COMMENT '最小值',
	-- 最大值
	max_val bigint DEFAULT 0 COMMENT '最大值',
	-- 取值类型
	val_type smallint DEFAULT 0 COMMENT '取值类型',
	-- 品阶
	level int DEFAULT 0 COMMENT '品阶',
	-- 星级
	star int DEFAULT 0 COMMENT '星级',
	-- 配图
	img varchar(200) COMMENT '配图',
	-- 最大堆数量
	max_amount bigint DEFAULT 0 COMMENT '最大堆数量',
	-- 创建者
	create_by varchar(64) NOT NULL COMMENT '创建者',
	-- 创建时间
	create_date datetime NOT NULL COMMENT '创建时间',
	-- 更新者
	update_by varchar(64) NOT NULL COMMENT '更新者',
	-- 更新时间
	update_date datetime NOT NULL COMMENT '更新时间',
	-- 备注信息
	remarks varchar(255) COMMENT '备注信息',
	-- 删除标记（0：正常；1：删除）
	del_flag char(1) DEFAULT '0' NOT NULL COMMENT '删除标记（0：正常；1：删除）',
	PRIMARY KEY (id)
);


CREATE TABLE game_part_val
(
	id bigint NOT NULL AUTO_INCREMENT,
	-- 一级类别
	part_type1 smallint DEFAULT 0 COMMENT '一级类别',
	-- 二级类别
	part_type2 smallint DEFAULT 0 COMMENT '二级类别',
	type smallint DEFAULT 0,
	-- 值
	val bigint DEFAULT 0 COMMENT '值',
	-- 物品ID
	part_id bigint DEFAULT 0 COMMENT '物品ID',
	-- 内容
	content varchar(500) COMMENT '内容',
	-- 创建者
	create_by varchar(64) NOT NULL COMMENT '创建者',
	-- 创建时间
	create_date datetime NOT NULL COMMENT '创建时间',
	-- 更新者
	update_by varchar(64) NOT NULL COMMENT '更新者',
	-- 更新时间
	update_date datetime NOT NULL COMMENT '更新时间',
	-- 备注信息
	remarks varchar(255) COMMENT '备注信息',
	-- 删除标记（0：正常；1：删除）
	del_flag char(1) DEFAULT '0' NOT NULL COMMENT '删除标记（0：正常；1：删除）',
	PRIMARY KEY (id)
);


CREATE TABLE game_player_part
(
	id bigint NOT NULL AUTO_INCREMENT,
	-- 角色ID
	role_id bigint DEFAULT 0 COMMENT '角色ID',
	-- 物品ID
	part_id bigint COMMENT '物品ID',
	-- 物品位置
	position smallint COMMENT '物品位置',
	-- 配图
	img varchar(200) COMMENT '配图',
	-- 创建者
	create_by varchar(64) NOT NULL COMMENT '创建者',
	-- 创建时间
	create_date datetime NOT NULL COMMENT '创建时间',
	-- 更新者
	update_by varchar(64) NOT NULL COMMENT '更新者',
	-- 更新时间
	update_date datetime NOT NULL COMMENT '更新时间',
	-- 备注信息
	remarks varchar(255) COMMENT '备注信息',
	-- 删除标记（0：正常；1：删除）
	del_flag char(1) DEFAULT '0' NOT NULL COMMENT '删除标记（0：正常；1：删除）',
	PRIMARY KEY (id)
);


CREATE TABLE game_role_bag
(
	-- id
	id bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
	PRIMARY KEY (id)
);


CREATE TABLE game_stg_user
(
	account varchar(50) NOT NULL,
	-- 用户名称
	username varchar(60) DEFAULT '路人甲' COMMENT '用户名称',
	-- 状态
	state smallint DEFAULT 0 COMMENT '状态',
	-- 解封时间
	unban_time varchar(30) COMMENT '解封时间',
	-- 到期时间
	expire_time varchar(30) COMMENT '到期时间',
	-- 积分
	integral bigint DEFAULT 0 COMMENT '积分',
	-- 剩余时间/点数
	residue bigint DEFAULT 0 COMMENT '剩余时间/点数',
	-- 计费方式
	charge_mode smallint DEFAULT 0 COMMENT '计费方式',
	-- 创建者
	create_by varchar(64) NOT NULL COMMENT '创建者',
	-- 创建时间
	create_date datetime NOT NULL COMMENT '创建时间',
	-- 更新者
	update_by varchar(64) NOT NULL COMMENT '更新者',
	-- 更新时间
	update_date datetime NOT NULL COMMENT '更新时间',
	-- 备注信息
	remarks varchar(255) COMMENT '备注信息',
	-- 删除标记（0：正常；1：删除）
	del_flag char(1) DEFAULT '0' NOT NULL COMMENT '删除标记（0：正常；1：删除）',
	PRIMARY KEY (account)
);


CREATE TABLE game_user_bag
(
	-- ID
	id bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
	-- 账号
	account varchar(30) COMMENT '账号',
	-- 位置
	post bigint DEFAULT 0 COMMENT '位置',
	-- 物品ID
	part_id bigint COMMENT '物品ID',
	-- 当前背包格状态
	state smallint DEFAULT 0 COMMENT '当前背包格状态',
	PRIMARY KEY (id)
);


CREATE TABLE game_user_part
(
	id bigint NOT NULL AUTO_INCREMENT,
	-- 帐号
	account varchar(30) COMMENT '帐号',
	-- 角色ID
	role_id bigint DEFAULT 0 COMMENT '角色ID',
	-- 物品名称
	part_name varchar(50) NOT NULL COMMENT '物品名称',
	-- 物品类型
	part_type smallint DEFAULT 0 NOT NULL COMMENT '物品类型',
	-- 物品状态
	part_state smallint DEFAULT 0 COMMENT '物品状态',
	-- 描述
	content varchar(1000) COMMENT '描述',
	-- 值
	val bigint DEFAULT 0 COMMENT '值',
	-- 最小值
	min_val bigint DEFAULT 0 COMMENT '最小值',
	-- 最大值
	max_val bigint DEFAULT 0 COMMENT '最大值',
	-- 取值类型
	val_type smallint DEFAULT 0 COMMENT '取值类型',
	-- 品阶
	level int DEFAULT 0 COMMENT '品阶',
	-- 星级
	star int DEFAULT 0 COMMENT '星级',
	-- 物品位置
	position smallint DEFAULT 0 COMMENT '物品位置',
	-- 配图
	img varchar(200) COMMENT '配图',
	-- 物品数量
	amount bigint DEFAULT 1 COMMENT '物品数量',
	-- 物品模板ID
	model_id bigint DEFAULT 0 COMMENT '物品模板ID',
	-- 创建者
	create_by varchar(64) NOT NULL COMMENT '创建者',
	-- 创建时间
	create_date datetime NOT NULL COMMENT '创建时间',
	-- 更新者
	update_by varchar(64) NOT NULL COMMENT '更新者',
	-- 更新时间
	update_date datetime NOT NULL COMMENT '更新时间',
	-- 备注信息
	remarks varchar(255) COMMENT '备注信息',
	-- 删除标记（0：正常；1：删除）
	del_flag char(1) DEFAULT '0' NOT NULL COMMENT '删除标记（0：正常；1：删除）',
	PRIMARY KEY (id)
);


CREATE TABLE game_user_part_val
(
	id bigint NOT NULL AUTO_INCREMENT,
	-- 一级类别
	part_type1 smallint DEFAULT 0 COMMENT '一级类别',
	-- 二级类别
	part_type2 smallint DEFAULT 0 COMMENT '二级类别',
	type smallint DEFAULT 0,
	-- 值
	val bigint DEFAULT 0 COMMENT '值',
	-- 物品ID
	part_id bigint DEFAULT 0 COMMENT '物品ID',
	PRIMARY KEY (id)
);


CREATE TABLE game_user_player
(
	id bigint NOT NULL AUTO_INCREMENT,
	-- 帐号
	account varchar(30) COMMENT '帐号',
	-- 角色名称
	player_name varchar(30) COMMENT '角色名称',
	-- 配图
	img varchar(200) COMMENT '配图',
	-- 创建者
	create_by varchar(64) NOT NULL COMMENT '创建者',
	-- 创建时间
	create_date datetime NOT NULL COMMENT '创建时间',
	-- 更新者
	update_by varchar(64) NOT NULL COMMENT '更新者',
	-- 更新时间
	update_date datetime NOT NULL COMMENT '更新时间',
	-- 备注信息
	remarks varchar(255) COMMENT '备注信息',
	-- 删除标记（0：正常；1：删除）
	del_flag char(1) DEFAULT '0' NOT NULL COMMENT '删除标记（0：正常；1：删除）',
	PRIMARY KEY (id)
);


CREATE TABLE zhq_category
(
	-- ID
	id int NOT NULL AUTO_INCREMENT COMMENT 'ID',
	-- 父ID
	pid int COMMENT '父ID',
	-- 路径
	path varchar(20) COMMENT '路径',
	-- 分类名字
	name varchar(200) COMMENT '分类名字',
	-- 识别码
	code varchar(20) COMMENT '识别码',
	-- 状态
	state smallint COMMENT '状态',
	-- 级别
	level smallint COMMENT '级别',
	-- 配图
	img varchar(200) COMMENT '配图',
	-- 其他配置类型
	conf_type smallint COMMENT '其他配置类型',
	-- 其他配置值
	conf_value varchar(200) COMMENT '其他配置值',
	-- 排序
	sort int(10) COMMENT '排序',
	-- 创建者
	create_by varchar(64) NOT NULL COMMENT '创建者',
	-- 创建时间
	create_date datetime NOT NULL COMMENT '创建时间',
	-- 更新者
	update_by varchar(64) NOT NULL COMMENT '更新者',
	-- 更新时间
	update_date datetime NOT NULL COMMENT '更新时间',
	-- 备注信息
	remarks varchar(255) COMMENT '备注信息',
	-- 删除标记（0：正常；1：删除）
	del_flag char(1) DEFAULT '0' NOT NULL COMMENT '删除标记（0：正常；1：删除）',
	PRIMARY KEY (id)
);



