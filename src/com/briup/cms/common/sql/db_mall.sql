/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50714
Source Host           : localhost:3306
Source Database       : db_mall

Target Server Type    : MYSQL
Target Server Version : 50714
File Encoding         : 65001

Date: 2017-02-20 16:14:38
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_article
-- ----------------------------
DROP TABLE IF EXISTS `t_article`;
CREATE TABLE `t_article` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `content` text,
  `author` varchar(255) DEFAULT NULL,
  `publisurDate` datetime DEFAULT NULL,
  `clickTimes` int(11) DEFAULT NULL,
  `c_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `c_id` (`c_id`),
  CONSTRAINT `c_id` FOREIGN KEY (`c_id`) REFERENCES `t_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_article
-- ----------------------------
INSERT INTO `t_article` VALUES ('1', '男装', '男装特价大甩卖啦！！！', '杨祯', '2016-05-20 00:00:00', '0', '1');

-- ----------------------------
-- Table structure for t_category
-- ----------------------------
DROP TABLE IF EXISTS `t_category`;
CREATE TABLE `t_category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `code` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_category
-- ----------------------------
INSERT INTO `t_category` VALUES ('1', '男装', '1001');
INSERT INTO `t_category` VALUES ('2', '女装', '1002');
INSERT INTO `t_category` VALUES ('3', '鞋靴', '1003');
INSERT INTO `t_category` VALUES ('4', '箱包', '1004');
INSERT INTO `t_category` VALUES ('5', '数码', '1005');
INSERT INTO `t_category` VALUES ('6', '食品', '1006');

-- ----------------------------
-- Table structure for t_goods
-- ----------------------------
DROP TABLE IF EXISTS `t_goods`;
CREATE TABLE `t_goods` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `size` varchar(10) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  `c_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `c_id` (`c_id`),
  CONSTRAINT `t_goods_ibfk_1` FOREIGN KEY (`c_id`) REFERENCES `t_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_goods
-- ----------------------------
INSERT INTO `t_goods` VALUES ('1', '外套01', '399', 'S', '88', '外套', '1');
INSERT INTO `t_goods` VALUES ('2', '外套01', '399', 'M', '100', '外套', '1');
INSERT INTO `t_goods` VALUES ('3', '外套01', '399', 'L', '100', '外套', '1');
INSERT INTO `t_goods` VALUES ('4', '外套01', '399', 'XL', '100', '外套', '1');
INSERT INTO `t_goods` VALUES ('5', '外套02', '689', 'S', '100', '外套', '1');
INSERT INTO `t_goods` VALUES ('6', '外套02', '689', 'M', '100', '外套', '1');
INSERT INTO `t_goods` VALUES ('7', '外套02', '689', 'L', '100', '外套', '1');
INSERT INTO `t_goods` VALUES ('8', '外套02', '689', 'XL', '100', '外套', '1');
INSERT INTO `t_goods` VALUES ('9', '外套03', '599', 'S', '100', '外套', '1');
INSERT INTO `t_goods` VALUES ('10', '外套03', '599', 'M', '100', '外套', '1');
INSERT INTO `t_goods` VALUES ('11', '外套03', '599', 'L', '100', '外套', '1');
INSERT INTO `t_goods` VALUES ('12', '外套03', '599', 'XL', '100', '外套', '1');
INSERT INTO `t_goods` VALUES ('13', '外套04', '799', 'S', '100', '外套', '1');
INSERT INTO `t_goods` VALUES ('14', '外套04', '799', 'M', '100', '外套', '1');
INSERT INTO `t_goods` VALUES ('15', '外套04', '799', 'L', '100', '外套', '1');
INSERT INTO `t_goods` VALUES ('16', '外套04', '799', 'XL', '100', '外套', '1');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `level` varchar(255) DEFAULT NULL,
  `score` int(11) DEFAULT NULL COMMENT '会员积分',
  `address` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `account` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1', '杨祯', '123', 'M', '0', '江西省南昌市双港东大街', '18788888888', '11150');
INSERT INTO `t_user` VALUES ('2', 'yangzhen', '123', 'C', '0', '江西省南昌市双港东大街', '18788888888', '1000');
INSERT INTO `t_user` VALUES ('3', 'yz', '123', 'C', '0', '江西省南昌市双港东大街', '18788888888', '100');
