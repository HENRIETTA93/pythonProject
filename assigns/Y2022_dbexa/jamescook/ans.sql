create table branch (
branch_id int,
location varchar(20),
manager varchar(20),
primary key (branch_id)
);

create table staff(
staff_id int primary key,
name varchar(20),
branch_id int,
foreign key (branch_id) references branch(branch_id)
);

create table supplier(
supplier_id int primary key,
name varchar(20),
supplies text
);

create table supplyToBranches(
supplier_id int,
branch_id int,
primary key (supplier_id,branch_id),
foreign key (branch_id) references branch(branch_id),
foreign key (supplier_id) references supplier(supplier_id)
);

create table supermarket(
supermarket_code varchar(30) primary key,
location varchar(50),
contact_person varchar(20)
);

create table supplyToSupermarkets(
supplier_id int,
supermarket_code varchar(30),
primary key (supplier_id,supermarket_code),
foreign key (supermarket_code) references supermarket(supermarket_code),
foreign key (supplier_id) references supplier(supplier_id)
);

create table meal(
meal_code varchar(30) primary key,
meal_description text
);

create table offer(
meal_code varchar(30),
supermarket_code varchar(30),
primary key (meal_code,supermarket_code),
foreign key (meal_code) references meal(meal_code),
foreign key (supermarket_code) references supermarket(supermarket_code)
);

create table order(
order_id int primary key,
branch_id int,
customer_address varchar(50),
email varchar(30),
contact_number varchar(20),
order_details text,
foreign key (branch_id) references branch(branch_id)
);




-- Q2
create table membership(
Mem_Num text,
Mem_Fname text,
Mem_Lname text,
Mem_Street text,
Mem_City text,
Mem_State text,
Mem_Zip text,
Mem_Balance text
);

create table detailrental(
Rent_Num text,
Vid_Num text,
Detail_Fee text,
Detail_Duedate text,
Detail_Returndate text,
Detail_Dailylatefee int
);

create table rental(
Rent_Num text,
Rent_Date text,
Mem_Num text
);


-- 1.
select Mem_Num, Mem_Fname, Mem_Balance
from MEMBERSHIP
where Mem_Balance<10;

-- 2.
select MEMBERSHIP.Mem_Num, Mem_Fname, Mem_Lname, Mem_Balance
from MEMBERSHIP
join RENTAL on MEMBERSHIP.Mem_Num=RENTAL.Mem_Num;

-- 3.

select min(Mem_Balance), max(Mem_Balance), avg(Mem_Balance)
from MEMBERSHIP
join RENTAL on MEMBERSHIP.Mem_Num=RENTAL.Mem_Num;


-- 4.

select MEMBERSHIP.Mem_Num, Mem_Lname, sum(DETAILRENTAL.Detail_Fee)
from MEMBERSHIP
join RENTAL on MEMBERSHIP.Mem_Num=RENTAL.Mem_Num
join DETAILRENTAL on DETAILRENTAL.Rent_Num=RENTAL.Rent_Num
group by MEMBERSHIP.Mem_Num, Mem_Lname;


-- Q3
after normalization to 3NF:

SALESPERSON (SALESPERSON_ID, SALESPERSON_NAME, DEPARTMENT)
CUSTOMER (CUSTOMER_ID, CUSTOMER_NAME, CUSTOMER_EMAIL)
ITEM (ITEM_DESCRIPTION, PRICE_PER_UNIT)
ORDER (ORDER_ID, ORDER_DATE, ORDER_QTY, SALESPERSON_ID, CUSTOMER_ID, ITEM_DESCRIPTION, DELIVERY_DATE, DELIVERY_TIME)
