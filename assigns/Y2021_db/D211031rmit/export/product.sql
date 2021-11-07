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

 Date: 01/11/2021 13:50:13
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `productID` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `price` decimal(10, 0) NULL DEFAULT NULL,
  `storeCode` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `shelfID` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `supplier` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`productID`) USING BTREE,
  INDEX `storeCode`(`storeCode`, `shelfID`) USING BTREE,
  INDEX `supplier`(`supplier`) USING BTREE,
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`storeCode`, `shelfID`) REFERENCES `store_shelf` (`storeCode`, `shelfID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `product_ibfk_2` FOREIGN KEY (`supplier`) REFERENCES `supplier` (`name`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('p1', 'fda', 100, 'store1', 's1', 'supplier2');
INSERT INTO `product` VALUES ('p2', 'ds', 1232, 'store1', 's2', 'supplier3');
INSERT INTO `product` VALUES ('p3', 'fad', 400, 'store2', 's1', 'supplier1');
INSERT INTO `product` VALUES ('p4', 'fwa', 300, 'store3', 's1', 'supplier1');
INSERT INTO `product` VALUES ('p5', 'dd', 570, 'store2', 's1', 'supplier3');

SET FOREIGN_KEY_CHECKS = 1;
