-- ----------------------------
-- Records of stores
-- ----------------------------
INSERT INTO `stores` VALUES ('store1', 'address1', 'newyork');
INSERT INTO `stores` VALUES ('store2', 'address2', 'newyork');
INSERT INTO `stores` VALUES ('store3', 'address3', 'nsw');
INSERT INTO `stores` VALUES ('store4', 'address3', 'nsw');


-- ----------------------------
-- Records of store_shelf
-- ----------------------------
INSERT INTO `store_shelf` VALUES ('store1', 's1', 's1001');
INSERT INTO `store_shelf` VALUES ('store1', 's2', 's2001');
INSERT INTO `store_shelf` VALUES ('store1', 's3', 's3001');
INSERT INTO `store_shelf` VALUES ('store2', 's1', 's1001');
INSERT INTO `store_shelf` VALUES ('store3', 's1', 's1001');
INSERT INTO `store_shelf` VALUES ('store4', 's1', 's1001');


-- ----------------------------
-- Records of supplier
-- ----------------------------
INSERT INTO `supplier` VALUES ('supplier1', '123213', 'addr1');
INSERT INTO `supplier` VALUES ('supplier2', '432232', 'addr1');
INSERT INTO `supplier` VALUES ('supplier3', '34234234', 'addr2');

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('p1', 'shirt', 100, 'store1', 's1', 'supplier2');
INSERT INTO `product` VALUES ('p2', 'formal suits', 1232, 'store1', 's2', 'supplier3');
INSERT INTO `product` VALUES ('p3', 'casual attire', 400, 'store2', 's1', 'supplier1');
INSERT INTO `product` VALUES ('p4', 'shoes', 300, 'store3', 's1', 'supplier1');
INSERT INTO `product` VALUES ('p5', 'belts', 570, 'store2', 's1', 'supplier3');
INSERT INTO `product` VALUES ('p6', 'hats', 570, 'store3', 's1', 'supplier2');
INSERT INTO `product` VALUES ('p7', 'wallets', 670, 'store3', 's1', 'supplier3');

-- ----------------------------
-- Records of employee
-- ----------------------------
INSERT INTO `employee` VALUES ('emp1', 'bing', 'lin', '231243', 'address2');
INSERT INTO `employee` VALUES ('emp2', 'joey', 'lee', '34234', 'address3');
INSERT INTO `employee` VALUES ('emp3', 'fanse', 'adf', '23123', 'address4');
INSERT INTO `employee` VALUES ('emp4', 'adam', 'july', '354325', 'address5');
INSERT INTO `employee` VALUES ('emp5', 'maple', 'evia', '42342', 'address6');
INSERT INTO `employee` VALUES ('emp6', 'olivia', 'lee', '2423424', 'address7');

-- ----------------------------
-- Records of customer
-- ----------------------------
INSERT INTO `customer` VALUES ('cust1', 'colin', 'jurden', 'address1', '123123', 'colin@gmail.com', '1999-06-16', NULL, 1000, NULL, '', NULL, NULL, NULL);
INSERT INTO `customer` VALUES ('cust2', 'linda', 'lee', 'address2', '34234', 'colin@gmail.com', '1999-06-16', NULL, 1000, NULL, '', NULL, NULL, NULL);
INSERT INTO `customer` VALUES ('cust3', 'mike', 'ross', 'address3', '422353', '334ro3w@gmail.com', '1999-06-16', NULL, 1000, NULL, '', NULL, NULL, NULL);
INSERT INTO `customer` VALUES ('cust4', 'ruby', 'july', 'address1', '645645', 'ruby3342@gmail.com', '1999-06-16', NULL, 1000, NULL, '', NULL, NULL, NULL);
INSERT INTO `customer` VALUES ('cust5', 'david', 'smith', 'address4', '645645', 'fadfa2@gmail.com', '1999-06-16', NULL, 1000, NULL, '', NULL, NULL, NULL);


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
