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

 Date: 01/11/2021 13:46:16
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for order_items
-- ----------------------------
DROP TABLE IF EXISTS `order_items`;
CREATE TABLE `order_items`  (
  `orderID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `productID` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `qty` int NULL DEFAULT NULL,
  PRIMARY KEY (`orderID`, `productID`) USING BTREE,
  INDEX `productID`(`productID`) USING BTREE,
  CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`orderID`) REFERENCES `orders` (`orderID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`productID`) REFERENCES `product` (`productID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_items
-- ----------------------------
INSERT INTO `order_items` VALUES ('o1', 'p1', 10);
INSERT INTO `order_items` VALUES ('o1', 'p2', 3);
INSERT INTO `order_items` VALUES ('o2', 'p2', 1);
INSERT INTO `order_items` VALUES ('o3', 'p3', 3);
INSERT INTO `order_items` VALUES ('o3', 'p4', 2);
INSERT INTO `order_items` VALUES ('o4', 'p1', 3);
INSERT INTO `order_items` VALUES ('o5', 'p1', 1);
INSERT INTO `order_items` VALUES ('o5', 'p2', 1);
INSERT INTO `order_items` VALUES ('o6', 'p1', 1);

SET FOREIGN_KEY_CHECKS = 1;
