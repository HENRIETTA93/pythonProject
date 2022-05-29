

create table Customers(
Site int primary key,
Company_Name varchar(100),
Address varchar(100),
City varchar(50),
State char(5),
Zipcode varchar(20),
Country varchar(50),
Suggested_Company varchar(100),
Industry_Code varchar(50),
Industry_Vertical varchar(50),
Parent_Company varchar(100),
Parent_Industry_Code varchar(20),
Parent_Vertical varchar(50)
);

load data infile 'C:\customers.csv'
into table Customers
fields terminated by ',' optionally enclosed by '"' escaped by '"'
lines terminated by '\n';

create table Products(
Product varchar(50),
SKU int,
SKU2 varchar(40),
Product_Component varchar(50),
Product_Item varchar(60),
Solution_Area varchar(60),
Environment_Group varchar(50),
Environment varchar(50),
External_Level1 varchar(50),
External_Level2 varchar(50),
Development_Group varchar(100)
);

load data infile 'C:\products.csv'
into table Products
fields terminated by ',' optionally enclosed by '"' escaped by '"'
lines terminated by '\n';

create table Transactions(
Transaction_Date date,
Customer int,
Customer_Name varchar(100),
Country varchar(50),
Product varchar(50),
Product_Name varchar(50),
Platform varchar(50),
Quantity int,
Value int
);


load data infile 'C:/transactions.csv'
into table Transactions
fields terminated by ',' optionally enclosed by '"' escaped by '"'
lines terminated by '\n';


-- ====
create table Customers(
Site int primary key,
Company_Name varchar(100),
Address varchar(100),
City varchar(50),
State char(5),
Zipcode varchar(20),
Country varchar(50),
Suggested_Company varchar(100),
Industry_Code varchar(50),
Industry_Vertical varchar(50),
Parent_Company varchar(100),
Parent_Industry_Code varchar(20),
Parent_Vertical varchar(50)
);


create table Products(
Product varchar(50),
SKU int,
SKU2 varchar(40) primary key,
Product_Component varchar(50),
Product_Item varchar(60),
Solution_Area varchar(60),
Environment_Group varchar(50),
Environment varchar(50),
External_Level1 varchar(50),
External_Level2 varchar(50),
Development_Group varchar(100)
);


create table Transactions(
Transaction_Date date,
Customer int,
Customer_Name varchar(100),
Country varchar(50),
Product varchar(50),
Product_Name varchar(50),
Platform varchar(50),
Quantity int,
Value int,
foreign key (Customer) references Customers(Site),
foreign key (Product) references Products(sku2)
);

create table Industries(
Industry_Code varchar(50) primary key,
Industry_Vertical varchar(50),
Parent_Industry_Code varchar(20),
Parent_Vertical varchar(50)
);