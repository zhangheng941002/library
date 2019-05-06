

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for blank_logs
-- ----------------------------
DROP TABLE IF EXISTS `blank_logs`;
CREATE TABLE `blank_logs` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `user_id` int(12) NOT NULL,
  `username` varchar(255) NOT NULL,
  `status` int(12) NOT NULL COMMENT '1:在黑名单不能预约，0：该记录被删除，可以预约',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of blank_logs
-- ----------------------------
INSERT INTO `blank_logs` VALUES ('2', '1', '用户名101', '0');
INSERT INTO `blank_logs` VALUES ('6', '2', '黑名单', '0');
INSERT INTO `blank_logs` VALUES ('7', '3', '测试20190306', '1');
