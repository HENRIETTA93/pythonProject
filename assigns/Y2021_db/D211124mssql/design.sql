-- 导出.bacpac
-- https://docs.microsoft.com/en-us/azure/azure-sql/database/database-export#export-to-a-bacpac-file-using-the-sqlpackage-utility
-- cmd 进到sqlpackage.exe 所在路径下 SqlPackage.exe /a:Export /tf:testExport.bacpac /scs:"Data Source=自己的连接信息;Initial Catalog=库;" /ua:True /tid:"apptest.onmicrosoft.com"
SqlPackage.exe /a:Export /tf:testExport.bacpac /scs:"Data Source=apptestserver.database.windows.net;Initial Catalog=MyDB;" /ua:True /tid:"apptest.onmicrosoft.com"
-- sql file content

/*
Naked Foods is a bulk food retailer (https://nakedfoods.com.au/ ) has 21 stores around Australia ( https://nakedfoods.com.au/pages/store-locator  ).
It also has an online shopping channel ( https://nakedfoods.com.au/pages/shipping-delivery ).
It sells products that are free of artificial colors, flavors and sweeteners, and artificial preservatives,
GMO Free, free of hydrogenated fats and grown without the use of insecticides. Their organic products are
sourced from certified suppliers following Australian Certified Organic standards.

You have been asked to assist in designing a new WMS for the retailer. Assume the company has one warehouse
 per state. Also assume that the company uses GS1 standards, barcode scanners and IoT devices in its warehouse
  operations. As a first step, you will need to create a partially complete database in SQL Server and set up
   five queries focussed on the company’s monitoring and reporting needs. You will need to demonstrate that
   your queries work by creating at least one line of dummy data in the relevant tables and showing the outputs
   of your queries. Please note that this is a different case from the one given to you for the individual
   assignment. You should not simply copy the same tables and queries.
Please complete the table below and upload the .bacpac and .sql files as evidence along with this Word document:

*/


create table staff(
staff_id int primary key,
first_name varchar(20) not null,
last_name varchar(20) not null,
hire_date date,
staff_role varchar(20)
);


create table warehouse(
warehouse_id int primary key,
address varchar(50) not null,
phone_number varchar(12),
state varchar(20),
admin_id int,
foreign key (admin_id) references staff(staff_id) on delete set null
);



create table devices(
device_id int primary key,
device_type varchar(20),
warehouse_id int,
foreign key (warehouse_id) references warehouse(warehouse_id)
);



create table products(
product_id int primary key,
product_name varchar(20) not null,
product_type varchar(20) not null,
price float,
prod_size varchar(20)
);



create table products_warehouse(
product_id int,
warehouse_id int,
quantity int,
primary key (product_id,warehouse_id),
foreign key (product_id) references products(product_id),
foreign key (warehouse_id) references warehouse(warehouse_id)
);



create table customers(
customer_id int primary key,
first_name varchar(20),
last_name varchar(20),
phone varchar(20),
ship_address varchar(20),
is_online int
);


create table orders(
order_id int primary key,
customer_id int,
order_date date,
discount decimal,
total_price decimal
);


create table sells_products(
product_id int,
order_id int,
quantity int,
device_id int,
primary key (product_id, order_id),
foreign key (product_id) references products(product_id),
foreign key (order_id) references orders(order_id),
foreign key (device_id) references devices(device_id)
);



insert into staff values(1,'Jack','Smith', '2018-09-01', 'admin');
insert into staff values(2,'Lucy','Dole', '2019-01-01', 'clerk');

insert into warehouse values(10, 'warehouse addr 1', '3423211', 'NSW', 1);
insert into warehouse values(11, 'warehouse addr 2', '34234321', 'SDY', 1);


insert into devices values(100, 'barcode scanner',10);
insert into devices values(101,'barcode scanner',10);

insert into products values(101,'Strawberry jam', 'jam', 20, '100g');
insert into products values(102,'Apple pie', 'pie', 25, '100g');
insert into products values(103,'Hawthorn Juice', 'juice', 40, '100g');

insert into products_warehouse values(101,10,20);
insert into products_warehouse values(102,10,15);
insert into products_warehouse values(101,11,40);
insert into products_warehouse values(103,10,30);

insert into customers values(201, 'Luis','Joe', '2320132', 'NSF street 01', 0);
insert into customers values(202, 'David','Lee', '2328022', 'Addr 2 street 11', 1);
insert into customers values(203, 'Jay','Chow', '22321192', 'Addr 3 street 01', 0);

insert into orders values (3001,201,'2021-11-24', 0, null);
insert into orders values (3002,201,'2021-11-24', 0, null);
insert into orders values (3003,202,'2021-11-23', 0.2, null);

insert into sells_products values(101,3001,2, 100);
insert into sells_products values(102,3001,1, 100);

insert into sells_products values(101,3002,1, 100);
insert into sells_products values(103,3002,1, 100);

insert into sells_products values(101,3003,1, 101);
insert into sells_products values(103,3003,2, 101);

-- queries
-- q1: show every warehouse stores the products and the quanties of these products, display the warehouse id,address, products name and the quantities of the products
select w.warehouse_id, w.address, p.product_name, pw.quantity
from warehouse w join products_warehouse pw on w.warehouse_id=pw.warehouse_id
join products p on p.product_id=pw.product_id;

-- q2: query every warehouses and there are how many different device type in it.
select w.warehouse_id, d.device_type, count(d.device_id)
from warehouse w join devices d on w.warehouse_id=d.warehouse_id
group by w.warehouse_id, d.device_type;
-- q3: query the customers who buy the products' total price, if they have discount, compute the final total price after discount.

select c.first_name, c.last_name, sum(p.price*sp.quantity)*(1-o.discount) as total_price
from customers c join orders o on c.customer_id=o.customer_id
join sells_products sp on sp.order_id=o.order_id
join products p on p.product_id=sp.product_id
group by c.customer_id, c.first_name, c.last_name, o.discount;



-- q4: query the customers who buy the number of every products.
select c.first_name, c.last_name, p.product_name, sum(sp.quantity)
from customers c join orders o on c.customer_id=o.customer_id
join sells_products sp on sp.order_id=o.order_id
join products p on p.product_id=sp.product_id
group by c.customer_id, c.first_name, c.last_name,p.product_name;
-- q5: query every barcode scanners which has scanned the quantity of products.
select d.device_id, sum(sp.quantity) as products_num
from devices d join sells_products sp on d.device_id=sp.device_id
where d.device_type='barcode scanner'
group by d.device_id;