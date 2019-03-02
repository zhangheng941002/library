/*
Navicat MySQL Data Transfer

Source Server         : yk
Source Server Version : 50716
Source Host           : 172.31.0.8:3306
Source Database       : portal

Target Server Type    : MYSQL
Target Server Version : 50716
File Encoding         : 65001

Date: 2019-03-02 12:20:17
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for seat_date
-- ----------------------------
DROP TABLE IF EXISTS `seat_date`;
CREATE TABLE `seat_date` (
  `id` int(12) NOT NULL,
  `seat_date` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  `status` int(12) NOT NULL COMMENT '默认：0：未被使用，1：已被使用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of seat_date
-- ----------------------------
