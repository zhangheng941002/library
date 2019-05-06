

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for user_default_record
-- ----------------------------
DROP TABLE IF EXISTS `user_default_record`;
CREATE TABLE `user_default_record` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `user_id` int(12) NOT NULL,
  `username` varchar(255) NOT NULL,
  `count` int(12) NOT NULL COMMENT '初始化为0，当为5时，增加黑名单记录',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_default_record
-- ----------------------------
INSERT INTO `user_default_record` VALUES ('1', '1', '用户名101', '0');
INSERT INTO `user_default_record` VALUES ('2', '2', '黑名单', '0');
INSERT INTO `user_default_record` VALUES ('3', '3', '测试20190306', '0');
