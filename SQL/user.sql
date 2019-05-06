

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '用户名101', '123456', '923103984@qq.com', '   中文系', '1');
INSERT INTO `user` VALUES ('2', '黑名单', '123456', '1@1.com', '黑名单', '1');
INSERT INTO `user` VALUES ('3', '测试20190306', '123456', 'test@test.com', '中文系', '1');
INSERT INTO `user` VALUES ('4', '测试02', '123456', '11@163.com', '中文系', '1');
INSERT INTO `user` VALUES ('5', 'ceshi01', '123456', '123@123.com', '测试', '1');
