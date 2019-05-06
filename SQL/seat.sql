

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for seat
-- ----------------------------
DROP TABLE IF EXISTS `seat`;
CREATE TABLE `seat` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `seat_num` int(12) NOT NULL COMMENT '座位编号',
  `status` int(12) NOT NULL COMMENT '状态：是否被占用，0：未被占用，1：已被用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of seat
-- ----------------------------
INSERT INTO `seat` VALUES ('1', '1', '0');
INSERT INTO `seat` VALUES ('2', '2', '0');
INSERT INTO `seat` VALUES ('3', '3', '0');
INSERT INTO `seat` VALUES ('4', '4', '0');
INSERT INTO `seat` VALUES ('5', '5', '0');
INSERT INTO `seat` VALUES ('6', '6', '0');
INSERT INTO `seat` VALUES ('7', '7', '0');
INSERT INTO `seat` VALUES ('8', '8', '0');
INSERT INTO `seat` VALUES ('9', '9', '0');
INSERT INTO `seat` VALUES ('10', '10', '0');
INSERT INTO `seat` VALUES ('11', '11', '0');
INSERT INTO `seat` VALUES ('12', '12', '0');
INSERT INTO `seat` VALUES ('13', '13', '0');
INSERT INTO `seat` VALUES ('14', '14', '0');
INSERT INTO `seat` VALUES ('15', '15', '0');
INSERT INTO `seat` VALUES ('16', '16', '0');
INSERT INTO `seat` VALUES ('17', '17', '0');
INSERT INTO `seat` VALUES ('18', '18', '0');
INSERT INTO `seat` VALUES ('19', '19', '0');
INSERT INTO `seat` VALUES ('20', '20', '0');
INSERT INTO `seat` VALUES ('21', '21', '0');
INSERT INTO `seat` VALUES ('22', '22', '0');
INSERT INTO `seat` VALUES ('23', '23', '0');
INSERT INTO `seat` VALUES ('24', '24', '0');
INSERT INTO `seat` VALUES ('25', '25', '0');
