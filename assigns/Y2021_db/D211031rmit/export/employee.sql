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

 Date: 01/11/2021 13:46:32
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for employee
-- ----------------------------
DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee`  (
  `empID` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `firstName` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `lastName` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`empID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of employee
-- ----------------------------
INSERT INTO `employee` VALUES ('emp1', 'bing', 'lin', '231243', 'address2');
INSERT INTO `employee` VALUES ('emp2', 'joey', 'lee', '34234', 'address3');
INSERT INTO `employee` VALUES ('emp3', 'fanse', 'adf', '23123', 'address4');
INSERT INTO `employee` VALUES ('emp4', 'adam', 'july', '354325', 'address5');
INSERT INTO `employee` VALUES ('emp5', 'maple', 'evia', '42342', 'address6');
INSERT INTO `employee` VALUES ('emp6', 'olivia', 'lee', '2423424', 'address7');

SET FOREIGN_KEY_CHECKS = 1;
