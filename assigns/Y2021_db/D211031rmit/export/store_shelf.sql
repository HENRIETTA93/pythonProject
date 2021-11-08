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

 Date: 01/11/2021 13:45:50
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for store_shelf
-- ----------------------------
DROP TABLE IF EXISTS `store_shelf`;
CREATE TABLE `store_shelf`  (
  `storeCode` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `shelfID` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `location` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`storeCode`, `shelfID`) USING BTREE,
  CONSTRAINT `store_shelf_ibfk_1` FOREIGN KEY (`storeCode`) REFERENCES `stores` (`code`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of store_shelf
-- ----------------------------
INSERT INTO `store_shelf` VALUES ('store1', 's1', 's1001');
INSERT INTO `store_shelf` VALUES ('store1', 's2', 's2001');
INSERT INTO `store_shelf` VALUES ('store1', 's3', 's3001');
INSERT INTO `store_shelf` VALUES ('store2', 's1', 's1001');
INSERT INTO `store_shelf` VALUES ('store3', 's1', 's1001');
INSERT INTO `store_shelf` VALUES ('store4', 's1', 's1001');

SET FOREIGN_KEY_CHECKS = 1;
