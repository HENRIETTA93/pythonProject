DROP TABLE IF EXISTS `customers`;

CREATE TABLE `customers` (
  `Site` int NOT NULL,
  `Company_Name` varchar(80) DEFAULT NULL,
  `Address` text,
  `City` varchar(45) DEFAULT NULL,
  `State` varchar(5) DEFAULT NULL,
  `Zipcode` varchar(20) DEFAULT NULL,
  `Country` varchar(45) DEFAULT NULL,
  `Suggested_Company` varchar(80) DEFAULT NULL,
  `Parent_Company` varchar(80) DEFAULT NULL,
  `Parent_Industry_Code` varchar(30) DEFAULT NULL,
  `Parent_Vertical` varchar(45) DEFAULT NULL,
  `Industry_Code` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`Site`),
  KEY `Industry_Code` (`Industry_Code`),
  CONSTRAINT `customers_ibfk_1` FOREIGN KEY (`Industry_Code`) REFERENCES `industry` (`Industry_Code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS `industry`;

CREATE TABLE `industry` (
  `Industry_Code` varchar(30) NOT NULL,
  `Industry_Vertical` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Industry_Code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




DROP TABLE IF EXISTS `products`;

CREATE TABLE `products` (
  `Product` varchar(45) DEFAULT NULL,
  `SKU` int DEFAULT NULL,
  `SKU2` varchar(45) NOT NULL,
  `Product_Component` varchar(30) DEFAULT NULL,
  `Product_Item` varchar(30) DEFAULT NULL,
  `Solution_Area` varchar(45) DEFAULT NULL,
  `Environment_Group` varchar(45) DEFAULT NULL,
  `Environment` varchar(45) DEFAULT NULL,
  `External_Level1` varchar(45) DEFAULT NULL,
  `External_Level2` varchar(45) DEFAULT NULL,
  `Development_Group` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`SKU2`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `transactions`;

CREATE TABLE `transactions` (
  `Transaction_Date` date NOT NULL,
  `Customer` int NOT NULL,
  `Customer_Name` varchar(80) DEFAULT NULL,
  `Country` varchar(45) DEFAULT NULL,
  `Product` varchar(45) NOT NULL,
  `Product_Name` varchar(45) DEFAULT NULL,
  `Platform` varchar(25) DEFAULT NULL,
  `Quantity` int DEFAULT NULL,
  `Value` int DEFAULT NULL,
  PRIMARY KEY (`Transaction_Date`,`Customer`,`Product`),
  KEY `fk_transactions_customers1_idx` (`Customer`),
  KEY `fk_transactions_products1_idx` (`Product`),
  CONSTRAINT `fk_transactions_customers1` FOREIGN KEY (`Customer`) REFERENCES `customers` (`Site`),
  CONSTRAINT `fk_transactions_products1` FOREIGN KEY (`Product`) REFERENCES `products` (`SKU2`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;