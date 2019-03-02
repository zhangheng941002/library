/*
Navicat MySQL Data Transfer

Source Server         : yk
Source Server Version : 50716
Source Host           : 172.31.0.8:3306
Source Database       : portal

Target Server Type    : MYSQL
Target Server Version : 50716
File Encoding         : 65001

Date: 2019-03-02 12:19:28
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for user_default_record
-- ----------------------------
DROP TABLE IF EXISTS `user_default_record`;
CREATE TABLE `user_default_record` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `user_id` int(12) NOT NULL,
  `conut` int(12) NOT NULL COMMENT '初始化为0，当为5时，增加黑名单记录',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_default_record
-- ----------------------------
