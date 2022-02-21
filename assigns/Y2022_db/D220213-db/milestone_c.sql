-- tables definition
create table Customer (
"Customer Id" integer primary key,
"Customer Fname" text,
"Customer Lname" text,
"Customer City" text,
"Customer Country" text,
"Customer Email" text,
"Customer Password" text,
"Customer Segment" text check ("Customer Segment" in ('Consumer','Home Office','Corporate')),
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
"Product Status" integer check("Product Status" in (0,1)),
foreign key ("Product Category Id") references Category("Category Id")
);




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



create table "Order"(
"Order Id" integer,
"Type" text,
"Days for shipping (real)" integer,
"Days for shipment (scheduled)" integer,
"Delivery Status" text check ("Delivery Status" in ('Advance shipping','Late delivery','Shipping on time','Shipping canceled')),
"Late_delivery_risk" integer check ("Late_delivery_risk" in (0,1)),
"Market" text check ("Market" in ('Pacific Asia','USCA','Africa','Europe','LATAM')),
"Order City" text,
"Order Country" text,
"Order Customer Id" integer,
"order date (DateOrders)" date,
"Order Region" text,
"Order State" text,
"Order Status" text check ("Order Status" in ('COMPLETE','PENDING','CLOSED','PENDING_PAYMENT',
'CANCELED','PROCESSING','SUSPECTED_FRAUD','ON_HOLD','PAYMENT_REVIEW')),
"Shipping date (DateOrders)" date,
"Shipping Mode" text check ("Shipping Mode" in ('Standard Class','First Class','Second Class','Same Day')),
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


insert into "Order"
select distinct
"Order Id",
"Type",
"Days for shipping (real)",
"Days for shipment (scheduled)",
"Delivery Status",
"Late_delivery_risk",
"Market",
"Order City",
"Order Country",
"Order Customer Id",
"order date (DateOrders)",
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


select * from Customer;

select * from Category;

select * from Product;

select * from Department;

select * from Store;

select * from "Order";

select * from OrderItem;