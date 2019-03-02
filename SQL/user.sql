/*
Navicat MySQL Data Transfer

Source Server         : yk
Source Server Version : 50716
Source Host           : 172.31.0.8:3306
Source Database       : portal

Target Server Type    : MYSQL
Target Server Version : 50716
File Encoding         : 65001

Date: 2019-03-02 16:23:40
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL COMMENT '用户名',
  `password` varchar(255) NOT NULL COMMENT '密码',
  `email` varchar(255) NOT NULL COMMENT '邮箱',
  `major` varchar(255) DEFAULT NULL,
  `status` int(12) NOT NULL COMMENT '状态，1：可用，0：注销',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '测试01', '123456', 'test@163.com', '中文', '1');
