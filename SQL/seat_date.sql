

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for seat_date
-- ----------------------------
DROP TABLE IF EXISTS `seat_date`;
CREATE TABLE `seat_date` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `user_id` int(12) NOT NULL,
  `username` varchar(255) NOT NULL COMMENT '用户名',
  `seat_id` int(12) NOT NULL,
  `floor_id` int(12) NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `create_date` datetime NOT NULL,
  `status` int(12) NOT NULL COMMENT '默认：1：已被使用，2：使用结束，0：取消预约',
  `is_come` int(12) NOT NULL DEFAULT '0' COMMENT '0：未处理，1：履约，2：旷约',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of seat_date
-- ----------------------------
INSERT INTO `seat_date` VALUES ('2', '1', '用户名101', '1', '1', '2019-04-07 08:00:00', '2019-04-07 10:00:00', '2019-03-08 15:48:00', '1', '0');
INSERT INTO `seat_date` VALUES ('4', '2', '黑名单', '6', '1', '2019-03-21 13:00:00', '2019-03-21 20:00:00', '2019-03-09 15:48:10', '1', '0');
INSERT INTO `seat_date` VALUES ('5', '2', '黑名单', '8', '1', '2019-03-21 11:00:00', '2019-03-21 20:00:00', '2019-03-09 15:48:10', '1', '0');
INSERT INTO `seat_date` VALUES ('6', '2', '黑名单', '7', '1', '2019-03-21 08:00:00', '2019-03-21 18:00:00', '2019-03-09 15:48:10', '1', '0');
INSERT INTO `seat_date` VALUES ('51', '1', '用户名101', '3', '1', '2019-04-07 11:00:00', '2019-04-07 12:00:00', '2019-03-20 16:43:40', '1', '1');
INSERT INTO `seat_date` VALUES ('52', '1', '用户名101', '12', '1', '2019-04-07 14:00:00', '2019-04-07 17:00:00', '2019-03-20 16:47:05', '1', '1');
INSERT INTO `seat_date` VALUES ('53', '1', '用户名101', '13', '1', '2019-04-07 17:00:00', '2019-04-07 18:00:00', '2019-03-20 17:03:42', '1', '1');
INSERT INTO `seat_date` VALUES ('54', '1', '用户名101', '21', '1', '2019-04-07 18:00:00', '2019-04-07 21:00:00', '2019-03-20 17:54:56', '1', '1');
INSERT INTO `seat_date` VALUES ('55', '1', '用户名101', '21', '1', '2019-04-07 21:00:00', '2019-04-07 22:00:00', '2019-04-07 17:55:27', '1', '1');
INSERT INTO `seat_date` VALUES ('56', '1', '用户名101', '1', '2', '2019-04-08 09:00:00', '2019-04-08 10:00:00', '2019-04-07 18:07:52', '2', '1');
INSERT INTO `seat_date` VALUES ('57', '1', '用户名101', '12', '2', '2019-04-08 16:00:00', '2019-04-08 18:00:00', '2019-04-07 18:13:46', '1', '1');
INSERT INTO `seat_date` VALUES ('58', '1', '用户名101', '1', '2', '2019-04-09 22:23:00', '2019-04-11 16:00:00', '2019-04-07 18:19:14', '2', '1');
INSERT INTO `seat_date` VALUES ('60', '1', '用户名101', '2', '1', '2019-04-23 14:00:00', '2019-04-23 15:00:00', '2019-04-22 22:49:19', '1', '0');
