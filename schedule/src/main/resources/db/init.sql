-- 管理系统数据库
DROP DATABASE IF EXISTS schedule;
CREATE DATABASE schedule DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;

USE schedule;

-- 系统用户表
DROP TABLE IF EXISTS sys_user;
CREATE TABLE sys_user (
  id BIGINT NOT NULL AUTO_INCREMENT COMMENT '用户ID，唯一标识该用户',
  username VARCHAR(50) NOT NULL COMMENT '用户名',
  password VARCHAR(100) NOT NULL COMMENT '用户密码',
  salt VARCHAR(50) COMMENT '盐，用于用户密码加密',
  email VARCHAR(100) NOT NULL COMMENT '用户邮箱',
  phone VARCHAR(100) NOT NULL COMMENT '用户手机号',
  status TINYINT DEFAULT 1 COMMENT '用户状态，0：禁用，1：正常',
  photo VARCHAR(200) COMMENT '用户头像路径',
  create_user_id BIGINT COMMENT '创建者ID',
  create_time DATETIME COMMENT '创建时间',
  PRIMARY KEY (id),
  UNIQUE INDEX (username),
  UNIQUE INDEX (email),
  UNIQUE INDEX (phone)
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COMMENT = '系统用户表';

INSERT INTO sys_user(id,username,password,salt,email,phone,status,photo,create_user_id,create_time)
VALUES (1,'summer','summer','7ca784711c4b6af983b2b2316cfd93d9','406507191@qq.com','15268528314',1,'',1,'2017-06-21 11:02:30');

-- 系统资源表
DROP TABLE IF EXISTS sys_resource;
CREATE TABLE sys_resource (
  id BIGINT NOT NULL AUTO_INCREMENT COMMENT '系统资源ID，唯一标识该资源',
  parent_id BIGINT COMMENT '父级资源ID',
  name VARCHAR(50) NOT NULL COMMENT '资源名称',
  description VARCHAR(200) COMMENT '资源描述',
  url VARCHAR(200) COMMENT '资源链接URL访问地址',
  permission VARCHAR(200) COMMENT '资源权限,如user:create,menu:*',
  type INT COMMENT '资源类型,如：0：目录，1：菜单，2：按钮',
  priority INT COMMENT '排序顺序',
  available TINYINT DEFAULT 1 COMMENT '资源是否可用，0：禁用，1：可用',
  PRIMARY KEY (id)
)ENGINE = InnoDB DEFAULT CHARSET = utf8 COMMENT = '系统资源';

-- 初始化一级菜单
INSERT INTO sys_resource(id,parent_id,name,description,url,permission,type,priority,available)
VALUES (2,0,'系统监控管理','','','monitor:*',1,1,1),
  (3,0,'权限管理','','','authority:*',1,1,2),
  (4,0,'操作日志管理','','','log:*',1,1,3),
  (5,0,'登录信息管理','','','login:*',1,1,4),
  (6,0,'系统管理','','','utils:*',1,1,5);

-- 初始化 系统监控管理/子菜单
INSERT INTO sys_resource(id,parent_id,name,description,url,permission,type,priority,available)
VALUES (7,2,'告警列表','','http://localhost:9000/boom/monitor/warnList.html','',1,1,1),
  (8,2,'系统监控','','http://localhost:9000/boom/monitor/monitoringList.html','',1,2,1),
  (9,2,'SQL监控','','http://localhost:9000/boom/monitor/sqlMonitoringList.html','',1,3,1);

-- 初始化 权限管理/子菜单
INSERT sys_resource(id,parent_id,name,description,url,permission,type,priority,available)
VALUES (10,3,'用户管理','','http://localhost:9000/boom/authority/userManager.html','',1,1,1),
  (11,3,'角色管理','','http://localhost:9000/boom/authority/roleManager.html','',1,2,1),
  (12,3,'资源管理','','http://localhost:9000/boom/authority/resourceManager.html','',1,3,1);

-- 初始化 操作日志管理/子菜单
INSERT sys_resource(id,parent_id,name,description,url,permission,type,priority,available)
VALUES (13,4,'日志查询','','http://localhost:9000/log/logQuery.html','',1,1,1);

-- 初始化 登录信息管理／子菜单
INSERT sys_resource(id,parent_id,name,description,url,permission,type,priority,available)
VALUES (14,5,'用户登录记录','','http://localhost:9000/login/loginRecords.html','',1,1,1);

-- 初始化 系统工具/才菜单
INSERT sys_resource(id,parent_id,name,description,url,permission,type,priority,available)
VALUES (15,6,'代码生成','','http://localhost:9000/boom/system/codeGenerator.html','',1,1,1),
  (16,6,'数据库管理','','http://localhost:9000/boom/system/dbManager.html','',1,2,1),
  (17,6,'密码设置','','http://localhost:9000/boom/system/passwordSettings.html','',1,3,1),
  (18,6,'头像设置','','http://localhost:9000/boom/system/portraitSettings.html','',1,4,1);

-- 系统角色表
DROP TABLE IF EXISTS sys_role;
CREATE TABLE sys_role (
  id BIGINT NOT NULL AUTO_INCREMENT COMMENT '角ID，唯一标识该角色',
  name VARCHAR(100) NOT NULL COMMENT '角色名称',
  remark VARCHAR(100) COMMENT '角色备注',
  available TINYINT DEFAULT 1 COMMENT '角色是否用，0：禁用，1：可用',
  create_user_id BIGINT COMMENT '创建者ID',
  create_time DATETIME COMMENT '创建时间',
  PRIMARY KEY (id)
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COMMENT = '系统角色';

-- 初始化系统角色
INSERT sys_role(id,name,remark,available,create_user_id,create_time)
VALUES (17,'admin','系统管理员',1,1,'2016-06-22 11:34:30');

-- 用户与角色对应关系表
DROP TABLE IF EXISTS sys_user_role;
CREATE TABLE sys_user_role (
  id BIGINT NOT NULL AUTO_INCREMENT,
  user_id BIGINT NOT NULL COMMENT '用户id',
  role_id BIGINT NOT NULL COMMENT '角色id',
  PRIMARY KEY (id)
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COMMENT = '系统用户与角色关系';

-- 初始化用户-角色关系
INSERT sys_user_role(id,user_id,role_id) VALUES (18,1,17);

-- 角色与资源对应关系表
DROP TABLE IF EXISTS sys_role_resource;
CREATE TABLE sys_role_resource (
  id BIGINT NOT NULL AUTO_INCREMENT,
  role_id BIGINT NOT NULL COMMENT '角色id',
  resource_id BIGINT NOT NULL COMMENT '资源id',
  PRIMARY KEY (id)
)ENGINE = InnoDB DEFAULT CHARSET = utf8 COMMENT = '系统角色与资源关系';

-- 初始化角色-资源关系
INSERT sys_role_resource(id,role_id,resource_id) VALUES (19,17,2),
  (20,17,3),
  (21,17,4),
  (22,17,5),
  (23,17,6);

-- 系统配置信息表
DROP TABLE IF EXISTS sys_config;
CREATE TABLE sys_config (
  id BIGINT NOT NULL AUTO_INCREMENT,
  sys_key VARCHAR(50) COMMENT 'sys_key',
  sys_value VARCHAR(2000) COMMENT 'sys_value',
  status TINYINT DEFAULT 1 COMMENT '状态，0：隐藏，1：显示',
  remark VARCHAR(500) COMMENT '备注',
  PRIMARY KEY (id),
  UNIQUE INDEX (sys_key)
)ENGINE = InnoDB DEFAULT CHARSET = utf8 COMMENT = '系统配置信息表';

-- 系统日志表
DROP DATABASE IF EXISTS sys_log;
CREATE TABLE sys_log (
  id BIGINT NOT NULL AUTO_INCREMENT,
  username VARCHAR(50) COMMENT '用户名',
  opertion VARCHAR(50) COMMENT '用户操作',
  method VARCHAR(200) COMMENT '请求方法',
  parameters VARCHAR(200) COMMENT '请求参数',
  ip VARCHAR(64) COMMENT 'IP地址',
  create_date DATETIME COMMENT '创建时间',
  PRIMARY KEY (id)
)ENGINE = InnoDB DEFAULT CHARSET = utf8 COMMENT = '系统日志表';