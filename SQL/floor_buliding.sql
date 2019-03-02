/*
Navicat MySQL Data Transfer

Source Server         : yk
Source Server Version : 50716
Source Host           : 172.31.0.8:3306
Source Database       : portal

Target Server Type    : MYSQL
Target Server Version : 50716
File Encoding         : 65001

Date: 2019-03-02 12:19:56
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for floor_buliding
-- ----------------------------
DROP TABLE IF EXISTS `floor_buliding`;
CREATE TABLE `floor_buliding` (
  `id` int(12) NOT NULL,
  `number` int(12) NOT NULL COMMENT '楼层数',
  `status` decimal(19,0) NOT NULL COMMENT '占座率，默认本楼层百分之零',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of floor_buliding
-- ----------------------------
