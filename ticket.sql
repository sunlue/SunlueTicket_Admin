/*
SQLyog Ultimate v11.25 (64 bit)
MySQL - 5.7.17-log : Database - sunlue_ticket
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`sunlue_ticket` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `sunlue_ticket`;

/*Table structure for table `sunlue_access` */

DROP TABLE IF EXISTS `sunlue_access`;

CREATE TABLE `sunlue_access` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `type` enum('pc','wap','mp_weixin','mp_alipay','mp_baidu','android','ios','weixin_public') DEFAULT NULL COMMENT 'PC,wap,微信小程序,支付宝小程序,百度小程序,安卓,IOS',
  `ip` char(50) NOT NULL COMMENT '访问ip',
  `referer` varchar(200) DEFAULT NULL COMMENT '访问来源',
  `domain` varchar(100) DEFAULT NULL,
  `date` date NOT NULL COMMENT '访问日期',
  `time` time NOT NULL COMMENT '访问时间',
  `cookie` char(20) DEFAULT NULL,
  `is_del` char(20) DEFAULT NULL,
  `last_modify_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='访问统计';

/*Data for the table `sunlue_access` */

insert  into `sunlue_access`(`id`,`type`,`ip`,`referer`,`domain`,`date`,`time`,`cookie`,`is_del`,`last_modify_time`) values (1,'pc','127.0.0.1','','','2019-04-19','11:48:50','15556454001167',NULL,'2019-04-19 11:48:50'),(2,'wap','127.0.0.1','','','2019-04-19','11:48:58','15556454001167',NULL,'2019-04-19 11:48:58'),(3,'android','127.0.0.1','','','2019-04-19','11:48:58','15556454001167',NULL,'2019-04-19 11:48:58'),(4,'mp_baidu','127.0.0.1','','','2019-04-19','11:48:59','15556454001167',NULL,'2019-04-19 11:48:59'),(5,'weixin_public','127.0.0.1','','','2019-04-19','11:48:59','15556454001167',NULL,'2019-04-19 11:48:59'),(6,'pc','127.0.0.1','','','2019-04-25','11:48:59','15556454001167',NULL,'2019-04-19 11:48:59'),(7,'mp_alipay','127.0.0.1','','','2019-04-19','11:49:00','15556454001167',NULL,'2019-04-19 11:49:00'),(8,'pc','127.0.0.1','','','2019-04-19','11:49:00','15556454001167',NULL,'2019-04-19 11:49:00'),(9,'ios','127.0.0.1','','','2019-04-03','11:49:00','15556454001167',NULL,'2019-04-19 11:49:00'),(10,'mp_weixin','127.0.0.1','','','2019-04-19','11:49:00','15556454001167',NULL,'2019-04-19 11:49:00'),(11,'pc','127.0.0.1','','','2019-04-19','11:49:00','15556454001167',NULL,'2019-04-19 11:49:00'),(12,'pc','127.0.0.1','','','2019-04-19','11:49:01','15556454001167',NULL,'2019-04-19 11:49:01');

/*Table structure for table `sunlue_common_img` */

DROP TABLE IF EXISTS `sunlue_common_img`;

CREATE TABLE `sunlue_common_img` (
  `_hash` char(128) NOT NULL COMMENT '哈希唯一',
  `url` varchar(200) NOT NULL COMMENT '图片访问路径',
  `dir` char(200) NOT NULL COMMENT '图片保存文件夹',
  `name` char(255) NOT NULL COMMENT '图片保存名称',
  `file` varchar(100) DEFAULT NULL COMMENT '图片原始名称',
  `ext` char(10) DEFAULT NULL COMMENT '图片后缀',
  `core` varchar(100) DEFAULT NULL COMMENT '裁剪图',
  `thumb` varchar(100) DEFAULT NULL COMMENT '缩略图',
  `size` blob NOT NULL COMMENT '大小',
  `by_user` char(100) NOT NULL,
  `by_time` datetime NOT NULL,
  `by_ip` char(50) NOT NULL,
  `is_del` char(20) DEFAULT NULL,
  PRIMARY KEY (`_hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='图片集合表';

/*Data for the table `sunlue_common_img` */

insert  into `sunlue_common_img`(`_hash`,`url`,`dir`,`name`,`file`,`ext`,`core`,`thumb`,`size`,`by_user`,`by_time`,`by_ip`,`is_del`) values ('_hash_5caff50feb8e1','assets/img/20190412/2a35045dd07d04eecec51bb3608aff53.jpg','assets/img/20190412','u=2047152331,533660941&fm=173&app=25&f=JPEG - 副本 (2).jpg','2a35045dd07d04eecec51bb3608aff53','jpg','','','7552','','2019-04-12 10:16:47','127.0.0.1','1555035458'),('_hash_5caff54cacdbc','assets/img/20190412/11f0c16d17c2369b98afbb7dcd81df8f.jpg','assets/img/20190412','u=2047152331,533660941&fm=173&app=25&f=JPEG - 副本 (3).jpg','11f0c16d17c2369b98afbb7dcd81df8f','jpg','','','7552','','2019-04-12 10:17:48','127.0.0.1',NULL),('_hash_5caff5720fab7','assets/img/20190412/6443a7ff04fce77fe73a36f671ef42d1.jpg','assets/img/20190412','u=3968580445,2015989776&fm=173&app=25&f=JPEG - 副本 (3).jpg','6443a7ff04fce77fe73a36f671ef42d1','jpg','','','7300','','2019-04-12 10:18:26','127.0.0.1',NULL),('_hash_5caff5fe07457','assets/img/20190412/fae76f56069a180001f518aed6c8ea51.jpg','assets/img/20190412','1.jpg','fae76f56069a180001f518aed6c8ea51','jpg','','','7552','','2019-04-12 10:20:46','127.0.0.1',NULL);

/*Table structure for table `sunlue_member_list` */

DROP TABLE IF EXISTS `sunlue_member_list`;

CREATE TABLE `sunlue_member_list` (
  `member_id` int(10) NOT NULL AUTO_INCREMENT,
  `weixin_id` char(50) COLLATE utf8_bin DEFAULT NULL,
  `web_id` char(50) COLLATE utf8_bin DEFAULT NULL,
  `is_del` char(10) COLLATE utf8_bin DEFAULT NULL,
  `last_modify_time` datetime DEFAULT NULL,
  PRIMARY KEY (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `sunlue_member_list` */

/*Table structure for table `sunlue_member_mini` */

DROP TABLE IF EXISTS `sunlue_member_mini`;

CREATE TABLE `sunlue_member_mini` (
  `uniqid` char(50) COLLATE utf8_bin NOT NULL,
  `appid` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `openId` char(50) COLLATE utf8_bin NOT NULL,
  `avatarUrl` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `city` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `language` char(20) COLLATE utf8_bin DEFAULT NULL,
  `country` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `gender` tinyint(1) DEFAULT NULL,
  `nickName` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `province` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `is_del` char(20) COLLATE utf8_bin DEFAULT NULL,
  `last_modify_time` datetime DEFAULT NULL,
  `provider` enum('weixin') COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`uniqid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='小程序用户';

/*Data for the table `sunlue_member_mini` */

insert  into `sunlue_member_mini`(`uniqid`,`appid`,`openId`,`avatarUrl`,`city`,`language`,`country`,`gender`,`nickName`,`province`,`is_del`,`last_modify_time`,`provider`) values ('mimi_weixin_5cb40bb094ac5','wxf325a048b1f25d79','otbKZ5SLCm_c4XAkTwAunOkRDiXc','https://wx.qlogo.cn/mmopen/vi_32/Gh0lmpj20sPMHdRZV0E2zdkDlC9q6YgXpF7JpHdVqQiagEeI5TzUQRiaXwLRibxhxeTObtNpfEkpcnd0r0LEZVNpQ/132','Mianyang','zh_CN','China',1,'eByte','Sichuan',NULL,'2019-04-15 12:45:36','weixin');

/*Table structure for table `sunlue_member_web` */

DROP TABLE IF EXISTS `sunlue_member_web`;

CREATE TABLE `sunlue_member_web` (
  `uniqid` char(32) NOT NULL,
  `avatarUrl` varchar(100) DEFAULT NULL COMMENT '头像',
  `thumbnail` varchar(100) DEFAULT NULL COMMENT '缩略图',
  `alias` varchar(100) NOT NULL COMMENT '用户别名',
  `account` varchar(100) NOT NULL COMMENT '用户账号',
  `password` varchar(100) NOT NULL COMMENT '用户密码',
  `key` varchar(100) NOT NULL COMMENT '用户密钥',
  `mobile` char(20) DEFAULT NULL COMMENT '手机号',
  `remark` text COMMENT '备注',
  `login_count` int(10) NOT NULL DEFAULT '0' COMMENT '登录次数',
  `last_login_time` datetime DEFAULT NULL COMMENT '最后登录时间',
  `is_ban` char(10) DEFAULT NULL COMMENT '禁止标记',
  `is_del` char(10) DEFAULT NULL COMMENT '删除标记',
  `last_modify_time` datetime DEFAULT NULL,
  PRIMARY KEY (`uniqid`),
  UNIQUE KEY `account` (`account`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会员用户登录表';

/*Data for the table `sunlue_member_web` */

insert  into `sunlue_member_web`(`uniqid`,`avatarUrl`,`thumbnail`,`alias`,`account`,`password`,`key`,`mobile`,`remark`,`login_count`,`last_login_time`,`is_ban`,`is_del`,`last_modify_time`) values ('web_5caead86d47b6',NULL,NULL,'','aaa','DEE5A2CFBD43F076E15CA7DD13094563','SXHY24WNPBCFQNGNR3AGNR6QJPIKFABQV6E3AYFKKKI','',NULL,1,'2019-04-11 10:59:19',NULL,NULL,'2019-04-11 10:59:18');

/*Table structure for table `sunlue_member_weixin` */

DROP TABLE IF EXISTS `sunlue_member_weixin`;

CREATE TABLE `sunlue_member_weixin` (
  `uniqid` char(32) NOT NULL,
  `openid` char(32) NOT NULL,
  `nickname` varchar(100) DEFAULT NULL,
  `sex` tinyint(2) DEFAULT NULL,
  `language` varchar(100) DEFAULT NULL,
  `province` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `headimgurl` varchar(255) DEFAULT NULL,
  `unionid` varchar(255) DEFAULT NULL,
  `mobile` char(20) DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  `add_time` datetime DEFAULT NULL,
  `is_del` char(1) DEFAULT NULL,
  `last_modify_time` datetime DEFAULT NULL,
  PRIMARY KEY (`uniqid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='微信公众号用户';

/*Data for the table `sunlue_member_weixin` */

insert  into `sunlue_member_weixin`(`uniqid`,`openid`,`nickname`,`sex`,`language`,`province`,`city`,`country`,`headimgurl`,`unionid`,`mobile`,`token`,`add_time`,`is_del`,`last_modify_time`) values ('mpweixin_5cac40869cc2a','o0nOW048dgJl6yzGw2zyaoOhcm6Q','流年时光岁月',1,'zh_CN','四川','绵阳','中国','http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIBC4o0cb40AdWq7yH7EibcxnUvcg3jflgHg6GMbBcNXQ4DGxJZJVJicRxLAnia3G5P8C1OSvKkq5Ujg/132',NULL,NULL,'20_UtIHtNe_fi799TvDovsITX9LHzUOFhaEcpkQBTlhP_H37OpruzmJWOicfBFzFOVUntm5wi5SOwTGEs1-dyMhXA','2019-04-09 14:49:42',NULL,'2019-04-09 14:49:42'),('mpweixin_5cadb491237d6','o0nOW04PREpZm9kPI3DW4xyQ3KNU','eByte',1,'zh_CN','四川','绵阳','中国','http://thirdwx.qlogo.cn/mmopen/vi_32/oJc2IiaoibeUm3HGMyHJ87Ja8rp5lfjaibicwSnYGh5kzUTR1Dkial2ibmLnoahgDQl6u2J1oGGBeFoPWNhgDB0HQKNQ/132',NULL,NULL,'20_uWB7eE5FrEfMj6bCvCN3-l6IqcFGH52VffzBRxt4957HY7jjYO-cRk6o-b9GYdi3bqOL3ITzVBbU1XjMHNb5BA','2019-04-10 17:17:05',NULL,'2019-04-10 17:17:05');

/*Table structure for table `sunlue_order_body` */

DROP TABLE IF EXISTS `sunlue_order_body`;

CREATE TABLE `sunlue_order_body` (
  `uniqid` char(50) NOT NULL,
  `order_id` varchar(50) NOT NULL COMMENT '订单id',
  `order_sn` varchar(50) NOT NULL COMMENT '订单编号',
  `ticket_id` int(10) NOT NULL COMMENT '票务id',
  `is_check` enum('yes','no') DEFAULT 'no' COMMENT '验票标记',
  `buy_time` datetime NOT NULL COMMENT '购买时间',
  `add_time` datetime DEFAULT NULL COMMENT '票务生成时间',
  `use_date` date DEFAULT NULL COMMENT '票务使用时间',
  `check_time` datetime DEFAULT NULL COMMENT '票务验证时间',
  `member_id` char(50) DEFAULT NULL COMMENT '会员识别号',
  `contact` varchar(100) NOT NULL COMMENT '联系人',
  `card_number` char(20) DEFAULT NULL COMMENT '证件号',
  `mobile` char(20) NOT NULL COMMENT '联系电话',
  `note` varchar(255) DEFAULT NULL COMMENT '备注',
  `pay_sn` varchar(50) NOT NULL COMMENT '支付编号',
  `pay_money` decimal(10,2) NOT NULL COMMENT '支付金额',
  `pay_time` datetime DEFAULT NULL COMMENT '支付时间',
  `pay_user` char(50) DEFAULT NULL COMMENT '支付人',
  `pay_type` enum('weixin','alipay') DEFAULT NULL COMMENT '支付方式',
  `pay_body` varchar(128) DEFAULT NULL,
  `state` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0无效1正常2已过期3退款中4已退款5已完成',
  `is_del` char(20) DEFAULT NULL,
  `last_modify_time` datetime DEFAULT NULL,
  PRIMARY KEY (`uniqid`),
  UNIQUE KEY `uniqid` (`uniqid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='票务订单明细';

/*Data for the table `sunlue_order_body` */

insert  into `sunlue_order_body`(`uniqid`,`order_id`,`order_sn`,`ticket_id`,`is_check`,`buy_time`,`add_time`,`use_date`,`check_time`,`member_id`,`contact`,`card_number`,`mobile`,`note`,`pay_sn`,`pay_money`,`pay_time`,`pay_user`,`pay_type`,`pay_body`,`state`,`is_del`,`last_modify_time`) values ('1554800786_5cac6092b67d1','35','T1904091706267176075CAC6092AF36E',1,'no','2019-04-09 17:06:26','2019-04-10 17:12:35','2019-04-12',NULL,'web_5caead86d47b6','aaa',NULL,'13212345678','','C87F2AA73ECC410EA532D3FE01318B60','100.00',NULL,NULL,NULL,NULL,3,NULL,'2019-04-12 15:59:14'),('1554800786_5cac6092b7365','35','T1904091706267176075CAC6092AF36E',1,'no','2019-04-09 17:06:26','2019-04-19 11:19:34','2019-04-12',NULL,'web_5caead86d47b6','aaa',NULL,'13212345678','','C87F2AA73ECC410EA532D3FE01318B60','100.00',NULL,NULL,NULL,NULL,1,NULL,'2019-04-12 15:59:13'),('1554800786_5cac6092b776e','35','T1904091706267176075CAC6092AF36E',1,'no','2019-04-09 17:06:26','2019-04-24 17:12:38','2019-04-12',NULL,'web_5caead86d47b6','aaa',NULL,'13212345678','','C87F2AA73ECC410EA532D3FE01318B60','100.00',NULL,NULL,NULL,NULL,2,NULL,'2019-04-12 15:59:07'),('1554801202_5cac62324e69a','36','T1904091713221895605CAC62322E4C5',1,'no','2019-04-09 17:13:22','2019-04-19 11:20:44','2019-04-12',NULL,'web_5caead86d47b6','aaa',NULL,'13212345678','','D706265A5303022532BA7B6FAB2D65D6','100.00',NULL,NULL,NULL,NULL,3,NULL,'2019-04-12 15:57:42'),('1554801934_5cac650e6f687','37','T1904091725341692775CAC650E29593',2,'no','2019-04-09 17:25:34','2019-04-12 17:12:27','2019-04-12',NULL,NULL,'anc',NULL,'13212345678','','D87F6B7FC8C3CFE74990BB7F377725E7','50.00',NULL,NULL,NULL,NULL,4,NULL,'2019-04-09 17:25:34'),('1554801934_5cac650e70368','37','T1904091725341692775CAC650E29593',2,'no','2019-04-09 17:25:34','2019-04-04 17:12:30','2019-04-12',NULL,'web_5caead86d47b6','anc',NULL,'13212345678','','D87F6B7FC8C3CFE74990BB7F377725E7','50.00',NULL,NULL,NULL,NULL,5,NULL,'2019-04-12 15:57:09'),('1554801934_5cac650e7080b','37','T1904091725341692775CAC650E29593',2,'no','2019-04-09 17:25:34','2019-04-07 17:12:33','2019-04-12',NULL,NULL,'anc',NULL,'13212345678','','D87F6B7FC8C3CFE74990BB7F377725E7','50.00',NULL,NULL,NULL,NULL,0,NULL,'2019-04-09 17:25:34'),('1554801934_5cac650e70d0c','37','T1904091725341692775CAC650E29593',4,'yes','2019-04-09 17:25:34','2019-04-18 17:07:02','2019-04-12','2019-04-19 11:23:50',NULL,'anc',NULL,'13212345678','','D87F6B7FC8C3CFE74990BB7F377725E7','50.00',NULL,NULL,NULL,NULL,0,NULL,'2019-04-09 17:25:34'),('1554801934_5cac650e71109','37','T1904091725341692775CAC650E29593',4,'no','2019-04-09 17:25:34','2019-04-11 17:13:27','2019-04-12',NULL,NULL,'anc',NULL,'13212345678','','D87F6B7FC8C3CFE74990BB7F377725E7','50.00',NULL,NULL,NULL,NULL,0,NULL,'2019-04-09 17:25:34'),('1554801934_5cac650e71507','37','T1904091725341692775CAC650E29593',3,'no','2019-04-09 17:25:34','2019-04-24 17:13:25','2019-04-12',NULL,NULL,'anc',NULL,'13212345678','','D87F6B7FC8C3CFE74990BB7F377725E7','50.00',NULL,NULL,NULL,NULL,0,NULL,'2019-04-09 17:25:34'),('1554801934_5cac650e718b4','37','T1904091725341692775CAC650E29593',3,'no','2019-04-09 17:25:34','2019-04-02 17:13:22','2019-04-12',NULL,NULL,'anc',NULL,'13212345678','','D87F6B7FC8C3CFE74990BB7F377725E7','50.00',NULL,NULL,NULL,NULL,0,NULL,'2019-04-09 17:25:34'),('1554801934_5cac650e71c48','37','T1904091725341692775CAC650E29593',4,'no','2019-04-09 17:25:34','2019-04-05 17:12:41','2019-04-12',NULL,NULL,'anc',NULL,'13212345678','','D87F6B7FC8C3CFE74990BB7F377725E7','50.00',NULL,NULL,NULL,NULL,0,NULL,'2019-04-09 17:25:34'),('1554801934_5cac650e7221a','37','T1904091725341692775CAC650E29593',4,'no','2019-04-09 17:25:34','2019-04-11 17:13:30','2019-04-12',NULL,NULL,'anc',NULL,'13212345678','','D87F6B7FC8C3CFE74990BB7F377725E7','50.00',NULL,NULL,NULL,NULL,0,NULL,'2019-04-09 17:25:34'),('1554801934_5cac650e72649','37','T1904091725341692775CAC650E29593',4,'no','2019-04-09 17:25:34',NULL,'2019-04-12',NULL,NULL,'anc',NULL,'13212345678','','D87F6B7FC8C3CFE74990BB7F377725E7','50.00',NULL,NULL,NULL,NULL,0,NULL,'2019-04-09 17:25:34'),('1554801934_5cac650e72ba7','37','T1904091725341692775CAC650E29593',3,'no','2019-04-09 17:25:34','2019-04-19 17:13:21','2019-04-12',NULL,NULL,'anc',NULL,'13212345678','','D87F6B7FC8C3CFE74990BB7F377725E7','50.00',NULL,NULL,NULL,NULL,0,NULL,'2019-04-09 17:25:34'),('1554801934_5cac650e7300b','37','T1904091725341692775CAC650E29593',4,'no','2019-04-09 17:25:34',NULL,'2019-04-12',NULL,NULL,'anc',NULL,'13212345678','','D87F6B7FC8C3CFE74990BB7F377725E7','50.00',NULL,NULL,NULL,NULL,0,NULL,'2019-04-09 17:25:34'),('1554801934_5cac650e733a3','37','T1904091725341692775CAC650E29593',4,'no','2019-04-09 17:25:34',NULL,'2019-04-12',NULL,NULL,'anc',NULL,'13212345678','','D87F6B7FC8C3CFE74990BB7F377725E7','50.00',NULL,NULL,NULL,NULL,0,NULL,'2019-04-09 17:25:34'),('1554801934_5cac650e73896','37','T1904091725341692775CAC650E29593',4,'no','2019-04-09 17:25:34',NULL,'2019-04-12',NULL,NULL,'anc',NULL,'13212345678','','D87F6B7FC8C3CFE74990BB7F377725E7','50.00',NULL,NULL,NULL,NULL,0,NULL,'2019-04-09 17:25:34');

/*Table structure for table `sunlue_order_list` */

DROP TABLE IF EXISTS `sunlue_order_list`;

CREATE TABLE `sunlue_order_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_sn` varchar(50) NOT NULL COMMENT '订单编号',
  `date` date NOT NULL COMMENT '到达时间',
  `member_id` char(50) NOT NULL COMMENT '会员信息',
  `contact` varchar(100) NOT NULL COMMENT '联系人',
  `mobile` char(20) NOT NULL COMMENT '联系电话',
  `card_number` char(20) DEFAULT NULL COMMENT '证件号',
  `note` varchar(255) DEFAULT NULL COMMENT '备注',
  `details` text COMMENT '详情',
  `add_time` datetime NOT NULL COMMENT '创建时间',
  `trade_no` char(50) DEFAULT NULL COMMENT '支付编号',
  `unifiedorder` char(10) DEFAULT NULL COMMENT '下单标记',
  `state` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态（0待支付1支付成功2支付失败3已确认4已取消5退款中6已退款7已完成8已关闭）',
  `is_del` char(20) DEFAULT NULL,
  `last_modify_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_sn` (`order_sn`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 COMMENT='票务订单';

/*Data for the table `sunlue_order_list` */

insert  into `sunlue_order_list`(`id`,`order_sn`,`date`,`member_id`,`contact`,`mobile`,`card_number`,`note`,`details`,`add_time`,`trade_no`,`unifiedorder`,`state`,`is_del`,`last_modify_time`) values (35,'T1904091706267176075CAC6092AF36E','2019-04-18','mpweixin_5cac40869cc2a','aaa','13212345678','',NULL,NULL,'2019-04-09 17:06:26','C87F2AA73ECC410EA532D3FE01318B60','132',0,NULL,'2019-04-10 15:28:23'),(36,'T1904091713221895605CAC62322E4C5','2019-04-12','mpweixin_5cac40869cc2a','aaa','13212345678','',NULL,NULL,'2019-04-09 17:13:22','D706265A5303022532BA7B6FAB2D65D6',NULL,0,NULL,'2019-04-10 15:28:38'),(37,'T1904091725341692775CAC650E29593','2019-04-12','mpweixin_5cac40869cc2a','anc','13212345678','',NULL,NULL,'2019-04-09 17:25:34','D87F6B7FC8C3CFE74990BB7F377725E7',NULL,0,NULL,'2019-04-10 15:29:13');

/*Table structure for table `sunlue_order_refund` */

DROP TABLE IF EXISTS `sunlue_order_refund`;

CREATE TABLE `sunlue_order_refund` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `order_sn` varchar(100) CHARACTER SET utf8 NOT NULL COMMENT '订单号',
  `add_time` datetime NOT NULL COMMENT '申请时间',
  `trade_type` enum('weixin','alipay') CHARACTER SET utf8 NOT NULL COMMENT '支付方式',
  `trade_fee` decimal(10,2) NOT NULL COMMENT '支付金额',
  `trade_no` char(50) CHARACTER SET utf8 NOT NULL COMMENT '支付流水号',
  `refund_no` char(50) CHARACTER SET utf8 NOT NULL COMMENT '退款流水号',
  `refund_recv_account` varchar(255) CHARACTER SET utf8 DEFAULT '' COMMENT '退款账户',
  `refund_proof` text CHARACTER SET utf8 COMMENT '退款凭证',
  `refund_type` enum('weixin','alipay') CHARACTER SET utf8 DEFAULT NULL COMMENT '退款方式',
  `refund_time` datetime DEFAULT NULL COMMENT '退款时间',
  `refund_fee` double(10,2) DEFAULT '0.00' COMMENT '退款金额',
  `refund_error` varchar(255) CHARACTER SET utf8 DEFAULT '' COMMENT '退款失败，或者成功描述',
  `state` tinyint(1) NOT NULL DEFAULT '0' COMMENT '退款状态：0-未处理，1-处理中，2-成功,3-失败',
  `is_del` char(20) CHARACTER SET utf8 DEFAULT NULL,
  `last_modify_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='订单退款记录';

/*Data for the table `sunlue_order_refund` */

/*Table structure for table `sunlue_pay_config` */

DROP TABLE IF EXISTS `sunlue_pay_config`;

CREATE TABLE `sunlue_pay_config` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `provider` enum('alipay','weixin') COLLATE utf8_bin NOT NULL COMMENT '提供商',
  `swtich` enum('open','close') COLLATE utf8_bin NOT NULL COMMENT '开关',
  `config` text COLLATE utf8_bin COMMENT '配置',
  `is_del` char(10) COLLATE utf8_bin DEFAULT NULL,
  `last_modify_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='支付配置表';

/*Data for the table `sunlue_pay_config` */

insert  into `sunlue_pay_config`(`id`,`provider`,`swtich`,`config`,`is_del`,`last_modify_time`) values (1,'alipay','open','{\"name\":\"支付宝\",\"equipment\":[\"all\"],\"poundage\":\"%\",\"poundage_proport\":0,\"poundage_money\":0,\"account\":\"1422257580@qq.com\",\"partnerid\":\"2088221869495378\",\"partnerkey\":\"27z12l0bwy42o9cszgu64jn628fa80wh\",\"trading\":\"0\"}',NULL,'2019-03-05 15:25:16'),(2,'weixin','open','{\"name\":\"微信支付\",\"equipment\":[\"all\"],\"poundage\":\"%\",\"poundage_proport\":0.6,\"poundage_money\":0,\"secret\":\"ead02f9b44240da485d71cb286f564ed\",\"appid\":\"wxc0ae6e64361f2df5\",\"mchid\":\"1239809802\",\"mchkey\":\"ba87c72c4bc0f5fb5882dadd2c60deb4\"}',NULL,'2019-03-25 18:28:49');

/*Table structure for table `sunlue_sys_action_list` */

DROP TABLE IF EXISTS `sunlue_sys_action_list`;

CREATE TABLE `sunlue_sys_action_list` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` int(10) NOT NULL COMMENT '栏目id',
  `name` char(100) COLLATE utf8_bin NOT NULL COMMENT '行为名称',
  `action` char(50) COLLATE utf8_bin NOT NULL COMMENT '操作动作',
  `param` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '携带参数',
  `remark` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '行为备注',
  `is_del` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '删除标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='用户行为';

/*Data for the table `sunlue_sys_action_list` */

/*Table structure for table `sunlue_sys_code_dtl` */

DROP TABLE IF EXISTS `sunlue_sys_code_dtl`;

CREATE TABLE `sunlue_sys_code_dtl` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `code_table` char(100) COLLATE utf8_bin NOT NULL COMMENT '隐码对应表',
  `code_field` char(100) COLLATE utf8_bin NOT NULL COMMENT '隐码对应字段',
  `code_pid` int(10) NOT NULL DEFAULT '0' COMMENT '父级隐码',
  `code_sn` int(10) NOT NULL COMMENT '隐码编号',
  `comments` varchar(50) CHARACTER SET utf8 NOT NULL COMMENT '隐码明细描述',
  `contents` varchar(300) CHARACTER SET utf8 DEFAULT NULL COMMENT '详细内容',
  `is_show` enum('true','false') CHARACTER SET utf8 NOT NULL DEFAULT 'true' COMMENT '是否显示',
  `is_enabled` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态(1启用2禁用)',
  `is_del` char(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '删除标记',
  `last_modify_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_idx1` (`code_sn`,`code_table`,`code_field`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='隐码明细表';

/*Data for the table `sunlue_sys_code_dtl` */

/*Table structure for table `sunlue_sys_config` */

DROP TABLE IF EXISTS `sunlue_sys_config`;

CREATE TABLE `sunlue_sys_config` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `provider` enum('alipay','weixin') COLLATE utf8_bin NOT NULL COMMENT '提供商',
  `config` longtext COLLATE utf8_bin COMMENT '配置',
  `is_del` char(10) COLLATE utf8_bin DEFAULT NULL,
  `last_modify_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='系统配置表';

/*Data for the table `sunlue_sys_config` */

insert  into `sunlue_sys_config`(`id`,`provider`,`config`,`is_del`,`last_modify_time`) values (1,'weixin','{\"public\":{\"appid\":\"wx5ddb95e1baae0d7f\",\"secret\":\"c5e6aeb09061d2b83e6959dfc9fb7e50\",\"swtich\":\"open\",\"scope\":\"snsapi_userinfo\"},\"mini_program\":{\"appid\":\"wxf325a048b1f25d79\",\"secret\":\"00cadcf809ddc32605b5992adde00a03\",\"swtich\":\"open\",\"server\":{\"swtich\":\"close\",\"request\":\"\",\"socket\":\"\",\"uploadFile\":\"\",\"downloadFile\":\"\"},\"message\":{\"swtich\":\"close\",\"server_url\":\"\",\"token\":\"\",\"aeskey\":\"\",\"encryption_method\":\"1\",\"data_type\":\"JSON\"}}}',NULL,'2019-04-03 14:20:23');

/*Table structure for table `sunlue_sys_data_mysql` */

DROP TABLE IF EXISTS `sunlue_sys_data_mysql`;

CREATE TABLE `sunlue_sys_data_mysql` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `backup_dir` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '备份文件目录',
  `backup_time` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '备份耗时',
  `by_time` datetime DEFAULT NULL COMMENT '备份时间',
  `user_id` int(10) DEFAULT NULL COMMENT '备份人',
  `is_del` char(10) COLLATE utf8_bin DEFAULT NULL,
  `last_modify_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='mysql备份记录表';

/*Data for the table `sunlue_sys_data_mysql` */

/*Table structure for table `sunlue_sys_log_login` */

DROP TABLE IF EXISTS `sunlue_sys_log_login`;

CREATE TABLE `sunlue_sys_log_login` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) DEFAULT NULL COMMENT '登录用户',
  `by_ip` char(100) COLLATE utf8_bin NOT NULL COMMENT '登录IP',
  `by_time` datetime DEFAULT NULL COMMENT '登录时间',
  `page` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `result` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `sunlue_sys_log_login` */

/*Table structure for table `sunlue_sys_log_sql` */

DROP TABLE IF EXISTS `sunlue_sys_log_sql`;

CREATE TABLE `sunlue_sys_log_sql` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `type` enum('create','update','remove','select','disable','action') COLLATE utf8_bin DEFAULT NULL COMMENT '执行类型',
  `user_id` int(10) NOT NULL COMMENT '执行用户',
  `text` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '执行名称',
  `sql` text COLLATE utf8_bin NOT NULL COMMENT '执行的sql语句',
  `state` tinyint(1) NOT NULL COMMENT '状态（1正常2异常）',
  `abort` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '异常信息',
  `time` char(50) COLLATE utf8_bin NOT NULL COMMENT '耗时',
  `page` varchar(255) COLLATE utf8_bin NOT NULL COMMENT '执行地址',
  `ip` char(100) COLLATE utf8_bin NOT NULL COMMENT '执行IP',
  `by_time` datetime NOT NULL COMMENT '执行时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=390 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='sql记录表';

/*Data for the table `sunlue_sys_log_sql` */

insert  into `sunlue_sys_log_sql`(`id`,`type`,`user_id`,`text`,`sql`,`state`,`abort`,`time`,`page`,`ip`,`by_time`) values (359,'remove',0,'删除【1554800786_5cac6092b7365】','SELECT `uniqid`,`order_id`,`order_sn`,`ticket_id`,`is_check`,`buy_time`,`add_time`,`use_date`,`check_time`,`contact`,`card_number`,`mobile`,`note`,`pay_sn`,`pay_money`,`pay_time`,`pay_user`,`pay_type`,`pay_body`,`state` FROM `sunlue_order_body` WHERE (  `uniqid` = \'1554800786_5cac6092b7365\' ) AND `sunlue_order_body`.`is_del` IS NULL LIMIT 1',2,'Object of class think\\db\\Query could not be converted to string','0.000941秒','http://ticket.sunlue.cn/api/order.ticket/remove.html','127.0.0.1','2019-04-10 15:48:17'),(360,'remove',0,'删除【1554800786_5cac6092b7365】','SELECT * FROM `sunlue_order_body` WHERE (  `uniqid` = \'1554800786_5cac6092b7365\' ) AND `sunlue_order_body`.`is_del` IS NULL',2,'miss update condition','0.003869秒','http://ticket.sunlue.cn/api/order.ticket/remove.html','127.0.0.1','2019-04-10 15:49:15'),(361,'remove',0,'删除【1554800786_5cac6092b776e】','SELECT * FROM `sunlue_order_body` WHERE (  `uniqid` = \'1554800786_5cac6092b776e\' ) AND `sunlue_order_body`.`is_del` IS NULL',2,'miss update condition','0.003143秒','http://ticket.sunlue.cn/api/order.ticket/remove.html','127.0.0.1','2019-04-10 15:52:19'),(362,'remove',0,'删除【1554800786_5cac6092b776e】','SELECT * FROM `sunlue_order_body` WHERE (  `uniqid` = \'1554800786_5cac6092b776e\' ) AND `sunlue_order_body`.`is_del` IS NULL',1,'','0.002308秒','http://ticket.sunlue.cn/api/order.ticket/remove.html','127.0.0.1','2019-04-10 16:01:32'),(363,'remove',0,'删除【1554800786_5cac6092b67d1】','UPDATE `sunlue_order_body`  SET `is_del` = \'1554883405\' , `last_modify_time` = \'2019-04-10 16:03:25\'  WHERE (  `uniqid` = \'1554800786_5cac6092b67d1\' ) AND `sunlue_order_body`.`is_del` IS NULL',1,'','0.063832秒','http://ticket.sunlue.cn/api/order.ticket/remove.html','127.0.0.1','2019-04-10 16:03:25'),(364,'remove',0,'删除【1554800786_5cac6092b776e】','SELECT * FROM `sunlue_order_body` WHERE (  `uniqid` = \'1554800786_5cac6092b776e\' ) AND `sunlue_order_body`.`is_del` IS NULL',1,'','0.002169秒','http://ticket.sunlue.cn/api/order.ticket/remove.html','127.0.0.1','2019-04-10 16:04:03'),(365,'remove',0,'删除【1554800786_5cac6092b67d1】','SELECT * FROM `sunlue_order_body` WHERE (  `uniqid` = \'1554800786_5cac6092b67d1\' ) AND `sunlue_order_body`.`is_del` IS NULL',1,'','0.002192秒','http://ticket.sunlue.cn/api/order.ticket/remove.html','127.0.0.1','2019-04-10 16:04:10'),(366,'remove',0,'删除【1554800786_5cac6092b7365】','UPDATE `sunlue_order_body`  SET `is_del` = \'1554883459\' , `last_modify_time` = \'2019-04-10 16:04:19\'  WHERE (  `uniqid` = \'1554800786_5cac6092b7365\' ) AND `sunlue_order_body`.`is_del` IS NULL',1,'','0.060174秒','http://ticket.sunlue.cn/api/order.ticket/remove.html','127.0.0.1','2019-04-10 16:04:19'),(367,'remove',0,'删除【1554800786_5cac6092b67d1】','UPDATE `sunlue_order_body`  SET `is_del` = \'1554883571\' , `last_modify_time` = \'2019-04-10 16:06:11\'  WHERE (  `uniqid` = \'1554800786_5cac6092b67d1\' ) AND `sunlue_order_body`.`is_del` IS NULL',1,'','0.066857秒','http://ticket.sunlue.cn/api/order.ticket/remove.html','127.0.0.1','2019-04-10 16:06:11'),(368,'remove',0,'删除【1554800786_5cac6092b67d1】','SELECT * FROM `sunlue_order_body` WHERE (  `uniqid` = \'1554800786_5cac6092b67d1\' ) AND `sunlue_order_body`.`is_del` IS NULL',1,'','0.002455秒','http://ticket.sunlue.cn/api/order.ticket/remove.html','127.0.0.1','2019-04-10 16:06:18'),(369,'remove',0,'删除【1554800786_5cac6092b67d1】','SELECT * FROM `sunlue_order_body` WHERE (  `uniqid` = \'1554800786_5cac6092b67d1\' ) AND `sunlue_order_body`.`is_del` IS NULL',1,'','0.001913秒','http://ticket.sunlue.cn/api/order.ticket/remove.html','127.0.0.1','2019-04-10 16:06:37'),(370,'remove',0,'删除【1554800786_5cac6092b67d1】','SELECT * FROM `sunlue_order_body` WHERE (  `uniqid` = \'1554800786_5cac6092b67d1\' ) AND `sunlue_order_body`.`is_del` IS NULL',1,'','0.001867秒','http://ticket.sunlue.cn/api/order.ticket/remove.html','127.0.0.1','2019-04-10 16:06:48'),(371,'remove',0,'删除【1554800786_5cac6092b67d1】','SELECT * FROM `sunlue_order_body` WHERE (  `uniqid` = \'1554800786_5cac6092b67d1\' ) AND `sunlue_order_body`.`is_del` IS NULL',1,'','0.001842秒','http://ticket.sunlue.cn/api/order.ticket/remove.html','127.0.0.1','2019-04-10 16:07:56'),(372,'remove',0,'删除【1554800786_5cac6092b67d1】','SELECT * FROM `sunlue_order_body` WHERE (  `uniqid` = \'1554800786_5cac6092b67d1\' ) AND `sunlue_order_body`.`is_del` IS NULL',1,'','0.003172秒','http://ticket.sunlue.cn/api/order.ticket/remove.html','127.0.0.1','2019-04-10 16:11:56'),(373,'remove',0,'删除【1554800786_5cac6092b7365】','UPDATE `sunlue_order_body`  SET `is_del` = \'1554883920\' , `last_modify_time` = \'2019-04-10 16:12:00\'  WHERE (  `uniqid` = \'1554800786_5cac6092b7365\' ) AND `sunlue_order_body`.`is_del` IS NULL',1,'','0.068490秒','http://ticket.sunlue.cn/api/order.ticket/remove.html','127.0.0.1','2019-04-10 16:12:00'),(374,'remove',0,'删除【1554800786_5cac6092b67d1】','UPDATE `sunlue_order_body`  SET `is_del` = \'1554883954\' , `last_modify_time` = \'2019-04-10 16:12:34\'  WHERE (  `uniqid` = \'1554800786_5cac6092b67d1\' ) AND `sunlue_order_body`.`is_del` IS NULL',1,'','0.068042秒','http://ticket.sunlue.cn/api/order.ticket/remove.html','127.0.0.1','2019-04-10 16:12:34'),(375,'remove',0,'删除【1554800786_5cac6092b7365】','UPDATE `sunlue_order_body`  SET `is_del` = \'1554884013\' , `last_modify_time` = \'2019-04-10 16:13:33\'  WHERE (  `uniqid` = \'1554800786_5cac6092b7365\' ) AND `sunlue_order_body`.`is_del` IS NULL',1,'','0.069288秒','http://ticket.sunlue.cn/api/order.ticket/remove.html','127.0.0.1','2019-04-10 16:13:33'),(376,'create',0,'注册用户','INSERT INTO `sunlue_member_web` (`account` , `mobile` , `password` , `key` , `last_modify_time` , `uniqid`) VALUES (\'a\' , \'\' , \'54F69B8CE47C6969D51BAFBF61FA9317\' , \'SXHY24WNPBCFQNGNR3AGNR6QJPIJS3-LS923AIF2IKI\' , \'2019-04-11 10:53:19\' , \'web_5caeac1f74690\')',1,'','0.097362秒','http://ticket.sunlue.cn/api/member.reg/index.html','127.0.0.1','2019-04-11 10:53:19'),(377,'create',0,'注册用户','INSERT INTO `sunlue_member_web` (`account` , `mobile` , `password` , `key` , `last_modify_time` , `uniqid`) VALUES (\'admin\' , \'13212345678\' , \'E4F5A72B504250AA947E5E163BE13E73\' , \'SXHY24WNPBCFQNGNR3AGNR6QJPIJS6SVTLE_SOJ5FKI\' , \'2019-04-11 10:55:12\' , \'web_5caeac909656e\')',1,'','0.123134秒','http://ticket.sunlue.cn/api/member.reg/index.html','127.0.0.1','2019-04-11 10:55:12'),(378,'create',0,'注册用户','INSERT INTO `sunlue_member_web` (`account` , `mobile` , `password` , `key` , `last_modify_time` , `uniqid`) VALUES (\'admins\' , \'13212345679\' , \'E4741FB414CC24A0EE5ADDFE3CF4C152\' , \'SXHY24WNPBCFQNGNR3AGNR6QJPIKFYQWV6E4OI2JFKI\' , \'2019-04-11 10:58:09\' , \'web_5caead41d4cf6\')',1,'','0.060833秒','http://ticket.sunlue.cn/api/member.reg/index.html','127.0.0.1','2019-04-11 10:58:09'),(379,'create',0,'注册用户','INSERT INTO `sunlue_member_web` (`account` , `mobile` , `password` , `key` , `last_modify_time` , `uniqid`) VALUES (\'aaa\' , \'\' , \'DEE5A2CFBD43F076E15CA7DD13094563\' , \'SXHY24WNPBCFQNGNR3AGNR6QJPIKFABQV6E3AYFKKKI\' , \'2019-04-11 10:59:18\' , \'web_5caead86d47b6\')',1,'','0.064308秒','http://ticket.sunlue.cn/api/member.reg/index.html','127.0.0.1','2019-04-11 10:59:18'),(380,'update',0,'修改票务[网络即时门票半价网络即时门票半价网络即时门票半价网络即时门票半价网络即时门票半价网络即时门票半价网络即时门票半价网络即时门票半价网络即时门票半价]','UPDATE `sunlue_ticket_list`  SET `original` = 100 , `present` = 50 , `name` = \'网络即时门票半价网络即时门票半价网络即时门票半价网络即时门票半价网络即时门票半价网络即时门票半价网络即时门票半价网络即时门票半价网络即时门票半价\' , `intro` = \'<div style=\\\"text-align:center;\\\"><img width=\\\"100%\\\" src=\\\"https://s2.ax1x.com/2019/03/28/AdOogx.jpg\\\"/><img width=\\\"100%\\\" src=\\\"https://s2.ax1x.com/2019/03/28/AdOHKK.jpg\\\"/><img width=\\\"100%\\\" src=\\\"https://s2.ax1x.com/2019/03/28/AdOTv6.jpg\\\"/></div>\' , `shelves` = \'yes\' , `hot` = \'yes\' , `recom` = \'yes\' , `top` = \'yes\' , `thumb` = \'_hash_5cafe4dfb6f28\' , `type` = \'5c81de18ab3ff\' , `last_modify_time` = \'2019-04-12 09:07:45\'  WHERE (  `id` = 4 ) AND `sunlue_ticket_list`.`is_del` IS NULL',1,'','0.083682秒','http://ticket.sunlue.cn/api/ticket.lists.index/edit.html','127.0.0.1','2019-04-12 09:07:45'),(381,'update',0,'修改票务[网络即时门票全价]','UPDATE `sunlue_ticket_list`  SET `original` = 120 , `present` = 100 , `name` = \'网络即时门票全价\' , `intro` = \'<div style=\\\"text-align:center;\\\"><img width=\\\"100%\\\" src=\\\"https://s2.ax1x.com/2019/03/28/AdOogx.jpg\\\"/><img width=\\\"100%\\\" src=\\\"https://s2.ax1x.com/2019/03/28/AdOHKK.jpg\\\"/><img width=\\\"100%\\\" src=\\\"https://s2.ax1x.com/2019/03/28/AdOTv6.jpg\\\"/></div>\' , `shelves` = \'yes\' , `hot` = \'yes\' , `recom` = \'yes\' , `top` = \'yes\' , `thumb` = \'_hash_5cafe4ea9dc38\' , `type` = \'5c81de18ab3ff\' , `last_modify_time` = \'2019-04-12 09:07:56\'  WHERE (  `id` = 1 ) AND `sunlue_ticket_list`.`is_del` IS NULL',1,'','0.090986秒','http://ticket.sunlue.cn/api/ticket.lists.index/edit.html','127.0.0.1','2019-04-12 09:07:56'),(382,'update',0,'修改票务[网络即时门票全价]','UPDATE `sunlue_ticket_list`  SET `original` = 120 , `present` = 100 , `name` = \'网络即时门票全价\' , `intro` = \'<div style=\\\"text-align: center;\\\"><img src=\\\"https://s2.ax1x.com/2019/03/28/AdOogx.jpg\\\" width=\\\"100%\\\" /><img src=\\\"https://s2.ax1x.com/2019/03/28/AdOHKK.jpg\\\" width=\\\"100%\\\" /><img src=\\\"https://s2.ax1x.com/2019/03/28/AdOTv6.jpg\\\" width=\\\"100%\\\" /></div>\' , `shelves` = \'yes\' , `hot` = \'yes\' , `recom` = \'yes\' , `top` = \'yes\' , `know_id` = \'ticketKnow_5c9c40db67ffa\' , `thumb` = \'_hash_5caff54cacdbc\' , `type` = \'5c81de18ab3ff\' , `last_modify_time` = \'2019-04-12 10:18:14\'  WHERE (  `id` = 1 ) AND `sunlue_ticket_list`.`is_del` IS NULL',1,'','0.075760秒','http://ticket.sunlue.cn/api/ticket.lists.index/edit.html','127.0.0.1','2019-04-12 10:18:14'),(383,'update',0,'修改票务[网络即时门票半价网络即时门票半价网络即时门票半价网络即时门票半价网络即时门票半价网络即时门票半价网络即时门票半价网络即时门票半价网络即时门票半价]','UPDATE `sunlue_ticket_list`  SET `original` = 100 , `present` = 50 , `name` = \'网络即时门票半价网络即时门票半价网络即时门票半价网络即时门票半价网络即时门票半价网络即时门票半价网络即时门票半价网络即时门票半价网络即时门票半价\' , `intro` = \'<div style=\\\"text-align: center;\\\"><img src=\\\"https://s2.ax1x.com/2019/03/28/AdOogx.jpg\\\" width=\\\"100%\\\" /><img src=\\\"https://s2.ax1x.com/2019/03/28/AdOHKK.jpg\\\" width=\\\"100%\\\" /><img src=\\\"https://s2.ax1x.com/2019/03/28/AdOTv6.jpg\\\" width=\\\"100%\\\" /></div>\' , `shelves` = \'yes\' , `hot` = \'yes\' , `recom` = \'yes\' , `top` = \'yes\' , `know_id` = \'ticketKnow_5c9c40db67ffa\' , `thumb` = \'_hash_5caff5720fab7\' , `type` = \'5c81de18ab3ff\' , `last_modify_time` = \'2019-04-12 10:18:28\'  WHERE (  `id` = 4 ) AND `sunlue_ticket_list`.`is_del` IS NULL',1,'','0.081726秒','http://ticket.sunlue.cn/api/ticket.lists.index/edit.html','127.0.0.1','2019-04-12 10:18:28'),(384,'update',0,'修改票务[索道票]','UPDATE `sunlue_ticket_list`  SET `original` = 0 , `present` = 0 , `name` = \'索道票\' , `intro` = \'<div style=\\\"text-align: center;\\\"><img src=\\\"https://s2.ax1x.com/2019/03/28/AdOogx.jpg\\\" width=\\\"100%\\\" /><img src=\\\"https://s2.ax1x.com/2019/03/28/AdOHKK.jpg\\\" width=\\\"100%\\\" /><img src=\\\"https://s2.ax1x.com/2019/03/28/AdOTv6.jpg\\\" width=\\\"100%\\\" /></div>\' , `shelves` = \'yes\' , `hot` = \'no\' , `recom` = \'yes\' , `top` = \'yes\' , `know_id` = \'ticketKnow_5c9b383cdea07\' , `thumb` = \'_hash_5caff5fe07457\' , `type` = \'5c81de5c14b2a\' , `last_modify_time` = \'2019-04-12 10:20:47\'  WHERE (  `id` = 3 ) AND `sunlue_ticket_list`.`is_del` IS NULL',1,'','0.079583秒','http://ticket.sunlue.cn/api/ticket.lists.index/edit.html','127.0.0.1','2019-04-12 10:20:47'),(385,'remove',0,'删除【1554801934_5cac650e70368】','UPDATE `sunlue_order_body`  SET `is_del` = \'1555055829\' , `last_modify_time` = \'2019-04-12 15:57:09\'  WHERE (  `uniqid` = \'1554801934_5cac650e70368\' ) AND `sunlue_order_body`.`is_del` IS NULL',1,'','0.085079秒','http://ticket.sunlue.cn/api/order.ticket/remove.html','127.0.0.1','2019-04-12 15:57:09'),(386,'remove',0,'删除【1554801202_5cac62324e69a】','UPDATE `sunlue_order_body`  SET `is_del` = \'1555055862\' , `last_modify_time` = \'2019-04-12 15:57:42\'  WHERE (  `uniqid` = \'1554801202_5cac62324e69a\' ) AND `sunlue_order_body`.`is_del` IS NULL',1,'','0.078371秒','http://ticket.sunlue.cn/api/order.ticket/remove.html','127.0.0.1','2019-04-12 15:57:42'),(387,'remove',0,'删除【1554800786_5cac6092b776e】','UPDATE `sunlue_order_body`  SET `is_del` = \'1555055947\' , `last_modify_time` = \'2019-04-12 15:59:07\'  WHERE (  `uniqid` = \'1554800786_5cac6092b776e\' ) AND `sunlue_order_body`.`is_del` IS NULL',1,'','0.065165秒','http://ticket.sunlue.cn/api/order.ticket/remove.html','127.0.0.1','2019-04-12 15:59:07'),(388,'remove',0,'删除【1554800786_5cac6092b7365】','UPDATE `sunlue_order_body`  SET `is_del` = \'1555055953\' , `last_modify_time` = \'2019-04-12 15:59:13\'  WHERE (  `uniqid` = \'1554800786_5cac6092b7365\' ) AND `sunlue_order_body`.`is_del` IS NULL',1,'','0.060070秒','http://ticket.sunlue.cn/api/order.ticket/remove.html','127.0.0.1','2019-04-12 15:59:13'),(389,'update',0,'取消【1554800786_5cac6092b67d1】','UPDATE `sunlue_order_body`  SET `state` = 3 , `last_modify_time` = \'2019-04-12 15:59:14\'  WHERE (  `uniqid` = \'1554800786_5cac6092b67d1\' ) AND `sunlue_order_body`.`is_del` IS NULL',1,'','0.070919秒','http://ticket.sunlue.cn/api/order.ticket/refund.html','127.0.0.1','2019-04-12 15:59:14');

/*Table structure for table `sunlue_sys_menu_list` */

DROP TABLE IF EXISTS `sunlue_sys_menu_list`;

CREATE TABLE `sunlue_sys_menu_list` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `pid` int(10) NOT NULL COMMENT '父id',
  `code` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '编码',
  `name` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '名称',
  `_icon` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '图标',
  `_url` varchar(200) COLLATE utf8_bin NOT NULL DEFAULT '#' COMMENT '访问地址',
  `sort` int(10) NOT NULL DEFAULT '0' COMMENT '排序码',
  `badge_fun` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '统计函数',
  `remark` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  `is_del` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '删除标记',
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='被授权模块表';

/*Data for the table `sunlue_sys_menu_list` */

insert  into `sunlue_sys_menu_list`(`id`,`pid`,`code`,`name`,`_icon`,`_url`,`sort`,`badge_fun`,`remark`,`is_del`) values (1,0,'0','系统管理',NULL,'#',0,NULL,NULL,NULL),(2,1,'0','门票设置',NULL,'#',0,NULL,NULL,NULL),(3,1,'0','支付设置',NULL,'#',0,NULL,NULL,NULL),(4,1,'0','支付管理',NULL,'#',0,NULL,NULL,NULL);

/*Table structure for table `sunlue_sys_role_list` */

DROP TABLE IF EXISTS `sunlue_sys_role_list`;

CREATE TABLE `sunlue_sys_role_list` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `pid` int(10) DEFAULT '0' COMMENT '上级角色',
  `name` varchar(200) COLLATE utf8_bin NOT NULL COMMENT '名称',
  `menu` text COLLATE utf8_bin COMMENT '菜单权限',
  `action` text CHARACTER SET utf8 COMMENT '行为权限',
  `remark` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '备注',
  `is_del` char(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '删除标记',
  `last_modify_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='系统角色权限表';

/*Data for the table `sunlue_sys_role_list` */

/*Table structure for table `sunlue_sys_user_list` */

DROP TABLE IF EXISTS `sunlue_sys_user_list`;

CREATE TABLE `sunlue_sys_user_list` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `photo` varchar(100) DEFAULT NULL COMMENT '头像',
  `thumbnail` varchar(100) DEFAULT NULL COMMENT '缩略图',
  `alias` varchar(100) NOT NULL COMMENT '用户别名',
  `account` varchar(100) NOT NULL COMMENT '用户账号',
  `password` varchar(100) NOT NULL COMMENT '用户密码',
  `key` varchar(100) NOT NULL COMMENT '用户密钥',
  `wechat` char(100) DEFAULT NULL COMMENT '微信',
  `qq` char(20) DEFAULT NULL COMMENT 'qq',
  `remark` text COMMENT '备注',
  `login_count` int(10) NOT NULL DEFAULT '0' COMMENT '登录次数',
  `last_login_time` datetime DEFAULT NULL COMMENT '最后登录时间',
  `is_ban` char(10) DEFAULT NULL COMMENT '禁止标记',
  `is_del` char(10) DEFAULT NULL COMMENT '删除标记',
  `last_modify_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `account` (`account`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='管理员用户登录表';

/*Data for the table `sunlue_sys_user_list` */

insert  into `sunlue_sys_user_list`(`id`,`photo`,`thumbnail`,`alias`,`account`,`password`,`key`,`wechat`,`qq`,`remark`,`login_count`,`last_login_time`,`is_ban`,`is_del`,`last_modify_time`) values (1,NULL,NULL,'','manage','CF140E8FAF9AC98049AF8DA3645C505B','SXHY24WNPBCFQNGNR3Z1ZBONFWJ-S35SS82NAYGSJJY',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL),(2,NULL,NULL,'','admin','60FF2886BDC52F5583CDBDAFD63C7E32','SXHY24WNPBCFQNGNR3Z1ZBONFWJ-S35STKFRAOKSHJG',NULL,NULL,NULL,15,'2019-04-18 08:36:39',NULL,NULL,NULL);

/*Table structure for table `sunlue_sys_user_power` */

DROP TABLE IF EXISTS `sunlue_sys_user_power`;

CREATE TABLE `sunlue_sys_user_power` (
  `_hash` varchar(100) CHARACTER SET utf8 NOT NULL COMMENT '哈希唯一值',
  `user_id` int(10) NOT NULL COMMENT '用户id',
  `role` int(10) DEFAULT NULL COMMENT '角色权限',
  `last_modify_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `is_del` char(10) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`_hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='用户权限';

/*Data for the table `sunlue_sys_user_power` */

/*Table structure for table `sunlue_temp_number` */

DROP TABLE IF EXISTS `sunlue_temp_number`;

CREATE TABLE `sunlue_temp_number` (
  `number` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `sunlue_temp_number` */

insert  into `sunlue_temp_number`(`number`) values (0),(1),(2),(3),(4),(5),(6),(7),(8),(9);

/*Table structure for table `sunlue_ticket_know` */

DROP TABLE IF EXISTS `sunlue_ticket_know`;

CREATE TABLE `sunlue_ticket_know` (
  `uniqid` char(32) COLLATE utf8_bin NOT NULL,
  `name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '别名',
  `book_type` tinyint(1) NOT NULL COMMENT '1仅限当天2需提前预订3可提前预订',
  `book_day` int(10) DEFAULT NULL COMMENT '提前天数',
  `aging_type` tinyint(1) NOT NULL COMMENT '1仅限当天2可提前使用3可延期使用',
  `aging_day` int(10) DEFAULT NULL COMMENT '有效天数',
  `apply` text COLLATE utf8_bin COMMENT '适用条件',
  `limit` text COLLATE utf8_bin COMMENT '限购政策',
  `fee` text COLLATE utf8_bin COMMENT '费用包含',
  `use_method` text COLLATE utf8_bin COMMENT '使用方法',
  `address` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '入园地址',
  `start_time` time DEFAULT NULL COMMENT '入园开始时间',
  `end_time` time DEFAULT NULL COMMENT '入园结束时间',
  `details` text COLLATE utf8_bin COMMENT '补充说明',
  `refund` text COLLATE utf8_bin COMMENT '退改说明',
  `invoice` text COLLATE utf8_bin COMMENT '发票说明',
  `is_del` char(20) COLLATE utf8_bin DEFAULT NULL,
  `last_modify_time` datetime DEFAULT NULL,
  PRIMARY KEY (`uniqid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='购买须知';

/*Data for the table `sunlue_ticket_know` */

insert  into `sunlue_ticket_know`(`uniqid`,`name`,`book_type`,`book_day`,`aging_type`,`aging_day`,`apply`,`limit`,`fee`,`use_method`,`address`,`start_time`,`end_time`,`details`,`refund`,`invoice`,`is_del`,`last_modify_time`) values ('ticketKnow_5c9b383cdea07','别名1',2,3,2,3,'使用条件使用条件使用条件使用条件使用条件使用条件使用条件使用条件使用条件使用条件使用条件使用条件使用条件使用条件使用条件使用条件使用条件使用条件使用条件使用条件使用条件使用条件使用条件使用条件使用条件使用条件使用条件使用条件使用条件使用条件使用条件使用条件使用条件使用条件使用条件使用条件使用条件使用条件使用条件使用条件使用条件使用条件使用条件使用条件使用条件使用条件使用条件使用条件','限购政策','费用包含','使用方法','四川省绵阳市经开区绵州大道中段1号','08:00:00','18:00:00','','','',NULL,'2019-03-27 16:45:48'),('ticketKnow_5c9c40db67ffa','别名2',2,3,3,3,'使用条件','限购政策','<p><span style=\"text-decoration: line-through;\">费用说明</span></p><p><span style=\"text-decoration: line-through;\">费用说明</span></p><p><span style=\"text-decoration: line-through;\">费用说明</span></p><p><span style=\"text-decoration: line-through;\">费用说明</span></p><p><span style=\"text-decoration: line-through;\">费用说明</span></p><p><span style=\"text-decoration: line-through;\">费用说明</span></p><p><span style=\"text-decoration: line-through;\">费用说明</span></p><p><span style=\"text-decoration: line-through;\">费用说明</span></p><p><span style=\"text-decoration: line-through;\">费用说明</span></p><p><span style=\"text-decoration: line-through;\">费用说明</span></p><p><span style=\"text-decoration: line-through;\">费用说明</span></p><p><span style=\"text-decoration: line-through;\">费用说明</span></p><p><span style=\"text-decoration: line-through;\">费用说明</span></p><p><span style=\"text-decoration: line-through;\">费用说明</span></p><p><span style=\"text-decoration: line-through;\">费用说明</span></p><p><span style=\"text-decoration: line-through;\">费用说明</span></p><p><span style=\"text-decoration: line-through;\">费用说明</span></p><p><span style=\"text-decoration: line-through;\">费用说明</span></p><p><span style=\"text-decoration: line-through;\">费用说明</span></p><p><span style=\"text-decoration: line-through;\">费用说明</span></p><p><span style=\"text-decoration: line-through;\">费用说明</span></p><p><span style=\"text-decoration: line-through;\">费用说明</span></p><p><span style=\"text-decoration: line-through;\">费用说明</span></p><p><span style=\"text-decoration: line-through;\">费用说明</span></p>','使用方法','四川省绵阳市','08:00:00','18:00:00','补充说明','<p>不许退改</p>','<p>不提供发票</p>',NULL,'2019-03-28 14:15:15'),('ticketKnow_5c9c414f6be06','别名3',1,3,1,3,'a','a','<p>a</p>','a','a','08:00:00','18:00:00','a','<p>a</p>','<p>a</p>',NULL,'2019-03-28 11:36:47'),('ticketKnow_5c9c68225722d','别名4',0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1553754514','2019-03-28 14:28:34'),('ticketKnow_5c9c68eab7a9e','别名5',0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1553754505','2019-03-28 14:28:25');

/*Table structure for table `sunlue_ticket_list` */

DROP TABLE IF EXISTS `sunlue_ticket_list`;

CREATE TABLE `sunlue_ticket_list` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `type` char(32) COLLATE utf8_bin NOT NULL COMMENT '类型',
  `name` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '显示名称',
  `intro` text COLLATE utf8_bin COMMENT '票务简介',
  `original` decimal(10,2) DEFAULT NULL COMMENT '原价',
  `present` decimal(10,2) DEFAULT NULL COMMENT '售价',
  `hot` enum('yes','no') COLLATE utf8_bin DEFAULT NULL COMMENT '热门',
  `recom` enum('yes','no') COLLATE utf8_bin DEFAULT NULL COMMENT '推荐',
  `top` enum('yes','no') COLLATE utf8_bin DEFAULT NULL COMMENT '置顶',
  `shelves` enum('yes','no') COLLATE utf8_bin DEFAULT NULL COMMENT '上架',
  `thumb` char(128) COLLATE utf8_bin DEFAULT NULL COMMENT '缩略图',
  `sales` int(10) DEFAULT '0' COMMENT '已售',
  `know_id` char(32) COLLATE utf8_bin DEFAULT NULL COMMENT '票务须知',
  `is_del` char(10) COLLATE utf8_bin DEFAULT NULL,
  `last_modify_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='票务列表';

/*Data for the table `sunlue_ticket_list` */

insert  into `sunlue_ticket_list`(`id`,`type`,`name`,`intro`,`original`,`present`,`hot`,`recom`,`top`,`shelves`,`thumb`,`sales`,`know_id`,`is_del`,`last_modify_time`) values (1,'5c81de18ab3ff','网络即时门票全价','<div style=\"text-align: center;\"><img src=\"https://s2.ax1x.com/2019/03/28/AdOogx.jpg\" width=\"100%\" /><img src=\"https://s2.ax1x.com/2019/03/28/AdOHKK.jpg\" width=\"100%\" /><img src=\"https://s2.ax1x.com/2019/03/28/AdOTv6.jpg\" width=\"100%\" /></div>','120.00','100.00','yes','yes','yes','yes','_hash_5caff54cacdbc',0,'ticketKnow_5c9c40db67ffa',NULL,'2019-04-12 10:18:14'),(2,'5c81de18ab3ff','网络即时门票半价','<div style=\"text-align:center;\"><img width=\"100%\" src=\"https://s2.ax1x.com/2019/03/28/AdOogx.jpg\"/><img width=\"100%\" src=\"https://s2.ax1x.com/2019/03/28/AdOHKK.jpg\"/><img width=\"100%\" src=\"https://s2.ax1x.com/2019/03/28/AdOTv6.jpg\"/></div>','100.00','50.00','yes','yes','yes','yes','',0,'ticketKnow_5c9b383cdea07',NULL,'2019-03-25 16:29:03'),(3,'5c81de5c14b2a','索道票','<div style=\"text-align: center;\"><img src=\"https://s2.ax1x.com/2019/03/28/AdOogx.jpg\" width=\"100%\" /><img src=\"https://s2.ax1x.com/2019/03/28/AdOHKK.jpg\" width=\"100%\" /><img src=\"https://s2.ax1x.com/2019/03/28/AdOTv6.jpg\" width=\"100%\" /></div>','0.00','0.00','no','yes','yes','yes','_hash_5caff5fe07457',0,'ticketKnow_5c9b383cdea07',NULL,'2019-04-12 10:20:47'),(4,'5c81de18ab3ff','网络即时门票半价2','<div style=\"text-align: center;\"><img src=\"https://s2.ax1x.com/2019/03/28/AdOogx.jpg\" width=\"100%\" /><img src=\"https://s2.ax1x.com/2019/03/28/AdOHKK.jpg\" width=\"100%\" /><img src=\"https://s2.ax1x.com/2019/03/28/AdOTv6.jpg\" width=\"100%\" /></div>','100.00','50.00','yes','yes','yes','yes','_hash_5caff5720fab7',0,'ticketKnow_5c9b383cdea07',NULL,'2019-04-12 10:18:28');

/*Table structure for table `sunlue_ticket_price` */

DROP TABLE IF EXISTS `sunlue_ticket_price`;

CREATE TABLE `sunlue_ticket_price` (
  `ticket` int(10) NOT NULL COMMENT '票务',
  `date` char(10) NOT NULL COMMENT '执行日期',
  `cost` decimal(10,2) unsigned DEFAULT NULL COMMENT '成本',
  `profit` decimal(10,2) unsigned DEFAULT NULL COMMENT '利润',
  `number` int(10) unsigned DEFAULT '0' COMMENT '库存',
  `sales` int(10) unsigned DEFAULT '0' COMMENT '已售',
  `remark` varchar(200) DEFAULT NULL,
  `is_del` char(10) DEFAULT NULL,
  `last_modify_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='动态价格';

/*Data for the table `sunlue_ticket_price` */

insert  into `sunlue_ticket_price`(`ticket`,`date`,`cost`,`profit`,`number`,`sales`,`remark`,`is_del`,`last_modify_time`) values (1,'20190404','80.00','40.00',0,0,'',NULL,'2019-03-12 16:25:02'),(1,'20190405','80.00','40.00',2,0,'',NULL,'2019-03-12 16:25:02'),(1,'20190406','80.00','40.00',11,0,'',NULL,'2019-03-12 16:25:02'),(1,'20190504','80.00','10.00',8,0,'',NULL,'2019-03-12 16:25:02'),(1,'20190505','80.00','10.00',100,0,'',NULL,'2019-03-12 16:25:02'),(1,'20190511','80.00','10.00',100,0,'',NULL,'2019-03-12 16:25:02'),(1,'20190512','80.00','10.00',100,0,'',NULL,'2019-03-12 16:25:02'),(1,'20190518','80.00','10.00',100,0,'',NULL,'2019-03-12 16:25:02'),(1,'20190519','80.00','10.00',100,0,'',NULL,'2019-03-12 16:25:02'),(1,'20190525','80.00','10.00',100,0,'',NULL,'2019-03-12 16:25:02'),(1,'20190526','80.00','10.00',100,0,'',NULL,'2019-03-12 16:25:02'),(1,'20190601','80.00','10.00',100,0,'',NULL,'2019-03-12 16:25:02'),(1,'20190305','1.00','0.00',0,0,'',NULL,'2019-03-14 10:59:42'),(1,'20190228','0.00','0.00',0,0,'',NULL,'2019-03-14 11:23:56'),(1,'20190314','0.00','0.00',0,0,'',NULL,'2019-03-14 11:28:08'),(1,'20190315','0.00','0.00',0,0,'',NULL,'2019-03-14 11:28:25'),(1,'20190306','4.00','1.00',1,0,'',NULL,'2019-03-14 12:04:42'),(1,'20190313','0.00','0.00',0,0,'',NULL,'2019-03-14 11:52:34'),(1,'20190226','4.00','0.00',0,0,'',NULL,'2019-03-15 11:34:34'),(3,'20190307','0.00','2.00',0,0,'',NULL,'2019-03-25 17:26:39');

/*Table structure for table `sunlue_ticket_type` */

DROP TABLE IF EXISTS `sunlue_ticket_type`;

CREATE TABLE `sunlue_ticket_type` (
  `uniqid` char(50) CHARACTER SET utf8 NOT NULL,
  `name` varchar(100) CHARACTER SET utf8 NOT NULL,
  `enable` enum('yes','no') CHARACTER SET utf8 NOT NULL,
  `is_del` char(10) CHARACTER SET utf8 DEFAULT NULL,
  `last_modify_time` datetime DEFAULT NULL,
  PRIMARY KEY (`uniqid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `sunlue_ticket_type` */

insert  into `sunlue_ticket_type`(`uniqid`,`name`,`enable`,`is_del`,`last_modify_time`) values ('5c81de18ab3ff','门票','yes',NULL,'2019-03-28 15:03:01'),('5c81de5c14b2a','景点票','yes',NULL,'2019-03-28 15:09:11'),('5c9c7293ca5da','','yes','1553756888','2019-03-28 15:08:08');

/* Function  structure for function  `get_region_txt` */

/*!50003 DROP FUNCTION IF EXISTS `get_region_txt` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `get_region_txt`(number INT) RETURNS varchar(100) CHARSET utf8
BEGIN
  RETURN(SELECT  CONCAT(c.`name`,'-',b.`name`,'-',a.`name`) FROM admin_common_region AS a  LEFT JOIN admin_common_region AS b ON a.`pid`=b.`id`  LEFT JOIN admin_common_region AS c ON b.`pid`=c.`id` WHERE a.id = `number`);
END */$$
DELIMITER ;

/*Table structure for table `sunlue_order_list_view` */

DROP TABLE IF EXISTS `sunlue_order_list_view`;

/*!50001 DROP VIEW IF EXISTS `sunlue_order_list_view` */;
/*!50001 DROP TABLE IF EXISTS `sunlue_order_list_view` */;

/*!50001 CREATE TABLE  `sunlue_order_list_view`(
 `id` int(11) ,
 `order_sn` varchar(50) ,
 `date` date ,
 `contact` varchar(100) ,
 `mobile` char(20) ,
 `trade_no` char(50) ,
 `unifiedorder` char(10) ,
 `money` decimal(32,2) ,
 `note` varchar(255) ,
 `details` text ,
 `add_time` datetime ,
 `last_modify_time` datetime 
)*/;

/*View structure for view sunlue_order_list_view */

/*!50001 DROP TABLE IF EXISTS `sunlue_order_list_view` */;
/*!50001 DROP VIEW IF EXISTS `sunlue_order_list_view` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `sunlue_order_list_view` AS (select `a`.`id` AS `id`,`a`.`order_sn` AS `order_sn`,`a`.`date` AS `date`,`a`.`contact` AS `contact`,`a`.`mobile` AS `mobile`,`a`.`trade_no` AS `trade_no`,`a`.`unifiedorder` AS `unifiedorder`,(select sum(`b`.`pay_money`) from `sunlue_order_body` `b` where ((`b`.`order_id` = `a`.`id`) and (`b`.`order_sn` = `a`.`order_sn`))) AS `money`,`a`.`note` AS `note`,`a`.`details` AS `details`,`a`.`add_time` AS `add_time`,`a`.`last_modify_time` AS `last_modify_time` from `sunlue_order_list` `a` where isnull(`a`.`is_del`)) */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
