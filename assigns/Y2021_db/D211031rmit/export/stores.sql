/*
 Navicat Premium Data Transfer

 Source Server         : mysql-8.0
 Source Server Type    : MySQL
 Source Server Version : 80020
 Source Host           : localhost:3307
 Source Schema         : 1213

 Target Server Type    : MySQL
 Target Server Version : 80020
 File Encoding         : 65001

 Date: 01/11/2021 13:45:41
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for stores
-- ----------------------------
DROP TABLE IF EXISTS `stores`;
CREATE TABLE `stores`  (
  `code` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `address` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `city` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of stores
-- ----------------------------
INSERT INTO `stores` VALUES ('store1', 'address1', 'newyork');
INSERT INTO `stores` VALUES ('store2', 'address2', 'newyork');
INSERT INTO `stores` VALUES ('store3', 'address3', 'nsw');
INSERT INTO `stores` VALUES ('store4', 'address3', 'nsw');

SET FOREIGN_KEY_CHECKS = 1;
