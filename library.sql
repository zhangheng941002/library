/*
Navicat MySQL Data Transfer

Source Server         : yk
Source Server Version : 50716
Source Host           : 172.31.0.8:3306
Source Database       : library

Target Server Type    : MYSQL
Target Server Version : 50716
File Encoding         : 65001

Date: 2019-04-20 15:31:38
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group
-- ----------------------------

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES ('1', 'Can add log entry', '1', 'add_logentry');
INSERT INTO `auth_permission` VALUES ('2', 'Can change log entry', '1', 'change_logentry');
INSERT INTO `auth_permission` VALUES ('3', 'Can delete log entry', '1', 'delete_logentry');
INSERT INTO `auth_permission` VALUES ('4', 'Can add permission', '2', 'add_permission');
INSERT INTO `auth_permission` VALUES ('5', 'Can change permission', '2', 'change_permission');
INSERT INTO `auth_permission` VALUES ('6', 'Can delete permission', '2', 'delete_permission');
INSERT INTO `auth_permission` VALUES ('7', 'Can add group', '3', 'add_group');
INSERT INTO `auth_permission` VALUES ('8', 'Can change group', '3', 'change_group');
INSERT INTO `auth_permission` VALUES ('9', 'Can delete group', '3', 'delete_group');
INSERT INTO `auth_permission` VALUES ('10', 'Can add user', '4', 'add_user');
INSERT INTO `auth_permission` VALUES ('11', 'Can change user', '4', 'change_user');
INSERT INTO `auth_permission` VALUES ('12', 'Can delete user', '4', 'delete_user');
INSERT INTO `auth_permission` VALUES ('13', 'Can add content type', '5', 'add_contenttype');
INSERT INTO `auth_permission` VALUES ('14', 'Can change content type', '5', 'change_contenttype');
INSERT INTO `auth_permission` VALUES ('15', 'Can delete content type', '5', 'delete_contenttype');
INSERT INTO `auth_permission` VALUES ('16', 'Can add session', '6', 'add_session');
INSERT INTO `auth_permission` VALUES ('17', 'Can change session', '6', 'change_session');
INSERT INTO `auth_permission` VALUES ('18', 'Can delete session', '6', 'delete_session');
INSERT INTO `auth_permission` VALUES ('19', 'Can add user', '7', 'add_user');
INSERT INTO `auth_permission` VALUES ('20', 'Can change user', '7', 'change_user');
INSERT INTO `auth_permission` VALUES ('21', 'Can delete user', '7', 'delete_user');
INSERT INTO `auth_permission` VALUES ('22', 'Can add blank logs', '8', 'add_blanklogs');
INSERT INTO `auth_permission` VALUES ('23', 'Can change blank logs', '8', 'change_blanklogs');
INSERT INTO `auth_permission` VALUES ('24', 'Can delete blank logs', '8', 'delete_blanklogs');
INSERT INTO `auth_permission` VALUES ('25', 'Can add floor buliding', '9', 'add_floorbuliding');
INSERT INTO `auth_permission` VALUES ('26', 'Can change floor buliding', '9', 'change_floorbuliding');
INSERT INTO `auth_permission` VALUES ('27', 'Can delete floor buliding', '9', 'delete_floorbuliding');
INSERT INTO `auth_permission` VALUES ('28', 'Can add seat', '10', 'add_seat');
INSERT INTO `auth_permission` VALUES ('29', 'Can change seat', '10', 'change_seat');
INSERT INTO `auth_permission` VALUES ('30', 'Can delete seat', '10', 'delete_seat');
INSERT INTO `auth_permission` VALUES ('31', 'Can add seat date', '11', 'add_seatdate');
INSERT INTO `auth_permission` VALUES ('32', 'Can change seat date', '11', 'change_seatdate');
INSERT INTO `auth_permission` VALUES ('33', 'Can delete seat date', '11', 'delete_seatdate');
INSERT INTO `auth_permission` VALUES ('34', 'Can add user default record', '12', 'add_userdefaultrecord');
INSERT INTO `auth_permission` VALUES ('35', 'Can change user default record', '12', 'change_userdefaultrecord');
INSERT INTO `auth_permission` VALUES ('36', 'Can delete user default record', '12', 'delete_userdefaultrecord');

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user
-- ----------------------------
INSERT INTO `auth_user` VALUES ('1', 'pbkdf2_sha256$100000$HuX5LgbN6eO8$c/9osLwitJML2r7XKvaoMsulksNvArXbNfvvWUNjgfg=', '2019-04-10 23:51:57.348027', '1', 'root', '', '', 'root@root.com', '1', '1', '2019-03-08 11:49:34.149437');

-- ----------------------------
-- Table structure for auth_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user_groups
-- ----------------------------

-- ----------------------------
-- Table structure for auth_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user_user_permissions
-- ----------------------------

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

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------
INSERT INTO `django_admin_log` VALUES ('1', '2019-03-08 04:03:09.425138', '3', 'User object (3)', '2', '[{\"changed\": {\"fields\": [\"major\", \"status\"]}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('2', '2019-03-11 02:01:06.076129', '4', 'User object (4)', '1', '[{\"added\": {}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('3', '2019-03-11 02:01:30.491648', '1', 'User object (1)', '2', '[{\"changed\": {\"fields\": [\"major\", \"status\"]}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('4', '2019-03-11 02:01:53.316538', '2', 'User object (2)', '2', '[{\"changed\": {\"fields\": [\"status\"]}}]', '7', '1');

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES ('1', 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES ('3', 'auth', 'group');
INSERT INTO `django_content_type` VALUES ('2', 'auth', 'permission');
INSERT INTO `django_content_type` VALUES ('4', 'auth', 'user');
INSERT INTO `django_content_type` VALUES ('5', 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES ('8', 'seat', 'blanklogs');
INSERT INTO `django_content_type` VALUES ('9', 'seat', 'floorbuliding');
INSERT INTO `django_content_type` VALUES ('10', 'seat', 'seat');
INSERT INTO `django_content_type` VALUES ('11', 'seat', 'seatdate');
INSERT INTO `django_content_type` VALUES ('12', 'seat', 'userdefaultrecord');
INSERT INTO `django_content_type` VALUES ('6', 'sessions', 'session');
INSERT INTO `django_content_type` VALUES ('7', 'students', 'user');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES ('1', 'contenttypes', '0001_initial', '2019-03-02 16:21:56.378382');
INSERT INTO `django_migrations` VALUES ('2', 'auth', '0001_initial', '2019-03-02 16:21:59.490449');
INSERT INTO `django_migrations` VALUES ('3', 'admin', '0001_initial', '2019-03-02 16:22:00.398544');
INSERT INTO `django_migrations` VALUES ('4', 'admin', '0002_logentry_remove_auto_add', '2019-03-02 16:22:00.454394');
INSERT INTO `django_migrations` VALUES ('5', 'contenttypes', '0002_remove_content_type_name', '2019-03-02 16:22:01.027421');
INSERT INTO `django_migrations` VALUES ('6', 'auth', '0002_alter_permission_name_max_length', '2019-03-02 16:22:01.308554');
INSERT INTO `django_migrations` VALUES ('7', 'auth', '0003_alter_user_email_max_length', '2019-03-02 16:22:01.583827');
INSERT INTO `django_migrations` VALUES ('8', 'auth', '0004_alter_user_username_opts', '2019-03-02 16:22:01.633774');
INSERT INTO `django_migrations` VALUES ('9', 'auth', '0005_alter_user_last_login_null', '2019-03-02 16:22:01.942344');
INSERT INTO `django_migrations` VALUES ('10', 'auth', '0006_require_contenttypes_0002', '2019-03-02 16:22:01.977592');
INSERT INTO `django_migrations` VALUES ('11', 'auth', '0007_alter_validators_add_error_messages', '2019-03-02 16:22:02.028531');
INSERT INTO `django_migrations` VALUES ('12', 'auth', '0008_alter_user_username_max_length', '2019-03-02 16:22:02.370397');
INSERT INTO `django_migrations` VALUES ('13', 'auth', '0009_alter_user_last_name_max_length', '2019-03-02 16:22:02.657407');
INSERT INTO `django_migrations` VALUES ('14', 'seat', '0001_initial', '2019-03-02 16:22:02.709325');
INSERT INTO `django_migrations` VALUES ('15', 'sessions', '0001_initial', '2019-03-02 16:22:02.997316');
INSERT INTO `django_migrations` VALUES ('16', 'students', '0001_initial', '2019-03-02 16:22:03.052192');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('0lqre7qombx7iomv9b3dccplvtekcel4', 'NTM1MTQ4MDVjODYyYTBjNDA4MDkyNmE5ZjdkZjU2NTEwOTA3MWEwYTp7Il9zZXNzaW9uX2V4cGlyeSI6MCwidXNlcm5hbWUiOiJcdTc1MjhcdTYyMzdcdTU0MGQxMDEiLCJ1c2VyX2lkIjoxfQ==', '2019-04-30 22:52:31.545267');
INSERT INTO `django_session` VALUES ('19dccd472nl5uux8hwcupam22rraaaxp', 'YjYwZTBmZDQwMGM3Nzk5ZjQxY2ZiMmUyODBlYzM5ODQ3ZDFhOTk1ODp7Il9zZXNzaW9uX2V4cGlyeSI6MCwidXNlcm5hbWUiOiJcdTc1MjhcdTYyMzdcdTU0MGQxMDEiLCJ1c2VyX2lkIjoxLCJ3eGNvZGUiOiJCTHNnIn0=', '2019-05-03 21:34:03.180535');
INSERT INTO `django_session` VALUES ('4bepdr7fyesealm43onz1jb232i9nc0k', 'YTViNDM0N2FmNDljNjA0ZTIwYzg5YjFhNGE0OGExMTVjNTdmYmIzNTp7Il9zZXNzaW9uX2V4cGlyeSI6MCwidXNlcm5hbWUiOiJcdTRmZWVcdTY1MzlcdTc1MjhcdTYyMzdcdTRmZTFcdTYwNmYiLCJ1c2VyX2lkIjoxfQ==', '2019-04-03 21:39:21.724579');
INSERT INTO `django_session` VALUES ('81i687drlaemyjhg10bxg2kskia8vwkm', 'NzIyOTVlYTUzZTM2N2Y4NzQxY2FiYmU2MzNkOTY4NTFhMDA3MDZkNjp7Il9zZXNzaW9uX2V4cGlyeSI6MH0=', '2019-04-04 18:28:46.892752');
INSERT INTO `django_session` VALUES ('8m1ke6w1s2o2lqekw61o9o24ryeu9no3', 'YjA2MjEwMTg1MjM0ODE3MjE2YTVlMmE5MGI2NTk1ZWIyOTFiYmRmOTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJlOTQyYmY4YmEwZDYzNGNjYmNjMjUyMDE4NmRlNDk2YWQyN2I0NDhmIiwiX3Nlc3Npb25fZXhwaXJ5IjowLCJ1c2VybmFtZSI6Ilx1NmQ0Ylx1OGJkNTAyIiwiaWQiOjR9', '2019-03-25 09:55:18.919424');
INSERT INTO `django_session` VALUES ('mutn92930to360e0yhtmisb120h2hp66', 'ZjBkYThjOTk1NWI1MDcwN2I2M2NjYmFhZGI2YjUyZWM5NmYxMjkzODp7Il9zZXNzaW9uX2V4cGlyeSI6MCwidXNlcm5hbWUiOiJcdTc1MjhcdTYyMzdcdTU0MGQxMDEiLCJ1c2VyX2lkIjoxLCJzZWF0X2lkIjoiMSIsImZsb29yX2lkIjoiMiJ9', '2019-04-21 18:19:23.142375');
INSERT INTO `django_session` VALUES ('rinw1fp1x0l6gi4699u0hg3u056tqnzo', 'Yzc0ZWQ5MmY2ODA3Y2I3YWIwYjAwNDYzYTIxNmQyYTg1OWQzNzNiMDp7Il9zZXNzaW9uX2V4cGlyeSI6MCwidXNlcm5hbWUiOiJcdTZkNGJcdThiZDUwMSIsImlkIjoxfQ==', '2019-03-24 14:01:31.953830');

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
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of seat_date
-- ----------------------------
INSERT INTO `seat_date` VALUES ('2', '1', '用户名101', '1', '1', '2019-04-07 08:00:00', '2019-04-07 10:00:00', '2019-03-08 15:48:00', '1', '0');
INSERT INTO `seat_date` VALUES ('4', '2', '黑名单', '6', '1', '2019-03-21 13:00:00', '2019-03-21 20:00:00', '2019-03-09 15:48:10', '1', '0');
INSERT INTO `seat_date` VALUES ('5', '2', '黑名单', '8', '1', '2019-03-21 11:00:00', '2019-03-21 20:00:00', '2019-03-09 15:48:10', '1', '0');
INSERT INTO `seat_date` VALUES ('6', '2', '黑名单', '7', '1', '2019-03-21 08:00:00', '2019-03-21 18:00:00', '2019-03-09 15:48:10', '1', '0');
INSERT INTO `seat_date` VALUES ('51', '1', '用户名101', '3', '1', '2019-04-07 11:00:00', '2019-04-07 12:00:00', '2019-03-20 16:43:40', '1', '0');
INSERT INTO `seat_date` VALUES ('52', '1', '用户名101', '12', '1', '2019-04-07 14:00:00', '2019-04-07 17:00:00', '2019-03-20 16:47:05', '1', '0');
INSERT INTO `seat_date` VALUES ('53', '1', '用户名101', '13', '1', '2019-04-07 17:00:00', '2019-04-07 18:00:00', '2019-03-20 17:03:42', '1', '1');
INSERT INTO `seat_date` VALUES ('54', '1', '用户名101', '21', '1', '2019-04-07 18:00:00', '2019-04-07 21:00:00', '2019-03-20 17:54:56', '1', '1');
INSERT INTO `seat_date` VALUES ('55', '1', '用户名101', '21', '1', '2019-04-07 21:00:00', '2019-04-07 22:00:00', '2019-04-07 17:55:27', '1', '1');
INSERT INTO `seat_date` VALUES ('56', '1', '用户名101', '1', '2', '2019-04-08 09:00:00', '2019-04-08 10:00:00', '2019-04-07 18:07:52', '1', '1');
INSERT INTO `seat_date` VALUES ('57', '1', '用户名101', '12', '2', '2019-04-08 16:00:00', '2019-04-08 18:00:00', '2019-04-07 18:13:46', '1', '1');
INSERT INTO `seat_date` VALUES ('58', '1', '用户名101', '1', '2', '2019-04-09 22:23:00', '2019-04-11 16:00:00', '2019-04-07 18:19:14', '1', '1');

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
