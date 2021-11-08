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

 Date: 01/11/2021 13:46:26
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for customer
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer`  (
  `custID` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `firstName` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `lastName` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `address` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `dob` date NULL DEFAULT NULL,
  `marriedOrNot` tinyint(1) NULL DEFAULT NULL,
  `annualIncome` int NULL DEFAULT NULL,
  `subscription` tinyint(1) NULL DEFAULT NULL,
  `frequency` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `satisfaction` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mobilePay` tinyint(1) NULL DEFAULT NULL,
  `spendingScore` int NULL DEFAULT NULL,
  PRIMARY KEY (`custID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of customer
-- ----------------------------
INSERT INTO `customer` VALUES ('cust1', 'colin', 'jurden', 'address1', '123123', 'colin@gmail.com', '1999-06-16', NULL, 1000, NULL, '', NULL, NULL, NULL);
INSERT INTO `customer` VALUES ('cust2', 'linda', 'lee', 'address2', '34234', 'colin@gmail.com', '1999-06-16', NULL, 1000, NULL, '', NULL, NULL, NULL);
INSERT INTO `customer` VALUES ('cust3', 'mike', 'ross', 'address3', '422353', '334ro3w@gmail.com', '1999-06-16', NULL, 1000, NULL, '', NULL, NULL, NULL);
INSERT INTO `customer` VALUES ('cust4', 'ruby', 'july', 'address1', '645645', 'ruby3342@gmail.com', '1999-06-16', NULL, 1000, NULL, '', NULL, NULL, NULL);
INSERT INTO `customer` VALUES ('cust5', 'david', 'smith', 'address4', '645645', 'fadfa2@gmail.com', '1999-06-16', NULL, 1000, NULL, '', NULL, NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;
