/*
Navicat MySQL Data Transfer

Source Server         : MySQL
Source Server Version : 50710
Source Host           : localhost:3306
Source Database       : ssm

Target Server Type    : MYSQL
Target Server Version : 50710
File Encoding         : 65001

Date: 2019-04-03 10:02:31
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for bill
-- ----------------------------
DROP TABLE IF EXISTS `bill`;
CREATE TABLE `bill` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `number` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `createTime` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `remark` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of bill
-- ----------------------------
INSERT INTO `bill` VALUES ('1', 'RIO鸡尾酒12*2/箱*50箱', '酒水类进货', 'SMS2018122501', '1', '2018-12-25', null);
INSERT INTO `bill` VALUES ('2', '老干妈鸡丁肉丝2*12/件*50件', '调味料进货', 'SMS2018122502', '1', '2018-12-26', null);

-- ----------------------------
-- Table structure for emp
-- ----------------------------
DROP TABLE IF EXISTS `emp`;
CREATE TABLE `emp` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of emp
-- ----------------------------
INSERT INTO `emp` VALUES ('1', '刘传锦', '20');
INSERT INTO `emp` VALUES ('2', '谢印', '20');
INSERT INTO `emp` VALUES ('3', '老江', '23');
INSERT INTO `emp` VALUES ('4', 'CESHI', '18');
INSERT INTO `emp` VALUES ('5', 'ce', '22');
INSERT INTO `emp` VALUES ('6', 'abc', '22');
INSERT INTO `emp` VALUES ('7', '8888', '12');
INSERT INTO `emp` VALUES ('8', '修改测试', '12');
INSERT INTO `emp` VALUES ('9', '阿锦', '15');
INSERT INTO `emp` VALUES ('10', 'Hab1', '15');
INSERT INTO `emp` VALUES ('11', 'Hab2', '18');
INSERT INTO `emp` VALUES ('12', 'Hab1', '15');
INSERT INTO `emp` VALUES ('13', 'Hab2', '18');
INSERT INTO `emp` VALUES ('14', 'Hab1', '15');
INSERT INTO `emp` VALUES ('15', 'Hab2', '18');
INSERT INTO `emp` VALUES ('16', 'Hab1', '15');
INSERT INTO `emp` VALUES ('17', 'Hab2', '18');

-- ----------------------------
-- Table structure for person
-- ----------------------------
DROP TABLE IF EXISTS `person`;
CREATE TABLE `person` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `sex` int(4) DEFAULT NULL,
  `addr` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `birth` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `remark` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of person
-- ----------------------------

-- ----------------------------
-- Table structure for res
-- ----------------------------
DROP TABLE IF EXISTS `res`;
CREATE TABLE `res` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `path` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `remark` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of res
-- ----------------------------
INSERT INTO `res` VALUES ('1', null, null, null);

-- ----------------------------
-- Table structure for res_role
-- ----------------------------
DROP TABLE IF EXISTS `res_role`;
CREATE TABLE `res_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) DEFAULT NULL,
  `res_id` int(11) DEFAULT NULL,
  `remark` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of res_role
-- ----------------------------

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `remark` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', '管理员', '1', null);

-- ----------------------------
-- Table structure for supplier
-- ----------------------------
DROP TABLE IF EXISTS `supplier`;
CREATE TABLE `supplier` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `addr` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `createTime` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `remark` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of supplier
-- ----------------------------
INSERT INTO `supplier` VALUES ('1', '上海锐澳酒业有限公司', '上海市浦东新区康桥东路538号', '酒水供应商', '1', '2018-12-26', null);

-- ----------------------------
-- Table structure for tasks
-- ----------------------------
DROP TABLE IF EXISTS `tasks`;
CREATE TABLE `tasks` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '计划内容',
  `type` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '计划类型',
  `userID` int(4) NOT NULL,
  `planTime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '计划完成时间',
  `status` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '0：未完成 1：已完成',
  `remark` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `overTime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '完成时间',
  `createTime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '计划创建时间',
  `enable` tinyint(1) DEFAULT '1' COMMENT '0：失效  1：生效',
  `create_time` datetime DEFAULT NULL,
  `over_time` datetime DEFAULT NULL,
  `plan_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=154 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of tasks
-- ----------------------------
INSERT INTO `tasks` VALUES ('1', '今天去看书啊', '学习', '1', '2019-04-02 11:38:25', '0', null, '2019-04-02 11:38:25', '2019-04-02 11:38:25', '0', '2019-04-01 12:15:23', null, '2019-04-02 12:15:26');
INSERT INTO `tasks` VALUES ('2', '打游戏', '娱乐', '1', '2019-04-02 16:29:37', '0', null, '2019-04-02 16:29:37', '2019-04-02 16:29:37', '1', '2019-04-01 12:15:23', null, '2019-04-02 12:15:26');
INSERT INTO `tasks` VALUES ('3', '洗澡', '生活', '1', '2019-04-02 16:30:40', '0', null, '2019-04-02 16:30:40', '2019-04-02 16:30:40', '1', '2019-04-01 12:15:23', null, '2019-04-02 12:15:26');
INSERT INTO `tasks` VALUES ('4', '今天去看书啊', '学习', '1', '2019-04-01 12:15:03', '0', null, '2019-04-02 12:15:16', '2019-04-01 12:15:19', '1', '2019-04-01 12:15:23', null, '2019-04-02 12:15:26');
INSERT INTO `tasks` VALUES ('5', '今天去看书啊', '学习', '1', '2019-04-01 12:15:03', '0', null, '2019-04-02 12:15:16', '2019-04-01 12:15:19', '1', '2019-04-01 12:15:23', null, '2019-04-02 12:15:26');
INSERT INTO `tasks` VALUES ('6', '今天去看书啊', '学习', '1', '2019-04-02 10:12:48', '0', null, '2019-04-02 10:12:48', '2019-04-02 10:12:48', '1', '2019-04-01 12:15:23', null, '2019-04-02 12:15:26');
INSERT INTO `tasks` VALUES ('7', '今天去看书啊', '学习', '1', '2019-04-01 12:15:03', '0', null, '2019-04-02 12:15:16', '2019-04-01 12:15:19', '1', '2019-04-01 12:15:23', null, '2019-04-02 12:15:26');
INSERT INTO `tasks` VALUES ('8', '今天去看书啊', '学习', '1', '2019-04-01 12:15:03', '0', null, '2019-04-02 12:15:16', '2019-04-01 12:15:19', '1', '2019-04-01 12:15:23', null, '2019-04-02 12:15:26');
INSERT INTO `tasks` VALUES ('9', '今天去看书啊9', '学习', '1', '2019-04-02 10:21:47', '0', null, '2019-04-02 10:21:47', '2019-04-02 10:21:47', '1', '2019-04-01 12:15:23', null, '2019-04-02 12:15:26');
INSERT INTO `tasks` VALUES ('10', '今天去看书啊10', '学习', '1', '2019-04-02 10:21:43', '0', null, '2019-04-02 10:21:43', '2019-04-02 10:21:43', '1', '2019-04-01 12:15:23', null, '2019-04-02 12:15:26');
INSERT INTO `tasks` VALUES ('11', '今天去看书啊11', '学习', '1', '2019-04-02 10:21:50', '0', null, '2019-04-02 10:21:50', '2019-04-02 10:21:50', '1', '2019-04-01 12:15:23', null, '2019-04-02 12:15:26');
INSERT INTO `tasks` VALUES ('12', '今天去看书啊12', '学习', '1', '2019-04-02 10:21:52', '0', null, '2019-04-02 10:21:52', '2019-04-02 10:21:52', '1', '2019-04-01 12:15:23', null, '2019-04-02 12:15:26');
INSERT INTO `tasks` VALUES ('13', '今天去看书啊13', '学习', '1', '2019-04-02 10:21:53', '0', null, '2019-04-02 10:21:53', '2019-04-02 10:21:53', '1', '2019-04-01 12:15:23', null, '2019-04-02 12:15:26');
INSERT INTO `tasks` VALUES ('14', '今天去看书啊', '学习', '1', '2019-04-01 12:15:03', '0', null, '2019-04-02 12:15:16', '2019-04-01 12:15:19', '1', '2019-04-01 12:15:23', null, '2019-04-02 12:15:26');
INSERT INTO `tasks` VALUES ('15', '今天去看书啊', '学习', '1', '2019-04-01 12:15:03', '0', null, '2019-04-02 12:15:16', '2019-04-01 12:15:19', '1', '2019-04-01 12:15:23', null, '2019-04-02 12:15:26');
INSERT INTO `tasks` VALUES ('16', '今天去看书啊', '学习', '1', '2019-04-01 12:15:03', '0', null, '2019-04-02 12:15:16', '2019-04-01 12:15:19', '1', '2019-04-01 12:15:23', null, '2019-04-02 12:15:26');
INSERT INTO `tasks` VALUES ('17', '今天去看书啊', '学习', '1', '2019-04-01 12:15:03', '0', null, '2019-04-02 12:15:16', '2019-04-01 12:15:19', '1', '2019-04-01 12:15:23', null, '2019-04-02 12:15:26');
INSERT INTO `tasks` VALUES ('18', '今天去看书啊', '学习', '1', '2019-04-01 12:15:03', '0', null, '2019-04-02 12:15:16', '2019-04-01 12:15:19', '1', '2019-04-01 12:15:23', null, '2019-04-02 12:15:26');
INSERT INTO `tasks` VALUES ('19', '今天去看书啊', '学习', '1', '2019-04-01 12:15:03', '0', null, '2019-04-02 12:15:16', '2019-04-01 12:15:19', '1', '2019-04-01 12:15:23', null, '2019-04-02 12:15:26');
INSERT INTO `tasks` VALUES ('20', '今天去看书啊20', '学习', '1', '2019-04-02 10:21:59', '0', null, '2019-04-02 10:21:59', '2019-04-02 10:21:59', '1', '2019-04-01 12:15:23', null, '2019-04-02 12:15:26');
INSERT INTO `tasks` VALUES ('21', '今天去看书啊21', '学习', '1', '2019-04-02 10:22:01', '0', null, '2019-04-02 10:22:01', '2019-04-02 10:22:01', '1', '2019-04-01 12:15:23', null, '2019-04-02 12:15:26');
INSERT INTO `tasks` VALUES ('22', '今天去看书啊22', '学习', '1', '2019-04-02 10:22:03', '0', null, '2019-04-02 10:22:03', '2019-04-02 10:22:03', '1', '2019-04-01 12:15:23', null, '2019-04-02 12:15:26');
INSERT INTO `tasks` VALUES ('23', '今天去看书啊', '学习', '1', '2019-04-01 12:15:03', '0', null, '2019-04-02 12:15:16', '2019-04-01 12:15:19', '1', '2019-04-01 12:15:23', null, '2019-04-02 12:15:26');
INSERT INTO `tasks` VALUES ('24', '今天去看书啊', '学习', '1', '2019-04-01 12:15:03', '0', null, '2019-04-02 12:15:16', '2019-04-01 12:15:19', '1', '2019-04-01 12:15:23', null, '2019-04-02 12:15:26');
INSERT INTO `tasks` VALUES ('25', '今天去看书啊', '学习', '1', '2019-04-01 12:15:03', '0', null, '2019-04-02 12:15:16', '2019-04-01 12:15:19', '1', '2019-04-01 12:15:23', null, '2019-04-02 12:15:26');
INSERT INTO `tasks` VALUES ('26', '今天去看书啊', '学习', '1', '2019-04-01 12:15:03', '0', null, '2019-04-02 12:15:16', '2019-04-01 12:15:19', '1', '2019-04-01 12:15:23', null, '2019-04-02 12:15:26');
INSERT INTO `tasks` VALUES ('27', '今天去看书啊', '学习', '1', '2019-04-01 12:15:03', '0', null, '2019-04-02 12:15:16', '2019-04-01 12:15:19', '1', '2019-04-01 12:15:23', null, '2019-04-02 12:15:26');
INSERT INTO `tasks` VALUES ('28', '今天去看书啊', '学习', '1', '2019-04-01 12:15:03', '0', null, '2019-04-02 12:15:16', '2019-04-01 12:15:19', '1', '2019-04-01 12:15:23', null, '2019-04-02 12:15:26');
INSERT INTO `tasks` VALUES ('29', '今天去看书啊', '学习', '1', '2019-04-01 12:15:03', '0', null, '2019-04-02 12:15:16', '2019-04-01 12:15:19', '1', '2019-04-01 12:15:23', null, '2019-04-02 12:15:26');
INSERT INTO `tasks` VALUES ('30', '今天去看书啊', '学习', '1', '2019-04-01 12:15:03', '0', null, '2019-04-02 12:15:16', '2019-04-01 12:15:19', '1', '2019-04-01 12:15:23', null, '2019-04-02 12:15:26');
INSERT INTO `tasks` VALUES ('31', '今天去看书啊', '学习', '1', '2019-04-01 12:15:03', '0', null, '2019-04-02 12:15:16', '2019-04-01 12:15:19', '1', '2019-04-01 12:15:23', null, '2019-04-02 12:15:26');
INSERT INTO `tasks` VALUES ('32', '今天去看书啊', '学习', '1', '2019-04-01 12:15:03', '0', null, '2019-04-02 12:15:16', '2019-04-01 12:15:19', '1', '2019-04-01 12:15:23', null, '2019-04-02 12:15:26');
INSERT INTO `tasks` VALUES ('33', '今天去看书啊', '学习', '1', '2019-04-01 12:15:03', '0', null, '2019-04-02 12:15:16', '2019-04-01 12:15:19', '1', '2019-04-01 12:15:23', null, '2019-04-02 12:15:26');
INSERT INTO `tasks` VALUES ('34', '今天去看书啊', '学习', '1', '2019-04-01 12:15:03', '0', null, '2019-04-02 12:15:16', '2019-04-01 12:15:19', '1', '2019-04-01 12:15:23', null, '2019-04-02 12:15:26');
INSERT INTO `tasks` VALUES ('35', '今天去看书啊', '学习', '1', '2019-04-01 12:15:03', '0', null, '2019-04-02 12:15:16', '2019-04-01 12:15:19', '1', '2019-04-01 12:15:23', null, '2019-04-02 12:15:26');
INSERT INTO `tasks` VALUES ('36', '今天去看书啊', '学习', '1', '2019-04-01 12:15:03', '0', null, '2019-04-02 12:15:16', '2019-04-01 12:15:19', '1', '2019-04-01 12:15:23', null, '2019-04-02 12:15:26');
INSERT INTO `tasks` VALUES ('37', '今天去看书啊', '学习', '1', '2019-04-01 12:15:03', '0', null, '2019-04-02 12:15:16', '2019-04-01 12:15:19', '1', '2019-04-01 12:15:23', null, '2019-04-02 12:15:26');
INSERT INTO `tasks` VALUES ('38', '今天去看书啊', '学习', '1', '2019-04-01 12:15:03', '0', null, '2019-04-02 12:15:16', '2019-04-01 12:15:19', '1', '2019-04-01 12:15:23', null, '2019-04-02 12:15:26');
INSERT INTO `tasks` VALUES ('39', '今天去看书啊', '学习', '1', '2019-04-01 12:15:03', '0', null, '2019-04-02 12:15:16', '2019-04-01 12:15:19', '1', '2019-04-01 12:15:23', null, '2019-04-02 12:15:26');
INSERT INTO `tasks` VALUES ('40', '今天去看书啊', '学习', '1', '2019-04-01 12:15:03', '0', null, '2019-04-02 12:15:16', '2019-04-01 12:15:19', '1', '2019-04-01 12:15:23', null, '2019-04-02 12:15:26');
INSERT INTO `tasks` VALUES ('41', '今天去看书啊', '学习', '1', '2019-04-01 12:15:03', '0', null, '2019-04-02 12:15:16', '2019-04-01 12:15:19', '1', '2019-04-01 12:15:23', null, '2019-04-02 12:15:26');
INSERT INTO `tasks` VALUES ('42', '今天去看书啊', '学习', '1', '2019-04-01 12:15:03', '0', null, '2019-04-02 12:15:16', '2019-04-01 12:15:19', '1', '2019-04-01 12:15:23', null, '2019-04-02 12:15:26');
INSERT INTO `tasks` VALUES ('43', '今天去看书啊', '学习', '1', '2019-04-01 12:15:03', '0', null, '2019-04-02 12:15:16', '2019-04-01 12:15:19', '1', '2019-04-01 12:15:23', null, '2019-04-02 12:15:26');
INSERT INTO `tasks` VALUES ('44', '今天去看书啊', '学习', '1', '2019-04-01 12:15:03', '0', null, '2019-04-02 12:15:16', '2019-04-01 12:15:19', '1', '2019-04-01 12:15:23', null, '2019-04-02 12:15:26');
INSERT INTO `tasks` VALUES ('45', '今天去看书啊', '学习', '1', '2019-04-01 12:15:03', '0', null, '2019-04-02 12:15:16', '2019-04-01 12:15:19', '1', '2019-04-01 12:15:23', null, '2019-04-02 12:15:26');
INSERT INTO `tasks` VALUES ('46', '今天去看书啊', '学习', '1', '2019-04-01 12:15:03', '0', null, '2019-04-02 12:15:16', '2019-04-01 12:15:19', '1', '2019-04-01 12:15:23', null, '2019-04-02 12:15:26');
INSERT INTO `tasks` VALUES ('47', '今天去看书啊', '学习', '1', '2019-04-01 12:15:03', '0', null, '2019-04-02 12:15:16', '2019-04-01 12:15:19', '1', '2019-04-01 12:15:23', null, '2019-04-02 12:15:26');
INSERT INTO `tasks` VALUES ('48', '今天去看书啊', '学习', '1', '2019-04-01 12:15:03', '0', null, '2019-04-02 12:15:16', '2019-04-01 12:15:19', '1', '2019-04-01 12:15:23', null, '2019-04-02 12:15:26');
INSERT INTO `tasks` VALUES ('49', '今天去看书啊', '学习', '1', '2019-04-01 12:15:03', '0', null, '2019-04-02 12:15:16', '2019-04-01 12:15:19', '1', '2019-04-01 12:15:23', null, '2019-04-02 12:15:26');
INSERT INTO `tasks` VALUES ('50', '今天去看书啊', '学习', '1', '2019-04-01 12:15:03', '0', null, '2019-04-02 12:15:16', '2019-04-01 12:15:19', '1', '2019-04-01 12:15:23', null, '2019-04-02 12:15:26');
INSERT INTO `tasks` VALUES ('51', '今天去看书啊', '学习', '1', '2019-04-01 12:15:03', '0', null, '2019-04-02 12:15:16', '2019-04-01 12:15:19', '1', '2019-04-01 12:15:23', null, '2019-04-02 12:15:26');
INSERT INTO `tasks` VALUES ('52', '今天去看书啊', '学习', '1', '2019-04-01 12:15:03', '0', null, '2019-04-02 12:15:16', '2019-04-01 12:15:19', '1', '2019-04-01 12:15:23', null, '2019-04-02 12:15:26');
INSERT INTO `tasks` VALUES ('53', '今天去看书啊', '学习', '1', '2019-04-01 12:15:03', '0', null, '2019-04-02 12:15:16', '2019-04-01 12:15:19', '1', '2019-04-01 12:15:23', null, '2019-04-02 12:15:26');
INSERT INTO `tasks` VALUES ('54', '今天去看书啊', '学习', '1', '2019-04-01 12:15:03', '0', null, '2019-04-02 12:15:16', '2019-04-01 12:15:19', '1', '2019-04-01 12:15:23', null, '2019-04-02 12:15:26');
INSERT INTO `tasks` VALUES ('55', '今天去看书啊', '学习', '1', '2019-04-01 12:15:03', '0', null, '2019-04-02 12:15:16', '2019-04-01 12:15:19', '1', '2019-04-01 12:15:23', null, '2019-04-02 12:15:26');
INSERT INTO `tasks` VALUES ('56', '今天去看书啊', '学习', '1', '2019-04-01 12:15:03', '0', null, '2019-04-02 12:15:16', '2019-04-01 12:15:19', '1', '2019-04-01 12:15:23', null, '2019-04-02 12:15:26');
INSERT INTO `tasks` VALUES ('57', '今天去看书啊', '学习', '1', '2019-04-01 12:15:03', '0', null, '2019-04-02 12:15:16', '2019-04-01 12:15:19', '1', '2019-04-01 12:15:23', null, '2019-04-02 12:15:26');
INSERT INTO `tasks` VALUES ('58', '今天去看书啊', '学习', '1', '2019-04-01 12:15:03', '0', null, '2019-04-02 12:15:16', '2019-04-01 12:15:19', '1', '2019-04-01 12:15:23', null, '2019-04-02 12:15:26');
INSERT INTO `tasks` VALUES ('59', '今天去看书啊', '学习', '1', '2019-04-01 12:15:03', '0', null, '2019-04-02 12:15:16', '2019-04-01 12:15:19', '1', '2019-04-01 12:15:23', null, '2019-04-02 12:15:26');
INSERT INTO `tasks` VALUES ('60', '今天去看书啊', '学习', '1', '2019-04-01 12:15:03', '0', null, '2019-04-02 12:15:16', '2019-04-01 12:15:19', '1', '2019-04-01 12:15:23', null, '2019-04-02 12:15:26');
INSERT INTO `tasks` VALUES ('61', '今天去看书啊', '学习', '1', '2019-04-01 12:15:03', '0', null, '2019-04-02 12:15:16', '2019-04-01 12:15:19', '1', '2019-04-01 12:15:23', null, '2019-04-02 12:15:26');
INSERT INTO `tasks` VALUES ('62', '今天去看书啊', '学习', '1', '2019-04-01 12:15:03', '0', null, '2019-04-02 12:15:16', '2019-04-01 12:15:19', '1', '2019-04-01 12:15:23', null, '2019-04-02 12:15:26');
INSERT INTO `tasks` VALUES ('63', '今天去看书啊', '学习', '1', '2019-04-02 16:48:00', '0', null, '2019-04-02 16:48:00', '2019-04-02 16:48:00', '0', '2019-04-01 12:15:23', null, '2019-04-02 12:15:26');
INSERT INTO `tasks` VALUES ('64', '今天去看书啊', '学习', '1', '2019-04-01 12:15:03', '0', null, '2019-04-02 12:15:16', '2019-04-01 12:15:19', '1', '2019-04-01 12:15:23', null, '2019-04-02 12:15:26');
INSERT INTO `tasks` VALUES ('65', '今天去看书啊', '学习', '1', '2019-04-01 12:15:03', '0', null, '2019-04-02 12:15:16', '2019-04-01 12:15:19', '1', '2019-04-01 12:15:23', null, '2019-04-02 12:15:26');
INSERT INTO `tasks` VALUES ('66', '今天去看书啊', '学习', '1', '2019-04-01 12:15:03', '0', null, '2019-04-02 12:15:16', '2019-04-01 12:15:19', '1', '2019-04-01 12:15:23', null, '2019-04-02 12:15:26');
INSERT INTO `tasks` VALUES ('67', '做完啦~~~~', '学习', '1', '2019-04-01 12:15:03', '1', null, '2019-04-02 12:15:16', '2019-04-01 12:15:19', '1', '2019-04-01 12:15:23', null, '2019-04-02 12:15:26');
INSERT INTO `tasks` VALUES ('150', '测试修改修改娃娃', '测试修改emmm', '1', '2019-04-02 17:27:32', '0', null, '2019-04-02 17:27:32', '2019-04-02 17:27:32', '1', '2019-04-02 05:55:10', null, '2019-04-01 16:00:00');
INSERT INTO `tasks` VALUES ('151', '测试计划', '测试类型', '1', null, '0', null, null, null, '1', '2019-04-02 08:46:58', null, '2019-04-02 16:00:00');
INSERT INTO `tasks` VALUES ('152', '交作业啦！', '学习', '1', null, '0', null, null, null, '1', '2019-04-02 09:23:51', null, '2019-04-03 16:00:00');
INSERT INTO `tasks` VALUES ('153', '添加计划编辑', '类型', '1', '2019-04-02 17:32:21', '0', null, '2019-04-02 17:32:21', '2019-04-02 17:32:21', '1', '2019-04-02 09:32:14', null, '2019-04-03 16:00:00');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `name` varchar(255) NOT NULL COMMENT '账号',
  `password` varchar(255) NOT NULL COMMENT '用户密码',
  `sex` int(4) DEFAULT NULL COMMENT '个人id',
  `age` int(4) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `addr` varchar(255) DEFAULT NULL,
  `birth` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `status` varchar(4) DEFAULT NULL COMMENT '状态 0：用户禁用 1：用户启用',
  `createTime` varchar(255) DEFAULT NULL COMMENT '注册时间',
  `create_time` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin', '123456', '1', '11', '152552255', '白帝城', '2018-12-25 20:47:07', null, '1', '2017-03-28 ', null);
INSERT INTO `user` VALUES ('2', '刘传锦', '123123', '1', '18', '1528656666', '贵州省贵阳市花溪区', '2018-12-25', null, '1', '2018-12-25 ', null);

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `user_id` int(4) DEFAULT NULL COMMENT '用户的ID',
  `role_id` int(11) DEFAULT NULL COMMENT '权限ID',
  `status` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '状态 0：权限禁用 1：权限启用',
  `createTime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES ('1', '1', '1', '1', '2018-12-16 23:28:37');

-- ----------------------------
-- Procedure structure for test
-- ----------------------------
DROP PROCEDURE IF EXISTS `test`;
DELIMITER ;;
CREATE DEFINER=`skip-grants user`@`skip-grants host` PROCEDURE `test`()
begin
    declare i int;                      #申明变量
    set i = 14;                          #变量赋值
    while i < 150 do                     #结束循环的条件: 当i大于10时跳出while循环
        INSERT INTO `tasks` VALUES (i, '今天去看书啊', '学习', '1', '2019-04-01 12:15:03', '0', null, '2019-04-02 12:15:16', '2019-04-01 12:15:19', '1', '2019-04-01 12:15:23', null, '2019-04-02 12:15:26');    #往test表添加数据
        set i = i + 1;                  #循环一次,i加一
    end while;                          #结束while循环
end
;;
DELIMITER ;
