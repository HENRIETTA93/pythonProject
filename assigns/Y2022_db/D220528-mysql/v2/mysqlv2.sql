
CREATE TABLE IF NOT EXISTS `customers` (
  `Site` INT NOT NULL,
  `Company_Name` VARCHAR(80) NULL DEFAULT NULL,
  `Address` TEXT NULL DEFAULT NULL,
  `City` VARCHAR(45) NULL DEFAULT NULL,
  `State` VARCHAR(5) NULL DEFAULT NULL,
  `Zipcode` VARCHAR(20) NULL DEFAULT NULL,
  `Country` VARCHAR(45) NULL DEFAULT NULL,
  `Suggested_Company` VARCHAR(80) NULL DEFAULT NULL,
  `Industry_Code` VARCHAR(30) NULL DEFAULT NULL,
  `Industry_Vertical` VARCHAR(45) NULL DEFAULT NULL,
  `Parent_Company` VARCHAR(80) NULL DEFAULT NULL,
  `Parent_Industry_Code` VARCHAR(30) NULL DEFAULT NULL,
  `Parent_Vertical` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`Site`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;



CREATE TABLE IF NOT EXISTS `products` (
  `Product` VARCHAR(45) NULL DEFAULT NULL,
  `SKU` INT NULL DEFAULT NULL,
  `SKU2` VARCHAR(45) NOT NULL,
  `Product_Component` VARCHAR(30) NULL DEFAULT NULL,
  `Product_Item` VARCHAR(30) NULL DEFAULT NULL,
  `Solution_Area` VARCHAR(45) NULL DEFAULT NULL,
  `Environment_Group` VARCHAR(45) NULL DEFAULT NULL,
  `Environment` VARCHAR(45) NULL DEFAULT NULL,
  `External_Level1` VARCHAR(45) NULL DEFAULT NULL,
  `External_Level2` VARCHAR(45) NULL DEFAULT NULL,
  `Development_Group` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`SKU2`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;



CREATE TABLE IF NOT EXISTS `transactions` (
  `Transaction_Date` DATE NOT NULL,
  `Customer` INT NOT NULL,
  `Customer_Name` VARCHAR(80) NULL DEFAULT NULL,
  `Country` VARCHAR(45) NULL DEFAULT NULL,
  `Product` VARCHAR(45) NOT NULL,
  `Product_Name` VARCHAR(45) NULL DEFAULT NULL,
  `Platform` VARCHAR(25) NULL DEFAULT NULL,
  `Quantity` INT NULL DEFAULT NULL,
  `Value` INT NULL DEFAULT NULL,
  PRIMARY KEY (`Transaction_Date`, `Customer`, `Product`),
  INDEX `fk_transactions_customers1_idx` (`Customer` ASC) VISIBLE,
  INDEX `fk_transactions_products1_idx` (`Product` ASC) VISIBLE,
  CONSTRAINT `fk_transactions_customers1`
    FOREIGN KEY (`Customer`)
    REFERENCES `customers` (`Site`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_transactions_products1`
    FOREIGN KEY (`Product`)
    REFERENCES `products` (`SKU2`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- ===

create table industry(
Industry_Code varchar(30),
Industry_Vertical varchar(45),
primary key(Industry_Code)
);


CREATE TABLE IF NOT EXISTS `customers` (
  `Site` INT NOT NULL,
  `Company_Name` VARCHAR(80) NULL DEFAULT NULL,
  `Address` TEXT NULL DEFAULT NULL,
  `City` VARCHAR(45) NULL DEFAULT NULL,
  `State` VARCHAR(5) NULL DEFAULT NULL,
  `Zipcode` VARCHAR(20) NULL DEFAULT NULL,
  `Country` VARCHAR(45) NULL DEFAULT NULL,
  `Suggested_Company` VARCHAR(80) NULL DEFAULT NULL,
  `Parent_Company` VARCHAR(80) NULL DEFAULT NULL,
  `Parent_Industry_Code` VARCHAR(30) NULL DEFAULT NULL,
  `Parent_Vertical` VARCHAR(45) NULL DEFAULT NULL,
  Industry_Code varchar(30),
  PRIMARY KEY (`Site`),
  foreign key (Industry_Code) references industry(Industry_Code)
  )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;



CREATE TABLE IF NOT EXISTS `products` (
  `Product` VARCHAR(45) NULL DEFAULT NULL,
  `SKU` INT NULL DEFAULT NULL,
  `SKU2` VARCHAR(45) NOT NULL,
  `Product_Component` VARCHAR(30) NULL DEFAULT NULL,
  `Product_Item` VARCHAR(30) NULL DEFAULT NULL,
  `Solution_Area` VARCHAR(45) NULL DEFAULT NULL,
  `Environment_Group` VARCHAR(45) NULL DEFAULT NULL,
  `Environment` VARCHAR(45) NULL DEFAULT NULL,
  `External_Level1` VARCHAR(45) NULL DEFAULT NULL,
  `External_Level2` VARCHAR(45) NULL DEFAULT NULL,
  `Development_Group` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`SKU2`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;



CREATE TABLE IF NOT EXISTS `transactions` (
  `Transaction_Date` DATE NOT NULL,
  `Customer` INT NOT NULL,
  `Customer_Name` VARCHAR(80) NULL DEFAULT NULL,
  `Country` VARCHAR(45) NULL DEFAULT NULL,
  `Product` VARCHAR(45) NOT NULL,
  `Product_Name` VARCHAR(45) NULL DEFAULT NULL,
  `Platform` VARCHAR(25) NULL DEFAULT NULL,
  `Quantity` INT NULL DEFAULT NULL,
  `Value` INT NULL DEFAULT NULL,
  PRIMARY KEY (`Transaction_Date`, `Customer`, `Product`),
  INDEX `fk_transactions_customers1_idx` (`Customer` ASC) VISIBLE,
  INDEX `fk_transactions_products1_idx` (`Product` ASC) VISIBLE,
  CONSTRAINT `fk_transactions_customers1`
    FOREIGN KEY (`Customer`)
    REFERENCES `customers` (`Site`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_transactions_products1`
    FOREIGN KEY (`Product`)
    REFERENCES `products` (`SKU2`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;