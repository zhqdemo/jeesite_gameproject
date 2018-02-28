SET SESSION FOREIGN_KEY_CHECKS=0;

/* Drop Tables */

DROP TABLE IF EXISTS game_front_user;




/* Create Tables */

CREATE TABLE game_front_user
(
	ID bigint NOT NULL AUTO_INCREMENT,
	-- 帐号
	account varchar(50) NOT NULL COMMENT '帐号',
	-- 用户名称
	username varchar(60) DEFAULT '路人甲' COMMENT '用户名称',
	-- 密码
	password varchar(50) NOT NULL COMMENT '密码',
	-- 邮箱
	email varchar(50) COMMENT '邮箱',
	-- 电话
	telphone varchar(50) COMMENT '电话',
	-- 身份证号
	idcard varchar(50) COMMENT '身份证号',
	-- 状态
	state smallint DEFAULT 0 NOT NULL COMMENT '状态',
	-- 头像
	img varchar(1000) COMMENT '头像',
	-- 最后登录时间
	last_logintime varchar(30) COMMENT '最后登录时间',
	-- 最后登录地点
	last_loginaddress varchar(20) COMMENT '最后登录地点',
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
	PRIMARY KEY (ID)
);



