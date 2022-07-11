create table `sort`(
sort_id int primary key,
sort_name varchar(20) not null
);

create table product(
product_id int primary key,
product_name varchar(20),
unit varchar(20),
price int,
sort_id int
);

create table orders(
order_id int primary key,
product_id int,
user_name varchar(20),
quantity int,
order_date date,
address text,
phone varchar(11)
);

-- 定时约束检查：2:00检查orders表中的product_id 是否来自product
-- 的product_id? 如果不存在product表，则将对应记录转移到suspend_orders表
-- suspend_orders表在orders表基础上多一insert_time 字段

-- 思路：前提创建suspend_orders 表
-- 1. 创建event 设置定时为每天2点钟  every 1 day starts date_add(date( ADDDATE(curdate(),1)),interval 2 hour)
-- 2. 在event中：查询不存在product表中的所有orders信息，并将orders信息和触发定时任务的时间insert到suspend_orders表中
create table suspend_orders(
order_id int primary key,
product_id int,
user_name varchar(20),
quantity int,
order_date date,
address text,
phone varchar(11),
insert_time timestamp
);
create event myevent
on schedule every 1 day starts date_add(date( ADDDATE(curdate(),1)),interval 2 hour)
do
insert into suspend_orders
select *,current_timestamp from orders where product_id not in (select product_id from product);

--
-- 思路：
-- 1. 求每个sort的product的平均价格，将此作为临时表t1
-- 2. 根据product、sort查询每组内的价格排序，使用rank() over(partition by sort_id order by price desc ) 将此结果作为t2
-- 3. 根据sort_id 连接t1和t2,并筛选rank排名小于等于10的记录，最终得到查询结果
select t2.product_id, t2.product_name, t2.price, t2.sort_id,
t1.sort_avg_price, t2.price_rank
from
(
select s.sort_id, avg(p.price) as sort_avg_price
from product p
join `sort` s on s.sort_id=p.sort_id
group by s.sort_id
) t1
join
(
select p.product_id, p.product_name, p.price, s.sort_id,
rank() over( partition by s.sort_id order by p.price desc) as price_rank
from product p
join `sort` s on s.sort_id=p.sort_id
group by p.product_id, p.product_name, p.price, s.sort_id
) t2
on t1.sort_id=t2.sort_id
where t2.price_rank<=10;






mysql> create database test_event;
Query OK, 1 row affected (0.02 sec)

mysql> use test_event;
Database changed
mysql> create table `sort`(
    -> sort_id int primary key,
    -> sort_name varchar(20) not null
    -> );
Query OK, 0 rows affected (0.04 sec)

mysql>
mysql> create table product(
    -> product_id int primary key,
    -> product_name varchar(20),
    -> unit varchar(20),
    -> price int,
    -> sort_id int
    -> );
Query OK, 0 rows affected (0.03 sec)

mysql>
mysql> create table orders(
    -> order_id int primary key,
    -> product_id int,
    -> user_name varchar(20),
    -> quantity int,
    -> order_date date,
    -> address text,
    -> phone varchar(11)
    -> );
Query OK, 0 rows affected (0.03 sec)

mysql> create table suspend_orders(
    -> order_id int primary key,
    -> product_id int,
    -> user_name varchar(20),
    -> quantity int,
    -> order_date date,
    -> address text,
    -> phone varchar(11),
    -> insert_time timestamp
    -> );
Query OK, 0 rows affected (0.03 sec)

mysql> create event myevent
    -> on schedule every 1 day starts date_add(date( ADDDATE(curdate(),1)),interval 2 hour)
    -> do
    -> insert into suspend_orders
    -> select *,current_timestamp from orders where product_id not in (select product_id from product);
Query OK, 0 rows affected (0.01 sec)





