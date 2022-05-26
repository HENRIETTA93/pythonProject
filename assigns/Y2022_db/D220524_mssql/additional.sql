set identity_insert Orders on;

drop table if exists Supply_Distributors;
drop table if exists Supply_Retails;
drop table if exists Warehouse_Stock;
drop table if exists Warehouse;
drop table if exists Order_Product;
drop table if exists Orders;

create table Orders(
Order_ID int primary key,
Category varchar(30),
Order_Date date,
Total_Amount float,
Finish_Date date,
DeliveryTo_Date date,
foreign key (Category) references Product_Category(Category_Name)
);

create table Order_Product(
Order_ID int,
Product_ID varchar(50),
Quantity int,
primary key (Order_ID,Product_ID),
foreign key(Order_ID) references Orders(Order_ID),
foreign key (Product_ID) references Product(Product_ID)
);

create table Warehouse(
Warehouse_ID int primary key,
State char(4),
Address varchar(255),
Capacity int
);

create table Warehouse_Stock(
Warehouse_ID int,
Product_ID varchar(50),
Order_ID int,
Stock int,
Stock_Date date,
Stock_Area varchar(20),
Temperature float,
primary key(Warehouse_ID,Product_ID),
foreign key(Warehouse_ID) references Warehouse(Warehouse_ID),
foreign key(Order_ID,Product_ID) references Order_Product(Order_ID,Product_ID)
);

create table Supply_Retails(
Supply_ID int primary key,
Warehouse_ID int,
Product_ID varchar(50),
Retail_ID int,
Supply_Date date,
Quantity int,
Finish_Date date,
DeliveryTo_Date date,
foreign key (Warehouse_ID,Product_ID) references Warehouse_Stock(Warehouse_ID, Product_ID) ,
foreign key (Retail_ID) references Retail_Stockist(Retail_ID)
);

create table Supply_Distributors(
Supply_ID int primary key,
Warehouse_ID int,
Product_ID varchar(50),
Distributor_Name varchar(50),
Supply_Date date,
Quantity int,
Finish_Date date,
DeliveryTo_Date date,
foreign key (Warehouse_ID,Product_ID) references Warehouse_Stock(Warehouse_ID, Product_ID) ,
foreign key (Distributor_Name) references Distributors(Distributor_Name)
);


INSERT INTO [Orders]([Order_ID], [Category], [Order_Date], [Total_Amount], [Finish_Date], [DeliveryTo_Date]) VALUES (1, 'Bread', '2022-05-02', NULL, '2022-05-09', '2022-05-10');
INSERT INTO [Orders]([Order_ID], [Category], [Order_Date], [Total_Amount], [Finish_Date], [DeliveryTo_Date]) VALUES (2, 'Chocolate Boxed', '2022-04-27', NULL, '2022-05-04', '2022-05-02');
INSERT INTO [Orders]([Order_ID], [Category], [Order_Date], [Total_Amount], [Finish_Date], [DeliveryTo_Date]) VALUES (3, 'Candy', '2022-05-04', NULL, '2022-05-11', '2022-05-10');
INSERT INTO [Orders]([Order_ID], [Category], [Order_Date], [Total_Amount], [Finish_Date], [DeliveryTo_Date]) VALUES (4, 'Condiments', '2022-05-11', NULL, '2022-05-18', '2022-05-19');
INSERT INTO [Orders]([Order_ID], [Category], [Order_Date], [Total_Amount], [Finish_Date], [DeliveryTo_Date]) VALUES (5, 'Dark Chocolate', '2022-05-17', NULL, '2022-05-24', '2022-05-23');
INSERT INTO [Orders]([Order_ID], [Category], [Order_Date], [Total_Amount], [Finish_Date], [DeliveryTo_Date]) VALUES (6, 'Sugar', '2022-05-11', NULL, '2022-05-18', '2022-05-16');


INSERT INTO [Order_Product]([Order_ID], [Product_ID], [Quantity]) VALUES (1, 'DAU1429', 30);
INSERT INTO [Order_Product]([Order_ID], [Product_ID], [Quantity]) VALUES (2, 'COL#2009', 20);
INSERT INTO [Order_Product]([Order_ID], [Product_ID], [Quantity]) VALUES (3, 'PAR20904', 50);
INSERT INTO [Order_Product]([Order_ID], [Product_ID], [Quantity]) VALUES (4, 'SAU1001', 100);
INSERT INTO [Order_Product]([Order_ID], [Product_ID], [Quantity]) VALUES (5, 'TRE162', 40);
INSERT INTO [Order_Product]([Order_ID], [Product_ID], [Quantity]) VALUES (6, 'ZUC50526MB', 60);


INSERT INTO [Warehouse]([Warehouse_ID], [State], [Address], [Capacity]) VALUES (1, 'NSW ', 'Sydney', 1000);
INSERT INTO [Warehouse]([Warehouse_ID], [State], [Address], [Capacity]) VALUES (2, 'VIC ', 'Melbourne', 800);


INSERT INTO [Warehouse_Stock]([Warehouse_ID],[Order_ID],[Product_ID], [Stock], [Stock_Date], [Stock_Area], [Temperature]) VALUES (1,1, 'DAU1429', 30, '2022-05-11', 'Bread area', 10);
INSERT INTO [Warehouse_Stock]([Warehouse_ID],[Order_ID],[Product_ID], [Stock], [Stock_Date], [Stock_Area], [Temperature]) VALUES (1,2, 'COL#2009', 20, '2022-05-02', NULL, 10);
INSERT INTO [Warehouse_Stock]([Warehouse_ID],[Order_ID],[Product_ID], [Stock], [Stock_Date], [Stock_Area], [Temperature]) VALUES (1,3, 'PAR20904', 50, '2022-05-11', NULL, 10);
INSERT INTO [Warehouse_Stock]([Warehouse_ID],[Order_ID],[Product_ID], [Stock], [Stock_Date], [Stock_Area], [Temperature]) VALUES (2,4, 'SAU1001', 100, '2022-05-19', NULL, 10);
INSERT INTO [Warehouse_Stock]([Warehouse_ID],[Order_ID],[Product_ID], [Stock], [Stock_Date], [Stock_Area], [Temperature]) VALUES (2,5, 'TRE162', 40, '2022-05-25', NULL, 10);
INSERT INTO [Warehouse_Stock]([Warehouse_ID],[Order_ID],[Product_ID], [Stock], [Stock_Date], [Stock_Area], [Temperature]) VALUES (2,6, 'ZUC50526MB', 60, '2022-05-16', NULL, 10);


INSERT INTO [Supply_Retails]([Supply_ID], [Warehouse_ID], [Product_ID], [Retail_ID], [Supply_Date], [Quantity], [Finish_Date], [DeliveryTo_Date]) VALUES (1, 1, 'COL#2009', 4, '2022-05-18', 4, '2022-05-25', '2022-05-23');
INSERT INTO [Supply_Retails]([Supply_ID], [Warehouse_ID], [Product_ID], [Retail_ID], [Supply_Date], [Quantity], [Finish_Date], [DeliveryTo_Date]) VALUES (2, 1, 'COL#2009', 3, '2022-05-17', 3, '2022-05-24', '2022-05-23');
INSERT INTO [Supply_Retails]([Supply_ID], [Warehouse_ID], [Product_ID], [Retail_ID], [Supply_Date], [Quantity], [Finish_Date], [DeliveryTo_Date]) VALUES (3, 2, 'SAU1001', 3, '2022-05-19', 5, '2022-05-26', NULL);
INSERT INTO [Supply_Retails]([Supply_ID], [Warehouse_ID], [Product_ID], [Retail_ID], [Supply_Date], [Quantity], [Finish_Date], [DeliveryTo_Date]) VALUES (4, 2, 'TRE162', 6, '2022-05-18', 5, '2022-05-25', '2022-05-26');


INSERT INTO [Supply_Distributors]([Supply_ID], [Warehouse_ID], [Product_ID], [Distributor_Name], [Supply_Date], [Quantity], [Finish_Date], [DeliveryTo_Date]) VALUES (1, 1, 'DAU1429', 'Epicurean Essentials', '2022-05-18', 12, '2022-05-19', '2022-05-20');
INSERT INTO [Supply_Distributors]([Supply_ID], [Warehouse_ID], [Product_ID], [Distributor_Name], [Supply_Date], [Quantity], [Finish_Date], [DeliveryTo_Date]) VALUES (2, 2, 'ZUC50526MB', 'Chefs Pantry', '2022-05-15', 15, '2022-05-22', '2022-05-21');
INSERT INTO [Supply_Distributors]([Supply_ID], [Warehouse_ID], [Product_ID], [Distributor_Name], [Supply_Date], [Quantity], [Finish_Date], [DeliveryTo_Date]) VALUES (3, 1, 'PAR20904', 'Chefs Pantry', '2022-05-17', 10, '2022-05-24', '2022-05-23');
