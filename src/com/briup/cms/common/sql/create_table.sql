/*
Navicat MySQL Data Transfer

Source Server         : test
Source Server Version : 50018
Source Host           : localhost:3306
Source Database       : cms

Target Server Type    : MYSQL
Target Server Version : 50018
File Encoding         : 65001

Date: 2016-05-23 18:07:45
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `t_article`
-- ----------------------------
DROP TABLE IF EXISTS `t_article`;
CREATE TABLE `t_article` (
  `id` bigint(20) NOT NULL auto_increment,
  `title` varchar(255) default NULL,
  `content` text,
  `author` varchar(255) default NULL,
  `publisurDate` datetime default NULL,
  `clickTimes` int(11) default NULL,
  `c_id` bigint(20) default NULL,
  PRIMARY KEY  (`id`),
  KEY `c_id` (`c_id`),
  CONSTRAINT `c_id` FOREIGN KEY (`c_id`) REFERENCES `t_category` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_article
-- ----------------------------
INSERT INTO `t_article` VALUES ('1', '男装', '男装特价大甩卖啦！！！', '杨祯', '2016-05-20 00:00:00', '0', '1');

-- ----------------------------
-- Table structure for `t_category`
-- ----------------------------
DROP TABLE IF EXISTS `t_category`;
CREATE TABLE `t_category` (
  `id` bigint(20) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  `code` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
-- Table structure for `t_user`
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` bigint(20) NOT NULL auto_increment,
  `username` varchar(255) default NULL,
  `password` varchar(255) default NULL,
  `level` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1', '杨祯', '123', 'M');
INSERT INTO `t_user` VALUES ('2', 'yangzhen', '123', 'C');
