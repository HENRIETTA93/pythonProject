create table Industries(
Industry_Code varchar(50) primary key,
Industry_Vertical varchar(50)
);

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
Parent_Company varchar(100)
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
Product varchar(50),
Platform varchar(50),
Quantity int,
Value int,
primary key (Transaction_Date,Customer,Product),
foreign key (Customer) references Customers(Site),
foreign key (Product) references Products(sku2)
);


-- clean data
select site
from customers
group by site
having count(site)>1;

select sku2, count(sku2)
from products
group by sku2
having count(sku2)>1;

select * from products where sku2='MESSAGE MGR ENTERPRISE LICENSE';
delete from products where sku2='MESSAGE MGR ENTERPRISE LICENSE';

select Transaction_Date, Customer,Product, count(*)
from transactions
group by Transaction_Date, Customer,Product
having count(*)>1;

select * from transactions where Transaction_Date='2014-10-19' and Customer='16128' and Product='BABWUR17755WBR11506584';

delete from transactions where Transaction_Date='2014-10-19' and Customer='16128' and Product='BABWUR17755WBR11506584';

select *
from transactions where Customer not in (select site from customers);

select *
from transactions where Product not in (select sku2 from products);

delete from transactions where Product not in (select sku2 from products);

delete from transactions where Customer not in (select site from customers);


-- load
insert into test2.industries
select distinct Industry_Code,Industry_Vertical
from test.customers where Industry_Code is not null and Industry_Code!='';

insert into test2.customers
select Site, Company_Name, Address, City, State, Zipcode, Country, Suggested_Company, Industry_Code, Parent_Company
from test.customers;

insert into test2.products
select *
from test.products;

insert into test2.transactions
select Transaction_Date,Customer,Product,Platform,Quantity,Value
from test.transactions;

-- queries

-- 1. How many different products does the company sell?

select count(distinct sku2)
from products;

-- 2. How many products have the company sold in October?

select sum(quantity)
from transactions join products on transactions.Product=products.sku2
where month(transactions.Transaction_Date)=10;


-- 3. How many customers have bought products from the company in October?

select count(customers.site)
from transactions join customers on transactions.Customer=customers.Site
where month(transactions.Transaction_Date)=10;

-- 4. Which customer has spent the most money with the company in October?
select customers.site, customers.Company_Name, sum(value)
from transactions join customers on transactions.Customer=customers.Site
where month(transactions.Transaction_Date)=10
group by customers.site, customers.Company_Name
order by sum(value) desc limit 1;

-- 5. How many countries did the company ship products to in October?
select count(distinct country)
from transactions join customers on transactions.Customer=customers.Site
where month(transactions.Transaction_Date)=10;

-- 6. Which state in America has the highest number of registered customers?

select state, count(site)
from customers
where country like '%united states%'
group by state
order by count(site) desc limit 1;

-- 7. On which day were the most products sold?

select transaction_date, sum(quantity)
from transactions
group by transaction_date
order by sum(quantity) desc limit 1;

-- 8. Which development group had the most sales in October?

select Development_Group, sum(value)
from transactions join products on transactions.Product=products.sku2
where month(transactions.Transaction_Date)=10
group by Development_Group
order by sum(value) desc limit 1;

-- 9. Which industry vertical had the lowest number of sales in October?

select Industry_Vertical, sum(value)
from transactions join customers on transactions.Customer=customers.Site
join Industries on industries.Industry_Code=customers.Industry_Code
group by Industry_Vertical
order by sum(value) limit 1;

-- 10. Which solution area has the lowest sales in the Retail industry vertical?


select solution_area, sum(value)
from transactions join products on transactions.Product=products.sku2
join customers on transactions.Customer=customers.Site
join Industries on industries.Industry_Code=customers.Industry_Code
where industries.Industry_Vertical like '%retail%'
group by solution_area
order by sum(value) limit 1;