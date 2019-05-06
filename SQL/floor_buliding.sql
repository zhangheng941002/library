

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for floor_buliding
-- ----------------------------
DROP TABLE IF EXISTS `floor_buliding`;
CREATE TABLE `floor_buliding` (
  `id` int(12) NOT NULL,
  `number` int(12) NOT NULL COMMENT '楼层数',
  `status` int(19) NOT NULL COMMENT '占座率，默认本楼层百分之零',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of floor_buliding
-- ----------------------------
INSERT INTO `floor_buliding` VALUES ('1', '1', '0');
INSERT INTO `floor_buliding` VALUES ('2', '2', '0');
INSERT INTO `floor_buliding` VALUES ('3', '3', '0');
INSERT INTO `floor_buliding` VALUES ('4', '4', '0');
INSERT INTO `floor_buliding` VALUES ('5', '5', '0');
