
-- tables definition
drop table OrderItem;
drop table "Order";
drop table Store;
drop table Product;
drop table Category;
drop table Customer;


create table Customer (
"Customer Id" integer primary key,
"Customer Fname" text,
"Customer Lname" text,
"Customer City" text,
"Customer Country" text,
"Customer Email" text,
"Customer Password" text,
"Customer Segment" text,
"Customer State" text,
"Customer Street" text,
"Customer Zipcode" text
);

create table Category (
"Category Id" integer primary key,
"Category Name" text
);


create table Product(
"Product Card Id" integer primary key,
"Product Category Id" integer,
"Product Description" text,
"Product Image" text,
"Product Name" text ,
"Product Price" float,
"Product Status" integer,
foreign key ("Product Category Id") references Category("Category Id")
);


create table Store(
"Store Id" integer primary key autoincrement,
Latitude float,
Longitude float,
"Department Id" integer,
"Department Name" text
);

create table "Order"(
"Order Id" integer,
"Type" text,
"Days for shipping (real)" integer,
"Days for shipment (scheduled)" integer,
-- "Benefit per order" float,
-- "Sales per customer" float,
"Delivery Status" text,
"Late_delivery_risk" integer,
"Market" text,
"Order City" text,
"Order Country" text,
"Order Customer Id" integer,
"order date (DateOrders)" date,
-- "Order Profit Per Order" float,
"Order Region" text,
"Order State" text,
"Order Status" text,
"Shipping date (DateOrders)" date,
"Shipping Mode" text,
"Store Id" integer,
primary key ("Order Id","Store Id"),
foreign key ("Store Id") references Store("Store Id"),
foreign key ("Order Customer Id") references Customer("Customer Id")
);

create table OrderItem(
"Order Item Id" integer primary key,
"Order Id" integer,
"Store Id" integer,
"Order Item Cardprod Id" integer,
"Order Item Discount" float,
"Order Item Discount Rate" float,
"Order Item Product Price" float,
"Order Item Profit Ratio" float,
"Order Item Quantity" integer,
"Sales" float,
"Order Item Total" float,
foreign key ("Order Id","Store Id") references "Order"("Order Id","Store Id"),
foreign key ("Order Item Cardprod Id") references Product("Product Card Id")
);


-- populate data into tables
insert into Customer
select distinct
"Customer Id",
"Customer Fname",
"Customer Lname",
"Customer City",
"Customer Country",
"Customer Email",
"Customer Password",
"Customer Segment",
"Customer State",
"Customer Street",
"Customer Zipcode"
from DataCoSupplyChainDataset;



insert into Category
select distinct
"Category Id",
"Category Name"
from DataCoSupplyChainDataset;


insert into Product
select distinct
"Product Card Id",
"Product Category Id",
"Product Description",
"Product Image",
"Product Name",
"Product Price",
"Product Status"
from DataCoSupplyChainDataset;


insert into Store(Latitude,
Longitude,
"Department Id",
"Department Name")
select distinct
Latitude,
Longitude,
"Department Id",
"Department Name"
from DataCoSupplyChainDataset;

insert into "Order"
select distinct
"Order Id",
"Type",
"Days for shipping (real)",
"Days for shipment (scheduled)",
-- "Benefit per order",
-- "Sales per customer",
"Delivery Status",
"Late_delivery_risk",
"Market",
"Order City",
"Order Country",
"Order Customer Id",
"order date (DateOrders)",
-- "Order Profit Per Order",
"Order Region",
"Order State",
"Order Status",
"Shipping date (DateOrders)",
"Shipping Mode",
Store."Store Id"
from DataCoSupplyChainDataset d
join Store on d.Latitude=Store.Latitude and d.Longitude=Store.Longitude and d."Department Id"=Store."Department Id";




insert into OrderItem
select distinct
"Order Item Id",
"Order Id",
Store."Store Id",
"Order Item Cardprod Id",
"Order Item Discount",
"Order Item Discount Rate",
"Order Item Product Price",
"Order Item Profit Ratio",
"Order Item Quantity",
"Sales",
"Order Item Total"
from DataCoSupplyChainDataset d
join Store on d.Latitude=Store.Latitude and d.Longitude=Store.Longitude and d."Department Id"=Store."Department Id";





-- milestone C
--create table "Order"(
--"Order Id" integer primary key,
--"Type" text,
--"Days for shipping (real)" integer,
--"Days for shipment (scheduled)" integer,
---- "Benefit per order" float,
---- "Sales per customer" float,
--"Delivery Status" text,
--"Late_delivery_risk" integer,
--"Market" text,
--"Order City" text,
--"Order Country" text,
--"Order Customer Id" integer,
--"order date (DateOrders)" date,
---- "Order Profit Per Order" float,
--"Order Region" text,
--"Order State" text,
--"Order Status" text,
--"Shipping date (DateOrders)" date,
--"Shipping Mode" text,
--"Store Id" integer,
--foreign key ("Store Id") references Store("Store Id"),
--foreign key ("Order Customer Id") references Customer("Customer Id")
--);


create table Department(
"Department Id" integer primary key,
"Department Name" text
);

create table Store(
"Store Id" integer primary key autoincrement,
Latitude float,
Longitude float,
"Department Id" integer,
foreign key ("Department Id") references Department("Department Id")
);

insert into Department
select distinct "Department Id", "Department Name"
from DataCoSupplyChainDataset;

insert into Store(Latitude,
Longitude,
"Department Id")
select distinct
Latitude,
Longitude,
"Department Id"
from DataCoSupplyChainDataset;


drop table OrderItem;
drop table "Order";
drop table Store;
drop table Department;
drop table Product;
drop table Category;
drop table Customer;


-- populate data into tables
--insert into Customer
--select distinct
--"Customer Id",
--"Customer Fname",
--"Customer Lname",
--"Customer City",
--"Customer Country",
--"Customer Email",
--"Customer Password",
--"Customer Segment",
--"Customer State",
--"Customer Street",
--"Customer Zipcode"
--from DataCoSupplyChainDataset;
--
--
--
--insert into Category
--select distinct
--"Category Id",
--"Category Name"
--from DataCoSupplyChainDataset;
--
--
--insert into Product
--select distinct
--"Product Card Id",
--"Product Category Id",
--"Product Description",
--"Product Image",
--"Product Name",
--"Product Price",
--"Product Status"
--from DataCoSupplyChainDataset;


--insert into Store(Latitude,
--Longitude,
--"Department Id",
--"Department Name")
--select distinct
--Latitude,
--Longitude,
--"Department Id",
--"Department Name"
--from DataCoSupplyChainDataset;

--insert into "Order"
--select distinct
--"Order Id",
--"Type",
--"Days for shipping (real)",
--"Days for shipment (scheduled)",
--"Benefit per order",
--"Sales per customer",
--"Delivery Status",
--"Late_delivery_risk",
--"Market",
--"Order City",
--"Order Country",
--"Order Customer Id",
--"order date (DateOrders)",
--"Order Profit Per Order",
--"Order Region",
--"Order State",
--"Order Status",
--"Shipping date (DateOrders)",
--"Shipping Mode",
--Store."Store Id"
--from DataCoSupplyChainDataset d
--join Store on d.Latitude=Store.Latitude and d.Longitude=Store.Longitude;




--insert into OrderItem
--select distinct
--"Order Item Id",
--"Order Id",
--"Order Item Cardprod Id",
--"Order Item Discount",
--"Order Item Discount Rate",
--"Order Item Product Price",
--"Order Item Profit Ratio",
--"Order Item Quantity",
--"Sales",
--"Order Item Total"
--from DataCoSupplyChainDataset
--order by "Order Id";




-- milestone C



-- == draft definition



select distinct
"Customer Id",
"Customer Fname",
"Customer Lname",
"Customer City",
"Customer Country",
"Customer Email",
"Customer Password",
"Customer Segment",
"Customer State",
"Customer Street",
"Customer Zipcode"
from DataCoSupplyChainDataset;


select distinct
"Product Card Id",
"Product Category Id",
"Product Description",
"Product Image",
"Product Name",
"Product Price",
"Product Status"
from DataCoSupplyChainDataset;


select distinct
"Category Id",
"Category Name"
from DataCoSupplyChainDataset;


select distinct
"Order Id",
"Order Item Cardprod Id",
"Order Item Discount",
"Order Item Discount Rate",
"Order Item Id",
"Order Item Product Price",
"Order Item Profit Ratio",
"Order Item Quantity",
"Sales",
"Order Item Total"
from DataCoSupplyChainDataset
order by "Order Id";


select distinct
"Department Id",
"Department Name",
Latitude,
Longitude
from DataCoSupplyChainDataset;




select distinct
"Type",
"Days for shipping (real)",
"Days for shipment (scheduled)",
"Benefit per order",
"Sales per customer",
"Delivery Status",
"Late_delivery_risk",
"Market",
"Order City",
"Order Country",
"Order Customer Id",
"order date (DateOrders)",
"Order Id",
"Order Profit Per Order",
"Order Region",
"Order State",
"Order Status",
"Shipping date (DateOrders)",
"Shipping Mode"
from DataCoSupplyChainDataset;






--https://www.kaggle.com/shashwatwork/dataco-smart-supply-chain-for-big-data-analysis?select=DataCoSupplyChainDataset.csv

-- Category Id
-- Category Name
-- Customer City
-- Customer Country
-- Customer Email
-- Customer Fname
-- Customer Id
-- Customer Lname
-- Customer Password
-- Customer Segment
-- Customer State
-- Customer Street
-- Customer Zipcode
-- Department Id
-- Department Name
--Latitude
--Longitude
Market
Order City
Order Country
Order Customer Id
order date (DateOrders)
Order Id
--Order Item Cardprod Id
--Order Item Discount
--Order Item Discount Rate
--Order Item Id
--Order Item Product Price
--Order Item Profit Ratio
--Order Item Quantity
--Sales
--Order Item Total
Order Profit Per Order
Order Region
Order State
Order Status
--Product Card Id
--Product Category Id
--Product Description
--Product Image
--Product Name
--Product Price
--Product Status
Shipping date (DateOrders)
Shipping Mode