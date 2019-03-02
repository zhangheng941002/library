/*
Navicat MySQL Data Transfer

Source Server         : yk
Source Server Version : 50716
Source Host           : 172.31.0.8:3306
Source Database       : portal

Target Server Type    : MYSQL
Target Server Version : 50716
File Encoding         : 65001

Date: 2019-03-02 16:25:02
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for blank_logs
-- ----------------------------
DROP TABLE IF EXISTS `blank_logs`;
CREATE TABLE `blank_logs` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `user_id` int(12) NOT NULL,
  `status` int(12) NOT NULL COMMENT '1:在黑名单不能预约，0：该记录被删除，可以预约',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of blank_logs
-- ----------------------------
