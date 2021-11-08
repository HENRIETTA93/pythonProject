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

 Date: 01/11/2021 13:46:08
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `orderID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `custID` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `empID` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `orderDate` date NULL DEFAULT NULL,
  PRIMARY KEY (`orderID`) USING BTREE,
  INDEX `custID`(`custID`) USING BTREE,
  INDEX `empID`(`empID`) USING BTREE,
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`custID`) REFERENCES `customer` (`custID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`empID`) REFERENCES `employee` (`empID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('o1', 'cust1', 'emp5', '2021-10-25');
INSERT INTO `orders` VALUES ('o2', 'cust1', 'emp2', '2021-10-26');
INSERT INTO `orders` VALUES ('o3', 'cust3', 'emp3', '2021-10-05');
INSERT INTO `orders` VALUES ('o4', 'cust3', 'emp1', '2021-10-27');
INSERT INTO `orders` VALUES ('o5', 'cust2', 'emp3', '2021-10-13');
INSERT INTO `orders` VALUES ('o6', 'cust4', 'emp3', '2021-10-05');

-- ----------------------------
-- Triggers structure for table orders
-- ----------------------------
DROP TRIGGER IF EXISTS `trg_invoice`;
delimiter ;;
CREATE TRIGGER `trg_invoice` AFTER INSERT ON `orders` FOR EACH ROW begin
    declare v_emp char(10);
    declare v_invoice_date date;
    declare v_orderId varchar(20);
    declare v_invoiceId varchar(20);
    set v_emp=new.empID;
    set v_invoice_date=new.orderDate;
    set v_orderId=new.orderID;
    set v_invoiceId=concat('IN',new.orderID);
    insert into invoice values(v_invoiceId, v_orderId, v_invoice_date, v_emp);
    end
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
