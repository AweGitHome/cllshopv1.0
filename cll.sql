/*
SQLyog 企业版 - MySQL GUI v8.14 
MySQL - 5.5.40 : Database - cll
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`cll` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `cll`;

/*Table structure for table `address` */

DROP TABLE IF EXISTS `address`;

CREATE TABLE `address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `address` varchar(255) NOT NULL,
  `phone` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gb2312;

/*Data for the table `address` */

/*Table structure for table `bigtype` */

DROP TABLE IF EXISTS `bigtype`;

CREATE TABLE `bigtype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=gb2312;

/*Data for the table `bigtype` */

insert  into `bigtype`(`id`,`name`,`status`) values (1,'数码设备',1),(2,'服装服饰',1);

/*Table structure for table `orders` */

DROP TABLE IF EXISTS `orders`;

CREATE TABLE `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cost` bigint(20) NOT NULL,
  `createTime` datetime NOT NULL,
  `orderNum` varchar(255) NOT NULL,
  `userid` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gb2312;

/*Data for the table `orders` */

/*Table structure for table `orders_product` */

DROP TABLE IF EXISTS `orders_product`;

CREATE TABLE `orders_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `num` int(11) NOT NULL,
  `orderid` int(11) NOT NULL,
  `productid` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gb2312;

/*Data for the table `orders_product` */

/*Table structure for table `products` */

DROP TABLE IF EXISTS `products`;

CREATE TABLE `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `price` bigint(20) NOT NULL,
  `images` varchar(255) DEFAULT NULL,
  `stock` int(11) NOT NULL,
  `smallTypeId` int(11) NOT NULL,
  `bigTypeId` int(11) NOT NULL,
  `storeId` int(11) NOT NULL,
  `hot` int(11) NOT NULL DEFAULT '0',
  `hotTime` datetime NOT NULL,
  `createTime` datetime NOT NULL,
  `updateTime` datetime NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `FK_products_bigtype` (`bigTypeId`),
  KEY `FK_products_smalltype` (`smallTypeId`),
  KEY `FK_products` (`storeId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=gb2312;

/*Data for the table `products` */

insert  into `products`(`id`,`description`,`name`,`price`,`images`,`stock`,`smallTypeId`,`bigTypeId`,`storeId`,`hot`,`hotTime`,`createTime`,`updateTime`,`status`) values (1,'1','1',1,'1',1,1,1,1,1,'2018-09-06 00:00:00','2018-09-06 00:00:00','2018-09-06 00:00:00',1);

/*Table structure for table `smalltype` */

DROP TABLE IF EXISTS `smalltype`;

CREATE TABLE `smalltype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `bigType` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=gb2312;

/*Data for the table `smalltype` */

insert  into `smalltype`(`id`,`name`,`bigType`,`status`) values (1,'手机',1,1),(2,'电脑',1,1),(3,'单反',1,1),(4,'男装',2,1),(5,'女装',2,1);

/*Table structure for table `stores` */

DROP TABLE IF EXISTS `stores`;

CREATE TABLE `stores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `userid` int(11) NOT NULL,
  `createTime` datetime NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '状态：0删除1正常',
  `info` varchar(255) DEFAULT NULL COMMENT '申请入驻信息',
  `storepic` varchar(255) DEFAULT NULL COMMENT '商家头像',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=gb2312;

/*Data for the table `stores` */

insert  into `stores`(`id`,`name`,`userid`,`createTime`,`status`,`info`,`storepic`) values (1,'华为专卖店',1,'2018-09-06 00:00:00',0,NULL,NULL);

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `birthday` datetime DEFAULT NULL COMMENT '生日',
  `username` varchar(255) NOT NULL COMMENT '用户名',
  `truename` varchar(20) DEFAULT NULL COMMENT '真实姓名',
  `gender` int(11) DEFAULT NULL COMMENT '性别',
  `password` varchar(255) NOT NULL COMMENT '密码',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '状态：0删除1正常',
  `role` int(11) NOT NULL DEFAULT '1' COMMENT '角色：0管理员1普通用户2商家',
  `infoComplete` int(11) DEFAULT '0' COMMENT '0：未完善信息，1：已完善信息',
  `email` varchar(255) DEFAULT NULL COMMENT '邮箱',
  `userpic` varchar(255) DEFAULT NULL COMMENT '头像',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=gb2312;

/*Data for the table `users` */

insert  into `users`(`id`,`birthday`,`username`,`truename`,`gender`,`password`,`status`,`role`,`infoComplete`,`email`,`userpic`) values (1,NULL,'123','123',1,'e10adc3949ba59abbe56e057f20f883e',1,1,0,'',NULL),(2,NULL,'123','123',1,'b0b86dd3b8b88af4286f22e873afe306',1,1,0,'',NULL),(3,NULL,'1234',NULL,NULL,'202cb962ac59075b964b07152d234b70',1,1,0,'',NULL),(6,NULL,'gakki',NULL,NULL,'e10adc3949ba59abbe56e057f20f883e',1,1,0,'',NULL),(7,NULL,'12345',NULL,NULL,'202cb962ac59075b964b07152d234b70',1,1,0,'',NULL),(8,NULL,'123456',NULL,NULL,'979d472a84804b9f647bc185a877a8b5',1,1,0,NULL,NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
