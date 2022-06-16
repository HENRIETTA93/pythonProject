-- Data about customers
INSERT INTO Customers VALUES('1983-02-11','Jamie','Johnson',1);
INSERT INTO Customers VALUES('1995-10-26','Birgit','Doe',2);
INSERT INTO Customers VALUES('1991-05-15','Finn','Smith',3);
INSERT INTO Customers VALUES('1990-07-03','Anita','Taylor',4);

-- Data about employees
INSERT INTO Employees VALUES('1964-12-01','Carla','Brown',1);
INSERT INTO Employees VALUES('1984-03-14','Bryan','Williams',2);
INSERT INTO Employees VALUES('1991-02-19','Finn','Wilson',3);
INSERT INTO Employees VALUES('1998-08-12','Denise','Davies',4);

-- Data about locations
INSERT INTO Locations VALUES('Park Road 7',1);
INSERT INTO Locations VALUES('Hill Street 2',2);
INSERT INTO Locations VALUES('Duckinfield Street 5',3);

-- Data about transactions
INSERT INTO Transactions VALUES(1,3,1,'2021-08-09',1);
INSERT INTO Transactions VALUES(4,2,2,'2021-08-14',2);
INSERT INTO Transactions VALUES(4,4,1,'2021-09-07',3);
INSERT INTO Transactions VALUES(3,4,1,'2021-09-07',4);
INSERT INTO Transactions VALUES(4,1,3,'2021-09-07',5);
INSERT INTO Transactions VALUES(1,4,1,'2021-09-23',6);

-- Data about items
INSERT INTO Items VALUES(200,'Bread');
INSERT INTO Items VALUES(100,'Lemonade');
INSERT INTO Items VALUES(100,'Banana');
INSERT INTO Items VALUES(200,'Rice');
INSERT INTO Items VALUES(150,'Grape');
INSERT INTO Items VALUES(450,'Chicken');
INSERT INTO Items VALUES(25,'Garlic');

-- Data about items brought into shop
INSERT INTO ItemsBroughtIntoShop VALUES('Bread',1,13,'2021-1-1');
INSERT INTO ItemsBroughtIntoShop VALUES('Lemonade',1,6,'2021-1-1');
INSERT INTO ItemsBroughtIntoShop VALUES('Lemonade',1,6,'2021-2-1');
INSERT INTO ItemsBroughtIntoShop VALUES('Lemonade',1,6,'2021-3-1');
INSERT INTO ItemsBroughtIntoShop VALUES('Lemonade',1,6,'2021-4-1');
INSERT INTO ItemsBroughtIntoShop VALUES('Lemonade',1,6,'2021-5-1');
INSERT INTO ItemsBroughtIntoShop VALUES('Lemonade',1,6,'2021-6-1');
INSERT INTO ItemsBroughtIntoShop VALUES('Lemonade',1,6,'2021-7-1');
INSERT INTO ItemsBroughtIntoShop VALUES('Lemonade',1,6,'2021-8-1');
INSERT INTO ItemsBroughtIntoShop VALUES('Lemonade',1,6,'2021-9-1');
INSERT INTO ItemsBroughtIntoShop VALUES('Lemonade',1,6,'2021-10-1');
INSERT INTO ItemsBroughtIntoShop VALUES('Banana',1,5,'2021-1-1');
INSERT INTO ItemsBroughtIntoShop VALUES('Rice',1,2,'2021-1-1');
INSERT INTO ItemsBroughtIntoShop VALUES('Grape',1,99,'2021-1-1');
INSERT INTO ItemsBroughtIntoShop VALUES('Chicken',1,2,'2021-1-1');
INSERT INTO ItemsBroughtIntoShop VALUES('Garlic',1,1,'2021-1-1');
INSERT INTO ItemsBroughtIntoShop VALUES('Bread',1,3,'2021-1-1');
INSERT INTO ItemsBroughtIntoShop VALUES('Banana',2,7,'2021-1-1');
INSERT INTO ItemsBroughtIntoShop VALUES('Rice',2,2,'2021-1-1');
INSERT INTO ItemsBroughtIntoShop VALUES('Chicken',2,19,'2021-1-1');
INSERT INTO ItemsBroughtIntoShop VALUES('Garlic',2,1,'2021-1-1');
INSERT INTO ItemsBroughtIntoShop VALUES('Bread',3,5,'2021-1-1');
INSERT INTO ItemsBroughtIntoShop VALUES('Lemonade',3,5,'2021-1-1');
INSERT INTO ItemsBroughtIntoShop VALUES('Banana',3,6,'2021-1-1');
INSERT INTO ItemsBroughtIntoShop VALUES('Rice',3,8,'2021-1-1');
INSERT INTO ItemsBroughtIntoShop VALUES('Grape',3,10,'2021-1-1');

-- Data about movement of items
INSERT INTO MovementOfItems VALUES('Lemonade',1,3,20,'2021-6-1');
INSERT INTO MovementOfItems VALUES('Garlic',3,1,20,'2021-6-1');
INSERT INTO MovementOfItems VALUES('Banana',2,3,5,'2021-6-1');
INSERT INTO MovementOfItems VALUES('Banana',3,1,9,'2021-7-1');
INSERT INTO MovementOfItems VALUES('Banana',1,2,4,'2021-9-1');
INSERT INTO MovementOfItems VALUES('Grape',3,1,5,'2021-7-1');

-- Data about items in transactions
INSERT INTO ItemsInTransactions VALUES('Garlic',1,5);
INSERT INTO ItemsInTransactions VALUES('Bread',1,8);
INSERT INTO ItemsInTransactions VALUES('Chicken',1,1);
INSERT INTO ItemsInTransactions VALUES('Rice',1,1);
INSERT INTO ItemsInTransactions VALUES('Banana',2,3);
INSERT INTO ItemsInTransactions VALUES('Chicken',2,5);
INSERT INTO ItemsInTransactions VALUES('Rice',2,1);
INSERT INTO ItemsInTransactions VALUES('Rice',3,1);
INSERT INTO ItemsInTransactions VALUES('Chicken',3,1);
INSERT INTO ItemsInTransactions VALUES('Garlic',4,7);
INSERT INTO ItemsInTransactions VALUES('Grape',4,80);
INSERT INTO ItemsInTransactions VALUES('Lemonade',5,17);
INSERT INTO ItemsInTransactions VALUES('Grape',5,5);
INSERT INTO ItemsInTransactions VALUES('Lemonade',6,17);
INSERT INTO ItemsInTransactions VALUES('Grape',6,24);
