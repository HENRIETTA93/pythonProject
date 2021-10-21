
create table customer(
email varchar(50),
hit_datetime_utc datetime,
hit_day date,
customer_id varchar(10),
page_asin varchar(20),
sales int
);


-- 1. Calculate how many unique ‘page_asin’s each customer interacted with each day.
select customer_id, count(distinct page_asin) as page_asin_number
from customer
group by customer_id;
-- 2. For each customer, identify the first ‘page_asin’ that a customer visited on the most recent day.

select t1.customer_id, t1.page_asin
from customer t1
join
(
select customer_id,min(hit_datetime_utc) as first_hit_time
from customer
group by customer_id
) t2
on t1.customer_id=t2.customer_id and t1.hit_datetime_utc=t2.first_hit_time;




-- 3. Calculate the total sales for each day in May and June (1 row per day)
select hit_day, sum(sales) as total_sales
from customer
where MONTH(hit_day)=5 or MONTH(hit_day)=6
group by hit_day;

-- 4. Calculate the total sales by email domain
select email, sum(sales) as total_sales
from customer
group by email;

-- 5. Write SQL to have sales for April, May and June and Pivot Data so that months are in columns/headers and not in a single row
select sum(case when month(hit_day)=4 then sales else 0 end) as [April],
sum(case when month(hit_day)=5 then sales else 0 end) as [May],
sum(case when month(hit_day)=6 then sales else 0 end) as [June]
from customer;



-- 6. Find the month-over-month percentage change for monthly sales  by user

select t1.customer_id,round((t2.total_sale-t1.total_sale+0.0)/t1.total_sale,2) *100 as percentage
from
(
select customer_id, month(hit_day) as months, sum(sales) as total_sale
from customer
group by customer_id, month(hit_day)
) t1,
(
select customer_id, month(hit_day) as months, sum(sales) as total_sale
from customer
group by customer_id, month(hit_day)
) t2
where t1.months+1=t2.months and t1.customer_id=t2.customer_id;


-- 7. Write a query that gets the number of retained users per month. In this case, retention for a given month is defined as the number of users who had sales in that month who also logged sales in the immediately previous month.
select (count(t1.customer_id)+0.0)/(select count(distinct customer_id) from customer ) as retation
from
(
select customer_id, month(hit_day) as months, sum(sales) as total_sales
from customer
group by customer_id, month(hit_day)
) t1,
(
select customer_id, month(hit_day) as months, sum(sales) as total_sales
from customer
group by customer_id, month(hit_day)
) t2
where t1.customer_id=t2.customer_id and t1.months+1=t2.months;
-- 8. Write a query to get the customer with the highest sales. (Use Window Function)

select customer_id, total_sales as highest_sales
from
(
select customer_id, sum(sales) as total_sales, rank() over(order by sum(sales) desc) as ranks
from customer
group by customer_id
) t
where ranks=1;

-- 9a. Write a query that returns the same table, but with a new column that has average sales per customer.
select t1.*, t2.avg_sales
from customer t1
join
(
select customer_id, avg(sales) as avg_sales
from customer
group by customer_id
) t2
on t1.customer_id=t2.customer_id;

-- 9b. Write a query that adds a column with the rank of each customer based on their sales, where the customer with the highest sales gets the rank of 1

select t1.*, t2.ranks
from customer t1
join
(
select customer_id, sum(sales) as total_sales, rank() over(order by sum(sales) desc) as ranks
from customer
group by customer_id
) t2
on t1.customer_id=t2.customer_id;





-- ===========

create table CUSTOMER_LISTENING(
customerId int,
listeningDate date,
listeningTime  int,
titleId int
);

create table CUSTOMER_CONTACTS(
contactID   varchar(20),
customerID 	int,
contactDate  date,
contactReason   varchar(20),
relatedTitleId int
);

create table CUSTOMER_PURCHASES(
customerId 	int,
orderId 	varchar(20),
titleId 	int,
salesUsd 	float,
orderDate 	date,
marketplace varchar(20)
);


-- 1.) Write a query to show the top 3 purchases each month of 2020 for each marketplace

select top 3 marketplace, month(orderDate) as months, sum(salesUsd) as total_sales
from CUSTOMER_PURCHASES
where year(orderDate)=2020
group by marketplace, month(orderDate)
order by total_sales desc;

-- 2.) Write a query to show for contacting customers in 2020, what was the average daily listening time of customer 30 days pre contact and 30 days post contact after their first contact?

select t1.customerID, t1.contactDate, t1.avg_pre_listening, t2.avg_post_listening
from
(
select cc.customerID,t.contactDate, avg(cl.listeningTime) as avg_pre_listening
from CUSTOMER_CONTACTS cc
join CUSTOMER_LISTENING cl
on cc.customerID =cl.customerID
join
(
select cc.customerID, cc.contactDate
from CUSTOMER_CONTACTS cc
where year(cc.contactDate)=2020
) t on t.customerID=cc.customerID and t.contactDate=cc.contactDate
where cl.listeningDate between dateadd(day, -30,t.contactDate) and t.contactDate
group by cc.customerID, t.contactDate
) t1
join
(
select cc.customerID,t.contactDate, avg(cl.listeningTime) as avg_post_listening
from CUSTOMER_CONTACTS cc
join CUSTOMER_LISTENING cl
on cc.customerID =cl.customerID
join
(
select cc.customerID, cc.contactDate
from CUSTOMER_CONTACTS cc
where year(cc.contactDate)=2020
) t on t.customerID=cc.customerID and t.contactDate=cc.contactDate
where cl.listeningDate between t.contactDate and dateadd(day, 30,t.contactDate)
group by cc.customerID, t.contactDate
) t2
on t1.customerID=t2.customerID and t1.contactDate=t2.contactDate;


-- ===========


create table member(
customerID int,
membershipStart date,
membershipEnd date
);

-- Write a query to show the month 1 to month 12 retention rate (at most) for the months Jan 2020 - Jan 2021.
select month(membershipStart) as months, count(distinct customerID)/((select count(*) from member)+0.0) as retention
from member
where year(membershipStart) between 2020 and 2021 and membershipEnd is null
group by month(membershipStart);