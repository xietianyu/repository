
drop database if exists `tesdb`;
/*创建数据库 easylearning 默认字符集为utf8*/
CREATE DATABASE IF NOT EXISTS  `tesdb` CHARACTER SET utf8;
/*打开数据*/
USE `tesdb`;

/*用户表*/
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `user_id` char(36) NOT NULL,                    /*用户id uuid 主键*/
  `user_loginname` varchar(20) NOT NULL,          /*用户登陆名称（邮箱或手机号）*/
  `user_logintype` varchar(20) ,                  /*用户登录类型(手机号,邮箱,qq,微博,微信)*/
  `user_nickname`  varchar(50),                   /*用户的昵称*/
  `user_password` varchar(32) NOT NULL,           /*用户密码*/
  `user_type` int NOT NULL,                       /*用户类型，（0:学生,1:教师，2:管理员，3：游客）*/
  `user_head` varchar(50)NULL,                    /*用户头像文件名,名称为uuid*/
  `user_score` int NOT NULL,                      /*用户积分，默认：0*/
  `user_islock` char(1) NOT NULL,                 /*用户是否被锁定(是或否,默认值为否)*/
  `user_pwdstate` varchar(32) NULL,               /*用户密码状态(用于找回密码用)*/
  `user_regdate` timestamp default now(),         /*用户注册日期(默认当前日期)*/
  `user_age` int,                                 /*用户年龄*/
  `user_sex` char(1),                             /*用户性别*/
  `user_introduction` varchar(500)                /*用户描述*/
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

alter table t_user add constraint PK_user_id primary key(user_id);
alter table t_user ALTER COLUMN user_score SET DEFAULT 0;
alter table t_user ALTER COLUMN user_sex SET DEFAULT '男';
alter table t_user ALTER COLUMN user_islock SET DEFAULT '否';
alter table t_user ALTER COLUMN user_type SET DEFAULT 0;
alter table t_user ALTER COLUMN user_pwdstate SET DEFAULT '';
alter table t_user ALTER COLUMN user_age SET DEFAULT 0;
alter table t_user ALTER COLUMN user_introduction SET DEFAULT '';


insert into t_user(user_id,user_loginname,user_logintype,user_nickname,
                   user_password,user_type,user_head,user_score,user_islock,
                   user_pwdstate,user_age,user_sex,user_introduction)
            values('a28e34eb-ec9d-43cd-a297-42abb14afcf9','admin@tedu.cn','邮箱',
                   '管理员','admin4mysql',2,'default.png',0,'否','',30,'男','金牌');
insert into t_user(user_id,user_loginname,user_logintype,user_nickname,
                   user_password,user_type,user_head,user_score,user_islock,
                   user_pwdstate,user_age,user_sex,user_introduction)
            values('7008ffa6-e01d-48ed-a460-dbf2a4908bfa','wt_zss@126.com','邮箱',
                   '知行','123',2,'default.png',0,'否','',30,'男','金牌');
insert into t_user(user_id,user_loginname,user_logintype,user_nickname,
                   user_password,user_type,user_head,user_score,user_islock,
                   user_pwdstate,user_age,user_sex,user_introduction)
            values('ecf1311d-de45-4851-a20f-4e6cf55073f0','13800138000','手机',
                   '行知','123',1,'default.png',0,'否','',30,'男','金牌');
insert into t_user(user_id,user_loginname,user_logintype,user_nickname,
                   user_password,user_type,user_head,user_score,user_islock,
                   user_pwdstate,user_age,user_sex,user_introduction)
            values('c2fcfe86-6db7-46b2-bbbd-43690c7017b3','aa@126.com','邮箱',
                   '知行','123',2,'default.png',0,'否','',30,'男','金牌');
insert into t_user(user_id,user_loginname,user_logintype,user_nickname,
                   user_password,user_type,user_head,user_score,user_islock,
                   user_pwdstate,user_age,user_sex,user_introduction)
            values('46238b68-6bef-491b-b5af-a3e0f45d1462','bb@126.com','邮箱',
                   '知行','123',2,'default.png',0,'否','',30,'男','金牌');
insert into t_user(user_id,user_loginname,user_logintype,user_nickname,
                   user_password,user_type,user_head,user_score,user_islock,
                   user_pwdstate,user_age,user_sex,user_introduction)
            values('10bf2a84-4bf6-40b1-8c85-e625bdb1e938','cc@126.com','邮箱',
                   '知行','123',2,'default.png',0,'否','',30,'男','金牌');
insert into t_user(user_id,user_loginname,user_logintype,user_nickname,
                   user_password,user_type,user_head,user_score,user_islock,
                   user_pwdstate,user_age,user_sex,user_introduction)
            values('3ad1188d-1f98-4b92-aa34-c4d58105485f','dd@126.com','邮箱',
                   '知行','123',2,'default.png',0,'否','',30,'男','金牌');
insert into t_user(user_id,user_loginname,user_logintype,user_nickname,
                   user_password,user_type,user_head,user_score,user_islock,
                   user_pwdstate,user_age,user_sex,user_introduction)
            values('c36af784-d33f-48f7-bcb4-737ec6fd4052','ee@126.com','邮箱',
                   '知行ee','123',2,'default.png',0,'否','',30,'男','金牌');
insert into t_user(user_id,user_loginname,user_logintype,user_nickname,
                   user_password,user_type,user_head,user_score,user_islock,
                   user_pwdstate,user_age,user_sex,user_introduction)
            values('ad0e7678-39a4-46d5-9946-f3dd5100bc62','ff@126.com','邮箱',
                   '知行ff','123',2,'default.png',0,'否','',30,'男','金牌');
insert into t_user(user_id,user_loginname,user_logintype,user_nickname,
                   user_password,user_type,user_head,user_score,user_islock,
                   user_pwdstate,user_age,user_sex,user_introduction)
            values('f2ca3738-de69-4762-a9f0-7cb477e9ce21','gg@126.com','邮箱',
                   '知行gg','123',2,'default.png',0,'否','',30,'男','金牌');
insert into t_user(user_id,user_loginname,user_logintype,user_nickname,
                   user_password,user_type,user_head,user_score,user_islock,
                   user_pwdstate,user_age,user_sex,user_introduction)
            values('983513c5-4460-44ca-afc7-7eabd6f7b35b','hh@126.com','邮箱',
                   '知行hh','123',2,'default.png',0,'否','',30,'男','金牌');

select * from t_user;


/*角色表*/
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role` (
  `role_id` char(36) NOT NULL,             /*角色id uuid 主键*/
  `role_name` varchar(20) NOT NULL         /*角色名称*/
 
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
alter table t_role add constraint PK_role_id primary key(role_id);
insert into t_role (role_id,role_name)values('d2cd243c-c670-4f69-98fd-292b41e37625','超级管理员');
insert into t_role (role_id,role_name)values('7cc9a30c-e7d7-41c8-a1d4-00465f88bb92','讲师');
insert into t_role (role_id,role_name)values('afb9a7b5-1fb7-4ce2-b21b-567dee6b3450','学员');
insert into t_role (role_id,role_name)values('8fa1e074-6719-48df-97e9-981741dc354e','评论管理员');
insert into t_role (role_id,role_name)values('fbbb1722-7205-477c-9d9d-fe33293cd133','活动管理员');
select * from t_role;

/*用户角色表*/
DROP TABLE IF EXISTS `t_user_role`;
CREATE TABLE `t_user_role` (
  `uid` char(36) NOT NULL,        /*用户id 外键*/
  `rid` char(36) NOT NULL         /*角色id 外键*/
 
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
alter table t_user_role add constraint PK_user_role_id primary key(uid,rid);
alter table t_user_role add constraint FK_user_role_uid foreign key(uid) references t_user(user_id);
alter table t_user_role add constraint FK_user_role_rid foreign key(rid) references t_role(role_id);
insert into t_user_role(uid,rid)values('a28e34eb-ec9d-43cd-a297-42abb14afcf9','d2cd243c-c670-4f69-98fd-292b41e37625');
insert into t_user_role(uid,rid)values('a28e34eb-ec9d-43cd-a297-42abb14afcf9','7cc9a30c-e7d7-41c8-a1d4-00465f88bb92');
insert into t_user_role(uid,rid)values('a28e34eb-ec9d-43cd-a297-42abb14afcf9','fbbb1722-7205-477c-9d9d-fe33293cd133');
insert into t_user_role(uid,rid)values('a28e34eb-ec9d-43cd-a297-42abb14afcf9','8fa1e074-6719-48df-97e9-981741dc354e');
insert into t_user_role(uid,rid)values('ecf1311d-de45-4851-a20f-4e6cf55073f0','7cc9a30c-e7d7-41c8-a1d4-00465f88bb92');

select * from t_user_role;

/*课程表*/
DROP TABLE IF EXISTS `t_course`;
CREATE TABLE `t_course` (
  `course_id` char(36) NOT NULL,               /*课程id uuid 主键*/
  `course_name` varchar(20) NOT NULL,          /*课程名称*/
  `course_picture` varchar(50),                /*用户图片*/
  `course_order` int,                          /*课程的权重,即课程推荐指数*/
  `course_desc` varchar(80)                    /*课程描述*/
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
alter table t_course add constraint PK_course_id primary key(course_id);/*添加主键 course_id*/

insert into t_course(course_id,course_name,course_picture,course_order,course_desc)
              values('8c2ded0e-0455-4631-a3c4-b3c50aeda12f','java','java.png','10','java好');
insert into t_course(course_id,course_name,course_picture,course_order,course_desc)
              values('5e7f24ae-6f44-4421-a172-4515734f808d','IOS','ios.png','10','IOS好');
insert into t_course(course_id,course_name,course_picture,course_order,course_desc)
              values('a2f1d6b1-4ead-4a58-90bb-29931366605a','php','php.png','10','php好');
insert into t_course(course_id,course_name,course_picture,course_order,course_desc)
              values('218969b9-4e21-484a-90fa-e9e683fc082c','web前端','web.png','10','web前端好');
insert into t_course(course_id,course_name,course_picture,course_order,course_desc)
              values('d7ea5cc9-5cc2-4e02-8f05-b01cdf8e7307','测试','test.png','10','测试好');
insert into t_course(course_id,course_name,course_picture,course_order,course_desc)
              values('60d188f6-d351-4c7f-8600-8a97ee3ca37e','网络营销','seo.png','10','网络营销好');
insert into t_course(course_id,course_name,course_picture,course_order,course_desc)
              values('690346e0-6d99-4caa-86dc-7e4e981a88b4','UID','uid.png','10','UID好');
insert into t_course(course_id,course_name,course_picture,course_order,course_desc)
              values('f2f10842-d22b-4c2e-bfbd-f78202c37207','Unity3D','u3d.png','10','Unity3D好');
insert into t_course(course_id,course_name,course_picture,course_order,course_desc)
              values('0a7a81aa-b5f1-43f9-ba92-7fcd22c4ff81','Android','android.png','10','Android好');
insert into t_course(course_id,course_name,course_picture,course_order,course_desc)
              values('48fab777-479c-4e15-84bb-f9a3ebc730b1','Linux','linux.png','10','Linux好');
insert into t_course(course_id,course_name,course_picture,course_order,course_desc)
              values('e90dc6f4-fd08-430d-a402-d523a200c872','嵌入式','embed.png','10','嵌入式好');
insert into t_course(course_id,course_name,course_picture,course_order,course_desc)
              values('d5c805bb-8c08-4dca-bab1-fd9645fa14f4','.NET','net.png','10','.NET好');
insert into t_course(course_id,course_name,course_picture,course_order,course_desc)
              values('e06776f3-e992-4624-b52a-0d117206a7bb','C++','c.png','10','C++好');
insert into t_course(course_id,course_name,course_picture,course_order,course_desc)
              values('9a139993-83c2-4468-9bc1-2aa51b1d0518','测试课程','user.png','10','C++好');
select * from t_course;


/*视频表*/
DROP TABLE IF EXISTS `t_video`;
CREATE TABLE `t_video` (
  `video_id` char(36) NOT NULL,               /*视频id uuid 主键*/
  `video_title` varchar(50) NOT NULL,         /*视频标题*/
  `video_special` int NOT NULL,               /*推荐等级,默认1级，数字越大级数越高*/
  `video_forsale` char(1) NOT NULL,           /*是否购买（是或否，默认否）*/
  `course_id` char(36) NOT NULL,              /*课程id（外键，主表t_course.course_id）*/
  `user_id` char(36) NOT NULL,                /*用户id（外键，主表t_user.user_id）*/
  `video_click_count` bigint(20),             /*视频点击次数（默认值0）*/
  `video_introduction` varchar(500),          /*视频介绍*/
  `video_picture` varchar(100),               /*视频展示图片（文件名为uuid）*/
  `video_picture_cc` varchar(200),            /*视频展示图片（cc视频平台回馈的截图图片）*/
  `video_filename` varchar(200),              /*视频文件名(本地视频，uuid文件名)*/ 
  `video_url_cc` varchar(500),                /*视频url(cc视频平台的视频地址)*/         
  `video_state` int,                          /*视频的状态默认值0，1：uploading，2：uploadover，3：pass ，4：failure，5：assembled，6：success*/
  `video_ontime` timestamp default current_timestamp,    /*视频上架时间*/
  `video_difficulty` int,                     /*视频的难度等级*/
  `md5`   varchar(50),                        /*视频文件md5*/
  `video_tag` varchar(50),                    /*视频标签,可选*/
  `category_id` char(36) ,                    /*课程二级分类id*/
  `video_filesize` bigint,                    /*文件大小，单位Byte*/
  `metaurl` varchar(80),                      /*视频上传元数据url，CC视频平台*/
  `chunkurl` varchar(80),                     /*视频上传文件块url，CC视频平台*/
  `ccvid` varchar(50),                        /*CC视频平台的视频id   32位*/
  `servicetype` varchar(30)                   /*CC视频平台的servicetype  16位*/
  
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
alter table t_video add constraint PK_video_id primary key(video_id);/*添加主键 video_id*/
alter table t_video ALTER COLUMN video_state SET DEFAULT 0;
alter table t_video ALTER COLUMN video_special SET DEFAULT 1;
alter table t_video ALTER COLUMN video_forsale SET DEFAULT '否';
alter table t_video ALTER COLUMN video_click_count SET DEFAULT 0;
alter table t_video ALTER COLUMN video_difficulty SET DEFAULT 0;
alter table t_video ALTER COLUMN video_picture SET DEFAULT 'default.png';
alter table t_video ADD CONSTRAINT FK_course_id FOREIGN KEY (course_id) REFERENCES t_course (course_id);
alter table t_video ADD CONSTRAINT FK_user_id FOREIGN KEY (user_id) REFERENCES t_user (user_id);

insert  into `t_video`(`video_id`,`video_title`,`video_special`,`video_forsale`,`course_id`,`user_id`,`video_click_count`,`video_introduction`,`video_picture`,`video_picture_cc`,`video_filename`,`video_url_cc`,`video_state`,`video_ontime`,`video_difficulty`,`md5`,`video_tag`,`category_id`,`video_filesize`,`metaurl`,`chunkurl`,`ccvid`,`servicetype`)
	values ('04ad0719-2b0f-478c-9b04-11d0b15144c6','java运算符和表达式代码演示',1,'否','8c2ded0e-0455-4631-a3c4-b3c50aeda12f','a28e34eb-ec9d-43cd-a297-42abb14afcf9',0,'讲解java运算符和表达式代码演示','04ad0719-2b0f-478c-9b04-11d0b15144c6.png','http://3.img.bokecc.com/comimage/0DD1F081022C163E/2016-06-16/2F8572BDF3136F6C9C33DC5901307461-0.jpg','04ad0719-2b0f-478c-9b04-11d0b15144c6.mp4','<script src=\"http://p.bokecc.com/player?vid=2F8572BDF3136F6C9C33DC5901307461&siteid=0DD1F081022C163E&autoStart=false&width=600&height=490&playerid=C550161F45FAA381&playertype=1\" type=\"text/javascript\"></script>',6,'2016-06-16 16:51:25',0,'ee119f491c56771ce2566188c44e14d5','Java基础',NULL,2682864,'http://1.18.vacombiner.bokecc.com/servlet/uploadmeta','http://1.18.vacombiner.bokecc.com/servlet/uploadchunk','2F8572BDF3136F6C9C33DC5901307461','DF0236B91AECD81C'),
	       ('0f69cf5d-682d-4d49-8b63-fd9086580e6a','web前端jquery概念介绍1(offline)',1,'否','218969b9-4e21-484a-90fa-e9e683fc082c','a28e34eb-ec9d-43cd-a297-42abb14afcf9',0,'讲解web前端jquery概念介绍1','0f69cf5d-682d-4d49-8b63-fd9086580e6a.png',NULL,'0f69cf5d-682d-4d49-8b63-fd9086580e6a.mp4',NULL,2,'2016-06-17 11:06:46',0,'bd5bed2cce0ce5ecdf1a264ec696887d','web前端',NULL,2114016,NULL,NULL,NULL,NULL),
               ('10c93b23-7558-4eb9-945a-4ffaacd0c8e9','java开发环境(offline)',1,'否','8c2ded0e-0455-4631-a3c4-b3c50aeda12f','a28e34eb-ec9d-43cd-a297-42abb14afcf9',0,'讲解java开发环境','10c93b23-7558-4eb9-945a-4ffaacd0c8e9.png',NULL,'10c93b23-7558-4eb9-945a-4ffaacd0c8e9.mp4',NULL,2,'2016-06-17 11:32:45',0,'388bfb2ede611b20846c441354da14d7','java基础',NULL,3029579,NULL,NULL,NULL,NULL),
	       ('1d7b41a0-ae54-41e1-be8b-a29bc1bfe4cb','UI服装设计演示过程2(offline)',1,'否','690346e0-6d99-4caa-86dc-7e4e981a88b4','a28e34eb-ec9d-43cd-a297-42abb14afcf9',0,'讲解UI服装设计演示过程2','1d7b41a0-ae54-41e1-be8b-a29bc1bfe4cb.png',NULL,'1d7b41a0-ae54-41e1-be8b-a29bc1bfe4cb.mp4',NULL,2,'2016-06-17 11:13:31',0,'0c229273386a0f3213c600f2ca9f6e71','UI基础',NULL,2982470,NULL,NULL,NULL,NULL),
               ('1f0f8d64-5aed-41c9-b102-fecab6e24cca','java简介',1,'否','8c2ded0e-0455-4631-a3c4-b3c50aeda12f','a28e34eb-ec9d-43cd-a297-42abb14afcf9',0,'讲解java简介','1f0f8d64-5aed-41c9-b102-fecab6e24cca.png','http://3.img.bokecc.com/comimage/0DD1F081022C163E/2016-06-16/BE8CF77C2F8AB6229C33DC5901307461-0.jpg','1f0f8d64-5aed-41c9-b102-fecab6e24cca.mp4','<script src=\"http://p.bokecc.com/player?vid=BE8CF77C2F8AB6229C33DC5901307461&siteid=0DD1F081022C163E&autoStart=false&width=600&height=490&playerid=C550161F45FAA381&playertype=1\" type=\"text/javascript\"></script>',6,'2016-06-16 15:34:16',0,'4c06b8ec142022cc4d772b48c866ffa0','Java基础',NULL,7234678,'http://2.18.vacombiner.bokecc.com/servlet/uploadmeta','http://2.18.vacombiner.bokecc.com/servlet/uploadchunk','BE8CF77C2F8AB6229C33DC5901307461','DF0236B91AECD81C'),
	       ('25dd35e8-4678-4eec-a7ac-77eff3af3478','linux常见的软件封装包类型1',1,'否','48fab777-479c-4e15-84bb-f9a3ebc730b1','a28e34eb-ec9d-43cd-a297-42abb14afcf9',0,'讲解linux常见的软件封装包类型1','25dd35e8-4678-4eec-a7ac-77eff3af3478.png','http://3.img.bokecc.com/comimage/0DD1F081022C163E/2016-06-17/CABD1130D5523D359C33DC5901307461-0.jpg','25dd35e8-4678-4eec-a7ac-77eff3af3478.mp4','<script src=\"http://p.bokecc.com/player?vid=CABD1130D5523D359C33DC5901307461&siteid=0DD1F081022C163E&autoStart=false&width=600&height=490&playerid=C550161F45FAA381&playertype=1\" type=\"text/javascript\"></script>',6,'2016-06-17 10:19:08',0,'05c478aabcf88809fd95a2b7728d942d','UI基础',NULL,5271113,'http://5.15.vacombiner.bokecc.com/servlet/uploadmeta','http://5.15.vacombiner.bokecc.com/servlet/uploadchunk','CABD1130D5523D359C33DC5901307461','DF0236B91AECD81C'),
               ('3129dc4a-5861-476b-a971-feebe4ceebbd','web前端jquery概念介绍2',1,'否','218969b9-4e21-484a-90fa-e9e683fc082c','a28e34eb-ec9d-43cd-a297-42abb14afcf9',0,'讲解web前端jquery概念介绍2','3129dc4a-5861-476b-a971-feebe4ceebbd.png','http://3.img.bokecc.com/comimage/0DD1F081022C163E/2016-06-17/376304D2E5C8B81F9C33DC5901307461-0.jpg','3129dc4a-5861-476b-a971-feebe4ceebbd.mp4','<script src=\"http://p.bokecc.com/player?vid=376304D2E5C8B81F9C33DC5901307461&siteid=0DD1F081022C163E&autoStart=false&width=600&height=490&playerid=C550161F45FAA381&playertype=1\" type=\"text/javascript\"></script>',6,'2016-06-17 10:27:10',0,'bd9e68e5f21248d18d8aee07d4369112','web前端',NULL,2101115,'http://4.15.vacombiner.bokecc.com/servlet/uploadmeta','http://4.15.vacombiner.bokecc.com/servlet/uploadchunk','376304D2E5C8B81F9C33DC5901307461','DF0236B91AECD81C'),
	       ('34d2614c-95c2-4adc-994a-9d3bfb887afc','java简介(offline)',1,'否','8c2ded0e-0455-4631-a3c4-b3c50aeda12f','a28e34eb-ec9d-43cd-a297-42abb14afcf9',0,'讲解java简介','34d2614c-95c2-4adc-994a-9d3bfb887afc.png',NULL,'34d2614c-95c2-4adc-994a-9d3bfb887afc.mp4',NULL,2,'2016-06-17 11:34:04',0,'4c06b8ec142022cc4d772b48c866ffa0','java基础',NULL,7234678,NULL,NULL,NULL,NULL),
	       ('39f5e9a8-4410-491f-83a4-5bce8f77087f','web前端什么是jquery(offline)',1,'否','218969b9-4e21-484a-90fa-e9e683fc082c','a28e34eb-ec9d-43cd-a297-42abb14afcf9',0,'讲解web前端什么是jquery','39f5e9a8-4410-491f-83a4-5bce8f77087f.png',NULL,'39f5e9a8-4410-491f-83a4-5bce8f77087f.mp4',NULL,2,'2016-06-17 11:00:26',0,'cf2c3ed383082b41e4bc1aca3a4638dd','web前端',NULL,2110217,NULL,NULL,NULL,NULL),
	       ('463f4abf-8edb-4cdd-9b82-77e7eb9ce051','java运算符和表达式',1,'否','8c2ded0e-0455-4631-a3c4-b3c50aeda12f','a28e34eb-ec9d-43cd-a297-42abb14afcf9',0,'讲解java运算符和表达式','463f4abf-8edb-4cdd-9b82-77e7eb9ce051.png','http://3.img.bokecc.com/comimage/0DD1F081022C163E/2016-06-16/2CA324D65D9253129C33DC5901307461-0.jpg','463f4abf-8edb-4cdd-9b82-77e7eb9ce051.mp4','<script src=\"http://p.bokecc.com/player?vid=2CA324D65D9253129C33DC5901307461&siteid=0DD1F081022C163E&autoStart=false&width=600&height=490&playerid=C550161F45FAA381&playertype=1\" type=\"text/javascript\"></script>',6,'2016-06-16 16:50:29',0,'371ce6b11bf5bce3ffde0ce1d916cac2','Java基础',NULL,3851241,'http://5.15.vacombiner.bokecc.com/servlet/uploadmeta','http://5.15.vacombiner.bokecc.com/servlet/uploadchunk','2CA324D65D9253129C33DC5901307461','DF0236B91AECD81C'),
               ('56fd63cb-10b0-4f30-90d2-fbc32528f5a3','web前端jquery概念介绍1',1,'否','218969b9-4e21-484a-90fa-e9e683fc082c','a28e34eb-ec9d-43cd-a297-42abb14afcf9',0,'讲解web前端jquery概念介绍1','56fd63cb-10b0-4f30-90d2-fbc32528f5a3.png','http://3.img.bokecc.com/comimage/0DD1F081022C163E/2016-06-17/3BA1F4972A978C8C9C33DC5901307461-0.jpg','56fd63cb-10b0-4f30-90d2-fbc32528f5a3.mp4','<script src=\"http://p.bokecc.com/player?vid=3BA1F4972A978C8C9C33DC5901307461&siteid=0DD1F081022C163E&autoStart=false&width=600&height=490&playerid=C550161F45FAA381&playertype=1\" type=\"text/javascript\"></script>',6,'2016-06-17 10:23:40',0,'bd5bed2cce0ce5ecdf1a264ec696887d','web前端',NULL,2114016,'http://1.18.vacombiner.bokecc.com/servlet/uploadmeta','http://1.18.vacombiner.bokecc.com/servlet/uploadchunk','3BA1F4972A978C8C9C33DC5901307461','DF0236B91AECD81C'),
               ('5d0d1555-7203-4989-ad11-0d8008c3998f','web前端jquery入门',1,'否','218969b9-4e21-484a-90fa-e9e683fc082c','a28e34eb-ec9d-43cd-a297-42abb14afcf9',0,'讲解web前端jquery入门','5d0d1555-7203-4989-ad11-0d8008c3998f.png','http://3.img.bokecc.com/comimage/0DD1F081022C163E/2016-06-17/64412F31495F67709C33DC5901307461-0.jpg','5d0d1555-7203-4989-ad11-0d8008c3998f.mp4','<script src=\"http://p.bokecc.com/player?vid=64412F31495F67709C33DC5901307461&siteid=0DD1F081022C163E&autoStart=false&width=600&height=490&playerid=C550161F45FAA381&playertype=1\" type=\"text/javascript\"></script>',6,'2016-06-17 10:31:06',0,'079e5ec1fc20018e7a4ec07ba229c85e','web前端',NULL,3657125,'http://1.18.vacombiner.bokecc.com/servlet/uploadmeta','http://1.18.vacombiner.bokecc.com/servlet/uploadchunk','64412F31495F67709C33DC5901307461','DF0236B91AECD81C'),
               ('5fdc2f3e-a054-4897-a41b-4b1d40fdfe18','web前段jquery发展史',1,'否','218969b9-4e21-484a-90fa-e9e683fc082c','a28e34eb-ec9d-43cd-a297-42abb14afcf9',0,'讲解web前段jquery发展史','5fdc2f3e-a054-4897-a41b-4b1d40fdfe18.png','http://3.img.bokecc.com/comimage/0DD1F081022C163E/2016-06-17/E7A198770BBB0CA09C33DC5901307461-0.jpg','5fdc2f3e-a054-4897-a41b-4b1d40fdfe18.mp4','<script src=\"http://p.bokecc.com/player?vid=E7A198770BBB0CA09C33DC5901307461&siteid=0DD1F081022C163E&autoStart=false&width=600&height=490&playerid=C550161F45FAA381&playertype=1\" type=\"text/javascript\"></script>',6,'2016-06-17 10:33:52',0,'6118d8a95ab08141dea195e928d240bb','web前端',NULL,2248162,'http://2.15.vacombiner.bokecc.com/servlet/uploadmeta','http://2.15.vacombiner.bokecc.com/servlet/uploadchunk','E7A198770BBB0CA09C33DC5901307461','DF0236B91AECD81C'),
               ('6a85b9e3-99e5-4493-9a9b-bbf4a0a3e483','UI服装设计',1,'否','690346e0-6d99-4caa-86dc-7e4e981a88b4','a28e34eb-ec9d-43cd-a297-42abb14afcf9',0,'讲解UI服装设计','6a85b9e3-99e5-4493-9a9b-bbf4a0a3e483.png','http://3.img.bokecc.com/comimage/0DD1F081022C163E/2016-06-16/8ED09B0077C7AA4C9C33DC5901307461-0.jpg','6a85b9e3-99e5-4493-9a9b-bbf4a0a3e483.mp4','<script src=\"http://p.bokecc.com/player?vid=8ED09B0077C7AA4C9C33DC5901307461&siteid=0DD1F081022C163E&autoStart=false&width=600&height=490&playerid=C550161F45FAA381&playertype=1\" type=\"text/javascript\"></script>',6,'2016-06-16 17:34:17',0,'3b37a09f85dc14fbfcc860e43a8f3f71','UI基础',NULL,3051740,'http://3.15.vacombiner.bokecc.com/servlet/uploadmeta','http://3.15.vacombiner.bokecc.com/servlet/uploadchunk','8ED09B0077C7AA4C9C33DC5901307461','DF0236B91AECD81C'),
               ('6b38aff8-ddd7-4058-bfdf-032c5c8356a8','web前端什么是jquery',1,'否','218969b9-4e21-484a-90fa-e9e683fc082c','a28e34eb-ec9d-43cd-a297-42abb14afcf9',0,'讲解web前端什么是jquery','6b38aff8-ddd7-4058-bfdf-032c5c8356a8.png','http://3.img.bokecc.com/comimage/0DD1F081022C163E/2016-06-17/2247E80CC9F42E9C9C33DC5901307461-0.jpg','6b38aff8-ddd7-4058-bfdf-032c5c8356a8.mp4','<script src=\"http://p.bokecc.com/player?vid=2247E80CC9F42E9C9C33DC5901307461&siteid=0DD1F081022C163E&autoStart=false&width=600&height=490&playerid=C550161F45FAA381&playertype=1\" type=\"text/javascript\"></script>',6,'2016-06-17 10:31:51',0,'cf2c3ed383082b41e4bc1aca3a4638dd','web前端',NULL,2110217,'http://5.15.vacombiner.bokecc.com/servlet/uploadmeta','http://5.15.vacombiner.bokecc.com/servlet/uploadchunk','2247E80CC9F42E9C9C33DC5901307461','DF0236B91AECD81C'),
               ('73550069-c53a-43ac-b721-50daabee6390','web前端jquery概念介绍3(offline)',1,'否','218969b9-4e21-484a-90fa-e9e683fc082c','a28e34eb-ec9d-43cd-a297-42abb14afcf9',0,'讲解web前端jquery概念介绍3','73550069-c53a-43ac-b721-50daabee6390.png',NULL,'73550069-c53a-43ac-b721-50daabee6390.mp4',NULL,2,'2016-06-17 11:04:33',0,'81e7f8286c28cc79d11950b5f19a7ea5','web前端',NULL,2790112,NULL,NULL,NULL,NULL),
               ('78d5fa43-7640-4349-83e6-00127f1d6a2c','java运算符和表达式代码演示(offline)',1,'否','8c2ded0e-0455-4631-a3c4-b3c50aeda12f','a28e34eb-ec9d-43cd-a297-42abb14afcf9',0,'讲解java运算符和表达式代码演示','78d5fa43-7640-4349-83e6-00127f1d6a2c.png',NULL,'78d5fa43-7640-4349-83e6-00127f1d6a2c.mp4',NULL,2,'2016-06-17 11:29:27',0,'ee119f491c56771ce2566188c44e14d5','java基础',NULL,2682864,NULL,NULL,NULL,NULL),
               ('7cc8ced1-aed9-49d7-be5f-e45520c8e9a9','linux常见的软件封装包类型(offline)',1,'否','48fab777-479c-4e15-84bb-f9a3ebc730b1','a28e34eb-ec9d-43cd-a297-42abb14afcf9',0,'讲解linux常见的软件封装包类型','7cc8ced1-aed9-49d7-be5f-e45520c8e9a9.png',NULL,'7cc8ced1-aed9-49d7-be5f-e45520c8e9a9.mp4',NULL,2,'2016-06-17 11:27:18',0,'27094eed595062d5f8474fc9e6337b1a','linux基础',NULL,2214380,NULL,NULL,NULL,NULL),
               ('8033bfc1-2dfc-4092-8720-8e9e704e1107','IOS通过图片集创建lable(offline)',1,'否','5e7f24ae-6f44-4421-a172-4515734f808d','a28e34eb-ec9d-43cd-a297-42abb14afcf9',0,'讲解IOS通过图片集创建lable','8033bfc1-2dfc-4092-8720-8e9e704e1107.png',NULL,'8033bfc1-2dfc-4092-8720-8e9e704e1107.mp4',NULL,2,'2016-06-17 11:42:04',0,'5db31028150a9a93882cffe0bb03550a','IOS基础',NULL,4906480,NULL,NULL,NULL,NULL),
               ('819f279c-752c-4583-a3d2-37bdf35f61c8','UI服装设计演示过程2',1,'否','690346e0-6d99-4caa-86dc-7e4e981a88b4','a28e34eb-ec9d-43cd-a297-42abb14afcf9',0,'讲解UI服装设计演示过程2','819f279c-752c-4583-a3d2-37bdf35f61c8.png','http://3.img.bokecc.com/comimage/0DD1F081022C163E/2016-06-17/00ED2EF873DEAC539C33DC5901307461-0.jpg','819f279c-752c-4583-a3d2-37bdf35f61c8.mp4','<script src=\"http://p.bokecc.com/player?vid=00ED2EF873DEAC539C33DC5901307461&siteid=0DD1F081022C163E&autoStart=false&width=600&height=490&playerid=C550161F45FAA381&playertype=1\" type=\"text/javascript\"></script>',6,'2016-06-17 10:12:18',0,'0c229273386a0f3213c600f2ca9f6e71','UI基础',NULL,2982470,'http://2.18.vacombiner.bokecc.com/servlet/uploadmeta','http://2.18.vacombiner.bokecc.com/servlet/uploadchunk','00ED2EF873DEAC539C33DC5901307461','DF0236B91AECD81C'),
               ('84c08f1b-fee9-4f2c-bf9a-421e14ad57b8','UI服装设计演示过程1(offline)',1,'否','690346e0-6d99-4caa-86dc-7e4e981a88b4','a28e34eb-ec9d-43cd-a297-42abb14afcf9',0,'讲解UI服装设计演示过程1','84c08f1b-fee9-4f2c-bf9a-421e14ad57b8.png',NULL,'84c08f1b-fee9-4f2c-bf9a-421e14ad57b8.mp4',NULL,2,'2016-06-17 11:14:30',0,'a091d82cc720ce3c51c8c706b7c57c1d','UI基础',NULL,3410310,NULL,NULL,NULL,NULL),
               ('9043b2f8-4117-4ee9-b2f1-3c2477826844','IOS通过图片集创建lable代码演示(offline)',1,'否','5e7f24ae-6f44-4421-a172-4515734f808d','a28e34eb-ec9d-43cd-a297-42abb14afcf9',0,'讲解IOS通过图片集创建lable代码演示','9043b2f8-4117-4ee9-b2f1-3c2477826844.png',NULL,'9043b2f8-4117-4ee9-b2f1-3c2477826844.mp4',NULL,2,'2016-06-17 11:39:56',0,'225eaa0035682b8e2e6c61d1eec011ba','IOS基础',NULL,7585161,NULL,NULL,NULL,NULL),
               ('95789b42-ee1e-4c2f-9c28-3231b143ea66','UI服装设计演示过程1',1,'否','690346e0-6d99-4caa-86dc-7e4e981a88b4','a28e34eb-ec9d-43cd-a297-42abb14afcf9',0,'讲解UI服装设计演示过程1','95789b42-ee1e-4c2f-9c28-3231b143ea66.png','http://3.img.bokecc.com/comimage/0DD1F081022C163E/2016-06-16/EB8690F36730EC9B9C33DC5901307461-0.jpg','95789b42-ee1e-4c2f-9c28-3231b143ea66.mp4','<script src=\"http://p.bokecc.com/player?vid=EB8690F36730EC9B9C33DC5901307461&siteid=0DD1F081022C163E&autoStart=false&width=600&height=490&playerid=C550161F45FAA381&playertype=1\" type=\"text/javascript\"></script>',6,'2016-06-16 17:36:18',0,'a091d82cc720ce3c51c8c706b7c57c1d','UI基础',NULL,3410310,'http://2.15.vacombiner.bokecc.com/servlet/uploadmeta','http://2.15.vacombiner.bokecc.com/servlet/uploadchunk','EB8690F36730EC9B9C33DC5901307461','DF0236B91AECD81C'),
               ('a17497ef-2de8-401a-ba25-31ebd5dac0d4','UI服装设计演示过程3',1,'否','690346e0-6d99-4caa-86dc-7e4e981a88b4','a28e34eb-ec9d-43cd-a297-42abb14afcf9',0,'讲解UI服装设计演示过程3','a17497ef-2de8-401a-ba25-31ebd5dac0d4.png','http://3.img.bokecc.com/comimage/0DD1F081022C163E/2016-06-16/4887369C391C21139C33DC5901307461-0.jpg','a17497ef-2de8-401a-ba25-31ebd5dac0d4.mp4','<script src=\"http://p.bokecc.com/player?vid=4887369C391C21139C33DC5901307461&siteid=0DD1F081022C163E&autoStart=false&width=600&height=490&playerid=C550161F45FAA381&playertype=1\" type=\"text/javascript\"></script>',6,'2016-06-16 17:46:47',0,'76132be3718f29c97924ae7067a81944','UI基础',NULL,3076215,'http://1.18.vacombiner.bokecc.com/servlet/uploadmeta','http://1.18.vacombiner.bokecc.com/servlet/uploadchunk','4887369C391C21139C33DC5901307461','DF0236B91AECD81C'),
               ('a33aa29b-b6f7-489f-a921-b89bb9ac222e','IOS通过图片集创建lable代码演示',1,'否','5e7f24ae-6f44-4421-a172-4515734f808d','a28e34eb-ec9d-43cd-a297-42abb14afcf9',0,'讲解IOS通过图片集创建lable代码演示','a33aa29b-b6f7-489f-a921-b89bb9ac222e.png','http://3.img.bokecc.com/comimage/0DD1F081022C163E/2016-06-16/408B299BB0ADB6DC9C33DC5901307461-0.jpg','a33aa29b-b6f7-489f-a921-b89bb9ac222e.mp4','<script src=\"http://p.bokecc.com/player?vid=408B299BB0ADB6DC9C33DC5901307461&siteid=0DD1F081022C163E&autoStart=false&width=600&height=490&playerid=C550161F45FAA381&playertype=1\" type=\"text/javascript\"></script>',6,'2016-06-16 17:05:24',0,'225eaa0035682b8e2e6c61d1eec011ba','IOS基础',NULL,7585161,'http://1.15.vacombiner.bokecc.com/servlet/uploadmeta','http://1.15.vacombiner.bokecc.com/servlet/uploadchunk','408B299BB0ADB6DC9C33DC5901307461','DF0236B91AECD81C'),
               ('a5f11b53-6561-40be-bc03-fdddc982a7e4','java开发环境',1,'否','8c2ded0e-0455-4631-a3c4-b3c50aeda12f','a28e34eb-ec9d-43cd-a297-42abb14afcf9',0,'讲解java开发环境','a5f11b53-6561-40be-bc03-fdddc982a7e4.png','http://3.img.bokecc.com/comimage/0DD1F081022C163E/2016-06-16/02057F2F8A793F6C9C33DC5901307461-0.jpg','a5f11b53-6561-40be-bc03-fdddc982a7e4.mp4','<script src=\"http://p.bokecc.com/player?vid=02057F2F8A793F6C9C33DC5901307461&siteid=0DD1F081022C163E&autoStart=false&width=600&height=490&playerid=C550161F45FAA381&playertype=1\" type=\"text/javascript\"></script>',6,'2016-06-16 16:48:51',0,'388bfb2ede611b20846c441354da14d7','Java基础',NULL,3029579,'http://2.18.vacombiner.bokecc.com/servlet/uploadmeta','http://2.18.vacombiner.bokecc.com/servlet/uploadchunk','02057F2F8A793F6C9C33DC5901307461','DF0236B91AECD81C'),
               ('aa80ae56-f7b4-4b26-8e56-170687d998b0','UI服装设计演示过程3(offline)',1,'否','690346e0-6d99-4caa-86dc-7e4e981a88b4','a28e34eb-ec9d-43cd-a297-42abb14afcf9',0,'讲解UI服装设计演示过程3','aa80ae56-f7b4-4b26-8e56-170687d998b0.png',NULL,'aa80ae56-f7b4-4b26-8e56-170687d998b0.mp4',NULL,2,'2016-06-17 11:11:50',0,'76132be3718f29c97924ae7067a81944','UI基础',NULL,3076215,NULL,NULL,NULL,NULL),
               ('b95a7733-494e-4573-bb72-19df992de092','IOS通过图片集创建lable',1,'否','5e7f24ae-6f44-4421-a172-4515734f808d','a28e34eb-ec9d-43cd-a297-42abb14afcf9',0,'讲解IOS通过图片集创建lable','b95a7733-494e-4573-bb72-19df992de092.png','http://3.img.bokecc.com/comimage/0DD1F081022C163E/2016-06-16/1AD1E291868D9C4F9C33DC5901307461-0.jpg','b95a7733-494e-4573-bb72-19df992de092.mp4','<script src=\"http://p.bokecc.com/player?vid=1AD1E291868D9C4F9C33DC5901307461&siteid=0DD1F081022C163E&autoStart=false&width=600&height=490&playerid=C550161F45FAA381&playertype=1\" type=\"text/javascript\"></script>',6,'2016-06-16 16:53:45',0,'5db31028150a9a93882cffe0bb03550a','IOS基础',NULL,4906480,'http://1.18.vacombiner.bokecc.com/servlet/uploadmeta','http://1.18.vacombiner.bokecc.com/servlet/uploadchunk','1AD1E291868D9C4F9C33DC5901307461','DF0236B91AECD81C'),
               ('ba74ad10-4baf-4d0a-abae-76e9d1756412','web前端jquery概念介绍2(offline)',1,'否','218969b9-4e21-484a-90fa-e9e683fc082c','a28e34eb-ec9d-43cd-a297-42abb14afcf9',0,'讲解web前端jquery概念介绍2','ba74ad10-4baf-4d0a-abae-76e9d1756412.png',NULL,'ba74ad10-4baf-4d0a-abae-76e9d1756412.mp4',NULL,2,'2016-06-17 11:05:44',0,'bd9e68e5f21248d18d8aee07d4369112','web前端',NULL,2101115,NULL,NULL,NULL,NULL),
               ('be9d362c-8560-44c3-bd12-023d407c3aa5','java变量(offline)',1,'否','8c2ded0e-0455-4631-a3c4-b3c50aeda12f','a28e34eb-ec9d-43cd-a297-42abb14afcf9',0,'讲解java变量','be9d362c-8560-44c3-bd12-023d407c3aa5.png',NULL,'be9d362c-8560-44c3-bd12-023d407c3aa5.mp4',NULL,2,'2016-06-17 11:35:22',0,'9ebcd7e28102b28a044d8432b6b47f7f','java基础',NULL,8001466,NULL,NULL,NULL,NULL),
               ('ca5a4e33-1a01-421f-b763-d950e3d85f46','web前段jquery发展史(offline)',1,'否','218969b9-4e21-484a-90fa-e9e683fc082c','a28e34eb-ec9d-43cd-a297-42abb14afcf9',0,'讲解web前段jquery发展史','ca5a4e33-1a01-421f-b763-d950e3d85f46.png',NULL,'ca5a4e33-1a01-421f-b763-d950e3d85f46.mp4',NULL,2,'2016-06-17 10:53:28',0,'6118d8a95ab08141dea195e928d240bb','web前端',NULL,2248162,NULL,NULL,NULL,NULL),
               ('d37dac3a-6003-4d98-8ea3-46d6600f0f28','linux常见的软件封装包类型1(offline)',1,'否','48fab777-479c-4e15-84bb-f9a3ebc730b1','a28e34eb-ec9d-43cd-a297-42abb14afcf9',0,'讲解linux常见的软件封装包类型1','d37dac3a-6003-4d98-8ea3-46d6600f0f28.png',NULL,'d37dac3a-6003-4d98-8ea3-46d6600f0f28.mp4',NULL,2,'2016-06-17 11:25:15',0,'05c478aabcf88809fd95a2b7728d942d','linux基础',NULL,5271113,NULL,NULL,NULL,NULL),
               ('d4a090b9-d4e8-4737-8cfe-07c0bc83ae4c','web前端jquery入门(offline)',1,'否','218969b9-4e21-484a-90fa-e9e683fc082c','a28e34eb-ec9d-43cd-a297-42abb14afcf9',0,'讲解web前端jquery入门','d4a090b9-d4e8-4737-8cfe-07c0bc83ae4c.png',NULL,'d4a090b9-d4e8-4737-8cfe-07c0bc83ae4c.mp4',NULL,2,'2016-06-17 11:02:41',0,'079e5ec1fc20018e7a4ec07ba229c85e','web前端',NULL,3657125,NULL,NULL,NULL,NULL),
               ('d5f9b7a2-acd2-49db-8ba2-5318f44ff9f5','web前端jquery概念介绍3',1,'否','218969b9-4e21-484a-90fa-e9e683fc082c','a28e34eb-ec9d-43cd-a297-42abb14afcf9',0,'讲解web前端jquery概念介绍3','d5f9b7a2-acd2-49db-8ba2-5318f44ff9f5.png','http://3.img.bokecc.com/comimage/0DD1F081022C163E/2016-06-17/0384AC474ED494FF9C33DC5901307461-0.jpg','d5f9b7a2-acd2-49db-8ba2-5318f44ff9f5.mp4','<script src=\"http://p.bokecc.com/player?vid=0384AC474ED494FF9C33DC5901307461&siteid=0DD1F081022C163E&autoStart=false&width=600&height=490&playerid=C550161F45FAA381&playertype=1\" type=\"text/javascript\"></script>',6,'2016-06-17 10:29:43',0,'81e7f8286c28cc79d11950b5f19a7ea5','web前端',NULL,2790112,'http://3.15.vacombiner.bokecc.com/servlet/uploadmeta','http://3.15.vacombiner.bokecc.com/servlet/uploadchunk','0384AC474ED494FF9C33DC5901307461','DF0236B91AECD81C'),
               ('db9e0866-f9a2-467d-994c-9f30f1625496','java变量',1,'否','8c2ded0e-0455-4631-a3c4-b3c50aeda12f','a28e34eb-ec9d-43cd-a297-42abb14afcf9',0,'讲解java变量','db9e0866-f9a2-467d-994c-9f30f1625496.png','http://3.img.bokecc.com/comimage/0DD1F081022C163E/2016-06-16/A8431B4E352F0F9B9C33DC5901307461-0.jpg','db9e0866-f9a2-467d-994c-9f30f1625496.mp4','<script src=\"http://p.bokecc.com/player?vid=A8431B4E352F0F9B9C33DC5901307461&siteid=0DD1F081022C163E&autoStart=false&width=600&height=490&playerid=C550161F45FAA381&playertype=1\" type=\"text/javascript\"></script>',6,'2016-06-16 16:45:23',0,'9ebcd7e28102b28a044d8432b6b47f7f','Java基础',NULL,8001466,'http://5.15.vacombiner.bokecc.com/servlet/uploadmeta','http://5.15.vacombiner.bokecc.com/servlet/uploadchunk','A8431B4E352F0F9B9C33DC5901307461','DF0236B91AECD81C'),
               ('dcdd965a-8561-45fb-93a5-79722a3a521a','UI服装设计(offline)',1,'否','690346e0-6d99-4caa-86dc-7e4e981a88b4','a28e34eb-ec9d-43cd-a297-42abb14afcf9',0,'讲解UI服装设计','dcdd965a-8561-45fb-93a5-79722a3a521a.png',NULL,'dcdd965a-8561-45fb-93a5-79722a3a521a.mp4',NULL,2,'2016-06-17 11:20:07',0,'3b37a09f85dc14fbfcc860e43a8f3f71','UI基础',NULL,3051740,NULL,NULL,NULL,NULL),
               ('dd85c336-69a2-420d-b955-2338e5be103d','linux常见的软件封装包类型',1,'否','48fab777-479c-4e15-84bb-f9a3ebc730b1','a28e34eb-ec9d-43cd-a297-42abb14afcf9',0,'讲解linux常见的软件封装包类型','dd85c336-69a2-420d-b955-2338e5be103d.png','http://3.img.bokecc.com/comimage/0DD1F081022C163E/2016-06-16/B977D57E1C2071A59C33DC5901307461-0.jpg','dd85c336-69a2-420d-b955-2338e5be103d.mp4','<script src=\"http://p.bokecc.com/player?vid=B977D57E1C2071A59C33DC5901307461&siteid=0DD1F081022C163E&autoStart=false&width=600&height=490&playerid=C550161F45FAA381&playertype=1\" type=\"text/javascript\"></script>',6,'2016-06-16 17:23:36',0,'27094eed595062d5f8474fc9e6337b1a','linux基础',NULL,2214380,'http://2.18.vacombiner.bokecc.com/servlet/uploadmeta','http://2.18.vacombiner.bokecc.com/servlet/uploadchunk','B977D57E1C2071A59C33DC5901307461','DF0236B91AECD81C'),
               ('e1b27864-e0df-41be-9f8c-dc7e5a42db16','java运算符和表达式(offline)',1,'否','8c2ded0e-0455-4631-a3c4-b3c50aeda12f','a28e34eb-ec9d-43cd-a297-42abb14afcf9',0,'讲解java运算符和表达式','e1b27864-e0df-41be-9f8c-dc7e5a42db16.png',NULL,'e1b27864-e0df-41be-9f8c-dc7e5a42db16.mp4',NULL,2,'2016-06-17 11:31:02',0,'371ce6b11bf5bce3ffde0ce1d916cac2','java基础',NULL,3851241,NULL,NULL,NULL,NULL);


select * from t_video;





/*视频评论表*/
DROP TABLE IF EXISTS `t_comment`;
CREATE TABLE `t_comment` (
  `comment_id` char(36) NOT NULL,                              /*视频评论id uuid 主键*/
  `comment_content` varchar(100) NOT NULL,                     /*评论内容*/
  `comment_timestamp` timestamp  default now() NOT NULL,       /*评论时间（日期时间）*/
  `user_id` char(36) NOT NULL,                                 /*哪个用户评论*/
  `video_id` char(36) NOT NULL,                                /*评论的是哪个视频*/
  `course_id` char(36) NOT NULL,                               /*评论的是哪个课程*/
  `comment_ispass` char(1)                                     /*评论是否审核通过(是或否,默认否)*/
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
alter table t_comment add constraint PK_comment_id primary key(comment_id);
alter table t_comment ADD CONSTRAINT FK_user_id1 FOREIGN KEY (user_id) REFERENCES t_user (user_id);
alter table t_comment ADD CONSTRAINT FK_video_id1 FOREIGN KEY (video_id) REFERENCES t_video (video_id);
alter table t_comment ADD CONSTRAINT FK_course_id1 FOREIGN KEY (course_id) REFERENCES t_course (course_id);
alter table t_comment ALTER COLUMN comment_ispass SET DEFAULT '否';

insert into t_comment (comment_id,comment_content,comment_timestamp,comment_ispass,user_id,video_id,course_id)
 values('322605af-3507-41be-835b-cc93950caa2d','java讲的很好','2015-12-08','是','a28e34eb-ec9d-43cd-a297-42abb14afcf9','04ad0719-2b0f-478c-9b04-11d0b15144c6','8c2ded0e-0455-4631-a3c4-b3c50aeda12f');
insert into t_comment (comment_id,comment_content,comment_timestamp,comment_ispass,user_id,video_id,course_id)
 values('e17e6b63-85a3-44df-99cd-8ebe5b9c61b9','web前端讲的很好','2015-12-08','否','a28e34eb-ec9d-43cd-a297-42abb14afcf9','0f69cf5d-682d-4d49-8b63-fd9086580e6a','218969b9-4e21-484a-90fa-e9e683fc082c');
insert into t_comment (comment_id,comment_content,comment_timestamp,comment_ispass,user_id,video_id,course_id)
 values('cf3ad103-1277-4b78-bb81-e015b209eb61','java讲的很好','2015-12-08','是','a28e34eb-ec9d-43cd-a297-42abb14afcf9','10c93b23-7558-4eb9-945a-4ffaacd0c8e9','8c2ded0e-0455-4631-a3c4-b3c50aeda12f');

insert into t_comment (comment_id,comment_content,comment_timestamp,comment_ispass,user_id,video_id,course_id)
 values('b4b802a6-0d45-49c6-85c1-6c6825722f57','UI设计讲的很好1','2015-12-08','否','a28e34eb-ec9d-43cd-a297-42abb14afcf9','1d7b41a0-ae54-41e1-be8b-a29bc1bfe4cb','690346e0-6d99-4caa-86dc-7e4e981a88b4');
insert into t_comment (comment_id,comment_content,comment_timestamp,comment_ispass,user_id,video_id,course_id)
 values('9bf4ec1a-ea25-499c-a276-21fda7931b33','java讲的很好1','2015-12-08','是','a28e34eb-ec9d-43cd-a297-42abb14afcf9','1f0f8d64-5aed-41c9-b102-fecab6e24cca','8c2ded0e-0455-4631-a3c4-b3c50aeda12f');
insert into t_comment (comment_id,comment_content,comment_timestamp,comment_ispass,user_id,video_id,course_id)
 values('79ea14ec-d79c-410b-8552-5f06c8577cb6','linux讲的很好1','2015-12-08','否','a28e34eb-ec9d-43cd-a297-42abb14afcf9','25dd35e8-4678-4eec-a7ac-77eff3af3478','48fab777-479c-4e15-84bb-f9a3ebc730b1');

insert into t_comment (comment_id,comment_content,comment_timestamp,comment_ispass,user_id,video_id,course_id)
 values('899ae23c-fe88-4796-9bd9-bc036ba10dc5','web前端讲的很好2','2015-12-08','是','a28e34eb-ec9d-43cd-a297-42abb14afcf9','3129dc4a-5861-476b-a971-feebe4ceebbd','218969b9-4e21-484a-90fa-e9e683fc082c');
insert into t_comment (comment_id,comment_content,comment_timestamp,comment_ispass,user_id,video_id,course_id)
 values('eb0fb881-655f-4527-968f-e270c8ea3557','java讲的很好2','2015-12-08','否','a28e34eb-ec9d-43cd-a297-42abb14afcf9','34d2614c-95c2-4adc-994a-9d3bfb887afc','8c2ded0e-0455-4631-a3c4-b3c50aeda12f');
insert into t_comment (comment_id,comment_content,comment_timestamp,comment_ispass,user_id,video_id,course_id)
 values('463c34da-cb4c-45fb-94b0-83799b9d6ebc','web前端讲的很好2','2015-12-08','是','a28e34eb-ec9d-43cd-a297-42abb14afcf9','39f5e9a8-4410-491f-83a4-5bce8f77087f','218969b9-4e21-484a-90fa-e9e683fc082c');


select * from t_comment;


/*活动记录表*/
DROP TABLE IF EXISTS `t_activity`;
CREATE TABLE `t_activity` (
  `activity_id` char(36) NOT NULL,               /*活动id uuid 主键*/
  `activity_title` varchar(50),                  /*活动标题*/
  `activity_date` timestamp,                     /*活动日期*/
  `longitude` double,                            /*活动地点的经度*/
  `latitude` double,                             /*活动地点的纬度*/
  `activity_location` varchar(50),               /*活动地点*/
  `activity_persons` int,                        /*活动人数*/
  `activity_cost` double,                        /*活动花费*/
  `activity_picture` varchar(50) NOT NULL,       /*活动图片*/
  `activity_details` varchar(500) NOT NULL,      /*活动细节*/
  `activity_ispass` char(1),                     /*活动是否通过 是或否 默认为否*/
  `user_id` char(36) NOT NULL,			 /*活动发起人（外键，t_user.user_id）*/
  `course_id` char(36) NOT NULL                  /*课程id（外键，t_course.course_id）*/
    
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
alter table t_activity add constraint PK_activity_id primary key(activity_id);
alter table t_activity ADD CONSTRAINT FK_activity_user_id FOREIGN KEY (user_id) REFERENCES t_user(user_id);
alter table t_activity ADD CONSTRAINT FK_activity_courseid FOREIGN KEY(course_id) REFERENCES t_course(course_id);
alter table t_activity ALTER COLUMN longitude SET DEFAULT 0.0;
alter table t_activity ALTER COLUMN latitude SET DEFAULT 0.0;
alter table t_activity ALTER COLUMN activity_ispass SET DEFAULT '否';
/*alter table t_activity add column (activity_ispass char(1));*/

insert into t_activity(activity_id,activity_title,activity_date,longitude,latitude,activity_location,activity_persons,activity_cost,activity_picture,activity_details,user_id,course_id)
values('d9758edb-ba5c-4ee0-9e23-5bb4e035701f','户外远足','2015-12-8',100.000001,100.000001,'北京市房山区',58,15800,'logo.png','增加团队凝聚力','a28e34eb-ec9d-43cd-a297-42abb14afcf9','8c2ded0e-0455-4631-a3c4-b3c50aeda12f');
insert into t_activity(activity_id,activity_title,activity_date,longitude,latitude,activity_location,activity_persons,activity_cost,activity_picture,activity_details,user_id,course_id)
values('b7e8404e-f749-4861-922c-5a6b40ccb675','郊野露宿','2015-12-8',100.000001,100.000001,'北京市密云区',58,15800,'logo.png','增加团队凝聚力','a28e34eb-ec9d-43cd-a297-42abb14afcf9','8c2ded0e-0455-4631-a3c4-b3c50aeda12f');
insert into t_activity(activity_id,activity_title,activity_date,longitude,latitude,activity_location,activity_persons,activity_cost,activity_picture,activity_details,user_id,course_id)
values('62844eb3-5e5e-4d41-bdd6-1a78ffa56a41','十度漂流','2015-12-8',100.000001,100.000001,'北京市房山区',58,15800,'logo.png','增加团队凝聚力','a28e34eb-ec9d-43cd-a297-42abb14afcf9','8c2ded0e-0455-4631-a3c4-b3c50aeda12f');
insert into t_activity(activity_id,activity_title,activity_date,longitude,latitude,activity_location,activity_persons,activity_cost,activity_picture,activity_details,user_id,course_id)
values('1b1d513c-4c49-4534-b6b1-095d0eaca0a8','参观故宫','2015-12-8',100.000001,100.000001,'北京市东城区',58,15800,'logo.png','增加团队凝聚力','a28e34eb-ec9d-43cd-a297-42abb14afcf9','8c2ded0e-0455-4631-a3c4-b3c50aeda12f');
insert into t_activity(activity_id,activity_title,activity_date,longitude,latitude,activity_location,activity_persons,activity_cost,activity_picture,activity_details,user_id,course_id)
values('5ef4795b-1b3f-417a-9c5d-623e608ec844','八达岭长城','2015-12-8',100.000001,100.000001,'北京市昌平区',58,15800,'logo.png','增加团队凝聚力','a28e34eb-ec9d-43cd-a297-42abb14afcf9','8c2ded0e-0455-4631-a3c4-b3c50aeda12f');
insert into t_activity(activity_id,activity_title,activity_date,longitude,latitude,activity_location,activity_persons,activity_cost,activity_picture,activity_details,user_id,course_id)
values('adb9b458-aabc-478b-9d8e-0997b828edeb','常营公园摄影','2015-12-8',100.000001,100.000001,'北京市朝阳区',58,15800,'logo.png','增加团队凝聚力','a28e34eb-ec9d-43cd-a297-42abb14afcf9','8c2ded0e-0455-4631-a3c4-b3c50aeda12f');
insert into t_activity(activity_id,activity_title,activity_date,longitude,latitude,activity_location,activity_persons,activity_cost,activity_picture,activity_details,user_id,course_id)
values('f1a17e98-31aa-4056-b45b-88452cddb565','长盈天街购物','2015-12-8',100.000001,100.000001,'北京市朝阳区',58,15800,'logo.png','增加团队凝聚力','a28e34eb-ec9d-43cd-a297-42abb14afcf9','8c2ded0e-0455-4631-a3c4-b3c50aeda12f');




select * from t_activity;

/*用户参与活动表*/
DROP TABLE IF EXISTS `t_participation`;
CREATE TABLE `t_participation` (
  `ptct_id` char(36) NOT NULL,               /*用户参与活动id uuid 主键*/
  `user_id` char(36) NOT NULL,		     /*哪个用户参与活动*/
  `activity_id` char(36) NOT NULL            /*参与的是哪个活动，活动id（外键，t_activity.activity_id）*/
    
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
alter table t_participation add constraint PK_ptct_id primary key(ptct_id);
alter table t_participation ADD CONSTRAINT FK_participation_user_id FOREIGN KEY (user_id) REFERENCES t_user (user_id);
alter table t_participation ADD CONSTRAINT FK_participation_activity_id foreign key(activity_id) REFERENCES t_activity(activity_id);

insert into t_participation (ptct_id,user_id,activity_id)
values('6164cb10-1dd3-4692-ad6a-f67c3080a3a2','a28e34eb-ec9d-43cd-a297-42abb14afcf9','d9758edb-ba5c-4ee0-9e23-5bb4e035701f');
insert into t_participation (ptct_id,user_id,activity_id)
values('83002185-8139-47a7-bf58-ffc01559be60','a28e34eb-ec9d-43cd-a297-42abb14afcf9','b7e8404e-f749-4861-922c-5a6b40ccb675');
insert into t_participation (ptct_id,user_id,activity_id)
values('2c06ac7e-28bf-4b69-98ea-9ce169b32f28','ecf1311d-de45-4851-a20f-4e6cf55073f0','d9758edb-ba5c-4ee0-9e23-5bb4e035701f');
insert into t_participation (ptct_id,user_id,activity_id)
values('f81f3a33-12a1-4964-875c-79d91c513984','ecf1311d-de45-4851-a20f-4e6cf55073f0','b7e8404e-f749-4861-922c-5a6b40ccb675');
select * from t_participation;


/*视频访问历史和视频缓存和视频收藏表*/
DROP TABLE IF EXISTS `t_history_cache_collection_purchased`;
CREATE TABLE `t_history_cache_collection_purchased` (
  `hccp_id` char(36) NOT NULL,                    /*视频访问历史和缓存id uuid 主键*/
  `user_id` char(36) NOT NULL,		          /*哪个用户访问的历史和缓存视频*/
  `video_id` char(36) NOT NULL,		          /*访问的是哪个视频*/
  `is_history` char(1) NOT NULL,                  /*是否是历史视频（是或否）默认为否*/
  `is_cache` char(1) NOT NULL,                    /*是否是缓存视频（是或否）默认为否*/
  `is_collection` char(1) NOT NULL,               /*是否是收藏视频（是或否）默认为否*/
  `is_purchased` char(1) NOT NULL                 /*是否是购买视频（是或否）默认为否*/
    
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
alter table t_history_cache_collection_purchased add constraint PK_hbc_id primary key(hccp_id);
alter table t_history_cache_collection_purchased ADD CONSTRAINT FK_hbc_user_id FOREIGN KEY (user_id) REFERENCES t_user (user_id);
alter table t_history_cache_collection_purchased ADD CONSTRAINT FK_hbc_video_id foreign key(video_id) REFERENCES t_video(video_id);
alter table t_history_cache_collection_purchased ALTER COLUMN is_history SET DEFAULT '否';
alter table t_history_cache_collection_purchased ALTER COLUMN is_cache SET DEFAULT '否';
alter table t_history_cache_collection_purchased ALTER COLUMN is_collection SET DEFAULT '否';
alter table t_history_cache_collection_purchased ALTER COLUMN is_purchased SET DEFAULT '否';

insert into t_history_cache_collection_purchased(hccp_id,user_id,video_id,is_history,is_cache,is_collection,is_purchased)
values('2f5e0a21-a60f-4dd9-9c33-618614455360','a28e34eb-ec9d-43cd-a297-42abb14afcf9','04ad0719-2b0f-478c-9b04-11d0b15144c6','是','是','是','是');
insert into t_history_cache_collection_purchased(hccp_id,user_id,video_id,is_history,is_cache,is_collection,is_purchased)
values('3c71d28e-433d-4607-a5f8-3db21435707e','a28e34eb-ec9d-43cd-a297-42abb14afcf9','0f69cf5d-682d-4d49-8b63-fd9086580e6a','是','是','是','是');
insert into t_history_cache_collection_purchased(hccp_id,user_id,video_id,is_history,is_cache,is_collection,is_purchased)
values('e41895a5-b20a-4816-8201-a02b6ad068ef','a28e34eb-ec9d-43cd-a297-42abb14afcf9','10c93b23-7558-4eb9-945a-4ffaacd0c8e9','是','是','是','是');

select * from t_history_cache_collection_purchased;

/*用户意见表*/
DROP TABLE IF EXISTS `t_opinion`;
CREATE TABLE `t_opinion` (
  `opinion_id` char(36),                 /*意见id uuid 主键*/
  `phone` varchar(30),			 /*用户联系方式*/
  `name` varchar(4),		         /*用户的真实姓名*/
  `content` varchar(200)                 /*意见内容*/
  /*`user_id` char(36) NOT NULL                     用户id（外键,t_user.user_id）*/
    
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
alter table t_opinion add constraint PK_opinion_id primary key(opinion_id);
/*alter table t_opinion ADD CONSTRAINT FK_opinion_user_id FOREIGN KEY (user_id) REFERENCES t_user (user_id);*/
insert into t_opinion (opinion_id,phone,`name`,`content`)
values('c75c6501-e0e2-4414-86a3-ed1e72d53391','13800138000','王涛','视频讲的很好');
select * from t_opinion;

/*课程分类表*/
DROP TABLE IF EXISTS `t_courseclassify`;
CREATE TABLE `t_courseclassify` (
  `courseclassify_id` char(36) NOT NULL,             /*课程分类id uuid 主键*/
  `courseclassify_name` varchar(50),		     /*课程分类的名称*/
  `courseclassify_details` varchar(200) NOT NULL,    /*课程分类详细介绍*/
  `course_id` char(36) NOT NULL                      /*课程id（外键,t_course.course_id）*/
    
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
alter table t_courseclassify add constraint PK_courseclassify_id primary key(courseclassify_id);
alter table t_courseclassify ADD CONSTRAINT FK_courseclassify_course_id FOREIGN KEY (course_id) REFERENCES t_course(course_id);
insert into t_courseclassify(courseclassify_id,courseclassify_name,courseclassify_details,course_id)
values('ef31cab0-d3f5-4c82-a0b1-8be4db6af3cb','java基础','java基础部分的环境搭建','8c2ded0e-0455-4631-a3c4-b3c50aeda12f');
insert into t_courseclassify(courseclassify_id,courseclassify_name,courseclassify_details,course_id)
values('58b9dc9e-1be6-4924-8bc0-714c74b3f24c','java基础','java基础部分的变量定义','8c2ded0e-0455-4631-a3c4-b3c50aeda12f');
select * from t_courseclassify;

/*好友表*/
DROP TABLE IF EXISTS `t_friendlist`;
CREATE TABLE `t_friendlist` (
  `friendlist_id` char(36) NOT NULL,             /*id uuid 主键*/
  `friendlist_details` text,                     /*好友信息，内容为json串，信息为所有好友的信息*/
  `user_id` char(36) NOT NULL                    /*用户id（外键,t_user.user_id）*/
    
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
alter table t_friendlist add constraint PK_friendlist_id primary key(friendlist_id);
alter table t_friendlist ADD CONSTRAINT FK_friendlist_user_id FOREIGN KEY (user_id) REFERENCES t_user(user_id);

/*功能模块表*/
DROP TABLE IF EXISTS `t_module`;
CREATE TABLE `t_module` (
  `module_id` char(36) NOT NULL,                /*id uuid 主键*/
  `module_name` varchar(50)                     /*模块名*/
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
alter table t_module add constraint PK_module_id primary key(module_id);
insert into t_module (module_id,module_name)values('3d343346-3dd0-4313-8765-e91e9127b361','角色管理');
insert into t_module (module_id,module_name)values('a30e7a79-f504-4608-a5ca-7e734a332882','用户管理');
insert into t_module (module_id,module_name)values('7effb19e-af56-4d26-86ef-f64ee742b927','课程管理');
insert into t_module (module_id,module_name)values('10509c6a-d396-4523-848b-39dffd117bc0','活动管理');
insert into t_module (module_id,module_name)values('7e58a067-47fb-478c-b39c-75bac06d6344','视频管理');
insert into t_module (module_id,module_name)values('bb2d5d18-133a-40c6-9e34-edc6f10c460d','评论管理');
select * from t_module;

/*用户和模块中间表*/
DROP TABLE IF EXISTS `t_user_module`;
CREATE TABLE `t_user_module` (
  `uid` char(36) NOT NULL,        /*用户id 外键*/
  `mid` char(36) NOT NULL         /*模块id 外键*/
 
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
alter table t_user_module add constraint PK_user_module_id primary key(uid,mid);
alter table t_user_module add constraint FK_user_module_uid foreign key(uid) references t_user(user_id);
alter table t_user_module add constraint FK_user_module_mid foreign key(mid) references t_module(module_id);
insert into t_user_module(uid,mid)values('a28e34eb-ec9d-43cd-a297-42abb14afcf9','3d343346-3dd0-4313-8765-e91e9127b361');
insert into t_user_module(uid,mid)values('a28e34eb-ec9d-43cd-a297-42abb14afcf9','a30e7a79-f504-4608-a5ca-7e734a332882');
insert into t_user_module(uid,mid)values('a28e34eb-ec9d-43cd-a297-42abb14afcf9','7effb19e-af56-4d26-86ef-f64ee742b927');
insert into t_user_module(uid,mid)values('a28e34eb-ec9d-43cd-a297-42abb14afcf9','10509c6a-d396-4523-848b-39dffd117bc0');
insert into t_user_module(uid,mid)values('a28e34eb-ec9d-43cd-a297-42abb14afcf9','7e58a067-47fb-478c-b39c-75bac06d6344');
insert into t_user_module(uid,mid)values('a28e34eb-ec9d-43cd-a297-42abb14afcf9','bb2d5d18-133a-40c6-9e34-edc6f10c460d');

insert into t_user_module(uid,mid)values('7008ffa6-e01d-48ed-a460-dbf2a4908bfa','3d343346-3dd0-4313-8765-e91e9127b361');
insert into t_user_module(uid,mid)values('7008ffa6-e01d-48ed-a460-dbf2a4908bfa','a30e7a79-f504-4608-a5ca-7e734a332882');
insert into t_user_module(uid,mid)values('7008ffa6-e01d-48ed-a460-dbf2a4908bfa','7effb19e-af56-4d26-86ef-f64ee742b927');
insert into t_user_module(uid,mid)values('7008ffa6-e01d-48ed-a460-dbf2a4908bfa','10509c6a-d396-4523-848b-39dffd117bc0');

select * from t_user_module;