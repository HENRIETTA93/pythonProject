

create table Customers(
Site int primary key,
Company_Name varchar(50),
Address varchar(120),
City varchar(30),
State varchar(5),
Zipcode varchar(25),
Country varchar(30),
Suggested_Company varchar(50),
Industry_Code varchar(25),
Industry_Vertical varchar(30),
Parent_Company varchar(50),
Parent_Industry_Code varchar(25),
Parent_Vertical varchar(30)
);

create table Products(
Product varchar(25),
SKU varchar(10),
SKU2 varchar(25),
Product_Component varchar(25),
Product_Item varchar(30),
Solution_Area varchar(30),
Environment_Group varchar(30),
Environment varchar(30),
External_Level1 varchar(30),
External_Level2 varchar(30),
Development_Group varchar(30)
);

create table Transactions(
Transaction_Date date,
Customer int,
Customer_Name varchar(50),
Country varchar(25),
Product varchar(25),
Product_Name varchar(25),
Platform varchar(20),
Quantity int,
Value decimal
);


-- ===
create table company_industries(
Industry_Code varchar(30),
Industry_Vertical varchar(45),
Parent_Industry_Code varchar(25),
Parent_Vertical varchar(30),
primary key(Industry_Code,Parent_Industry_Code)
);


-- ===

select site
from customers
group by site
having count(site)>1;

select sku2, count(sku2)
from products
group by sku2
having count(sku2)>1;


select Customer,Product, Transaction_Date
from transactions
group by Customer,Product,Transaction_Date
having count(*)>1;


delete from transactions where Product not in (select SKU2 from products);

delete from transactions where Customer not in (select Site from customers);

-- ==

create table Customers(
Site int primary key,
Company_Name varchar(50),
Address varchar(120),
City varchar(30),
State varchar(5),
Zipcode varchar(25),
Country varchar(30),
Suggested_Company varchar(50),
Industry_Code varchar(25),
Industry_Vertical varchar(30),
Parent_Industry_Code varchar(25),
foreign key (Industry_Code,Parent_Industry_Code) references company_industries(Industry_Code,  Parent_Industry_Code)
);

create table Products(
Product varchar(25),
SKU varchar(10),
SKU2 varchar(25),
Product_Component varchar(25),
Product_Item varchar(30),
Solution_Area varchar(30),
Environment_Group varchar(30),
Environment varchar(30),
External_Level1 varchar(30),
External_Level2 varchar(30),
Development_Group varchar(30)
);

create table Transactions(
Transaction_Date date,
Customer int,
Customer_Name varchar(50),
Country varchar(25),
Product varchar(25),
Product_Name varchar(25),
Platform varchar(20),
Quantity int,
Value decimal
);


-- ==

-- 1. How many different products does the company sell?

select count(*) from products;

-- 2. How many products have the company sold in October?

select sum(quantity) as sold from products join transactions on transactions.Product=products.sku2
where month(transactions.Transaction_Date)=10;


-- 3. How many customers have bought products from the company in October?

select count(distinct site) as cust_num from customers join transactions on transactions.Customer=customers.Site
where month(transactions.Transaction_Date)=10;

-- 4. Which customer has spent the most money with the company in October?
select site,Company_Name from customers join transactions on transactions.Customer=customers.Site
where month(transactions.Transaction_Date)=10
group by site, Company_Name
order by sum(value) desc limit 1;

-- 5. How many countries did the company ship products to in October?
select count(distinct customers.country)  as countries_num
from transactions join customers on transactions.Customer=customers.Site
where month(Transaction_Date)=10;

-- 6. Which state in America has the highest number of registered customers?

select state from customers
where lower(country) like 'united states%'
group by state order by count(site) desc limit 1;

-- 7. On which day were the most products sold?

select transaction_date from transactions
group by transaction_date order by sum(quantity) desc limit 1;

-- 8. Which development group had the most sales in October?

select Development_Group from products join transactions on transactions.Product=products.sku2
where month(transactions.Transaction_Date)=10
group by Development_Group
order by sum(value) desc limit 1;

-- 9. Which industry vertical had the lowest number of sales in October?

select Industry_Vertical from customers join transactions on transactions.Customer=customers.Site
join company_industries ci on Customers.Industry_Code = ci.Industry_Code
group by Industry_Vertical
order by sum(value) limit 1;

-- 10. Which solution area has the lowest sales in the Retail industry vertical?


select solution_area from  products join transactions on transactions.Product=products.sku2
join customers on transactions.Customer=customers.Site
join company_industries ci on Customers.Industry_Code = ci.Industry_Code
where lower(ci.Industry_Vertical) like 'retail%'
group by solution_area
order by sum(value) limit 1;