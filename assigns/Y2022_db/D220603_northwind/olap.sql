-- 1
select min(date(OrderDate)), max(date(OrderDate))
from orders;

-- 2


set @minDate=(select min(date(OrderDate)) from orders);
set @maxDate=(select max(date(OrderDate)) from orders);
set @beforeMinDate=(select date_sub(@minDate, interval 1 day));
set @s=0;
with t as
(
select 
@s:=@s+1 as `index`,
date(date_add(@beforeMinDate,interval @s day)) as `date`
from orders
where @s<=(select DATEDIFF(@maxDate,@minDate))
)
select `date` from t
where `date` not in (select distinct OrderDate from orders);

-- 3
select ct.CategoryName, c.Country, count(o.OrderID) as order_count,sum(od.UnitPrice*od.Quantity*od.Discount) as total_revenue
from customers c
join orders o on c.CustomerID=o.CustomerID
join orderdetails od on od.OrderID=o.OrderID
join products p on p.ProductID=od.ProductID
join categories ct on ct.CategoryID=p.CategoryID
group by ct.CategoryName, c.Country with rollup;

-- 4
select c.CustomerID, c.CompanyName, count(o.OrderID) as order_count, rank() over(order by count(o.OrderID) desc) as `rank`
from customers c
left join orders o on c.CustomerID=o.CustomerID
group by c.CustomerID, c.CompanyName;


-- 5
set @minDate=(select min(date(OrderDate)) from orders);
set @maxDate=(select max(date(OrderDate)) from orders);
set @beforeMinDate=(select date_sub(@minDate, interval 1 day));
set @s=0;
with t as
(
select 
@s:=@s+1 as `index`,
date(date_add(@beforeMinDate,interval @s day)) as `date`
from orders
where @s<=(select DATEDIFF(@maxDate,@minDate))
)
select date(o.OrderDate), sum(od.UnitPrice*od.Quantity*od.Discount), avg(sum(od.UnitPrice*od.Quantity*od.Discount)) over (order by o.OrderDate rows 6 preceding)
from t 
left join orders o on date(o.OrderDate)=t.`date`
left join orderdetails od on od.OrderID=o.OrderID
where t.`date` in (select distinct OrderDate from orders) or t.`date` not in (select distinct OrderDate from orders) and WEEKDAY(t.`date`) not in (5,6)
group by o.OrderDate;



set @minDate=(select min(date(OrderDate)) from orders);
set @maxDate=(select max(date(OrderDate)) from orders);
set @beforeMinDate=(select date_sub(@minDate, interval 1 day));
set @s=0;
with t as
(
select 
@s:=@s+1 as `index`,
date(date_add(@beforeMinDate,interval @s day)) as `date`
from orders
where @s<=(select DATEDIFF(@maxDate,@minDate))
)
select orderdate, case when `rank`<7 then null else avg_7 end as avg_7
from 
(
select date(o.OrderDate) as orderdate, sum(od.UnitPrice*od.Quantity*od.Discount), avg(sum(od.UnitPrice*od.Quantity*od.Discount)) over (order by o.OrderDate rows 6 preceding) as avg_7,
rank() over(order by o.OrderDate ) as `rank`
from t 
left join orders o on date(o.OrderDate)=t.`date`
left join orderdetails od on od.OrderID=o.OrderID
where t.`date` in (select distinct OrderDate from orders) or t.`date` not in (select distinct OrderDate from orders) and WEEKDAY(t.`date`) not in (5,6)
group by o.OrderDate
) t;




-- 6
select date(o.OrderDate), e.EmployeeID, concat(e.FirstName, ' ', e.LastName) as emp_name,
sum(od.UnitPrice*od.Quantity*od.Discount) as total_sales, 
rank() over(partition by o.OrderDate order by sum(od.UnitPrice*od.Quantity*od.Discount) desc ) as `rank`
from employees e 
left join orders o on o.EmployeeID=e.EmployeeID
left join orderdetails od on od.OrderID=o.OrderID
group by o.OrderDate, e.EmployeeID,concat(e.FirstName, ' ', e.LastName);

with t as
(
select e.EmployeeID,e.FirstName, e.LastName, date(o.OrderDate) as OrderDate
from employees e, orders o
order by e.EmployeeID
)
select OrderDate, EmployeeID, emp_name, ifnull(total_sales,0), `rank`
from
(
select date(t.OrderDate) as OrderDate, e.EmployeeID, concat(e.FirstName, ' ', e.LastName) as emp_name,
sum(od.UnitPrice*od.Quantity*od.Discount) as total_sales, 
rank() over(partition by o.OrderDate order by sum(od.UnitPrice*od.Quantity*od.Discount) desc ) as `rank`
from employees e 
left join t on e.EmployeeID=t.EmployeeID
left join orders o on o.EmployeeID=e.EmployeeID and t.OrderDate=o.OrderDate
left join orderdetails od on od.OrderID=o.OrderID
group by t.OrderDate, e.EmployeeID,concat(e.FirstName, ' ', e.LastName)
order by t.OrderDate
) tt;


-- 7

with t1 as
(
select c.CustomerID, c.CompanyName,date(o.OrderDate) as order_date, sum(od.UnitPrice*od.Quantity*od.Discount) as total_revenue, rank() over(partition by c.CustomerID, c.CompanyName order by sum(od.UnitPrice*od.Quantity*od.Discount)desc) as `rank`
from customers c
left join orders o on c.CustomerID=o.CustomerID
left join orderdetails od on od.OrderID=o.OrderID
group by c.CustomerID, c.CompanyName, o.OrderDate
),
t2 as
(
select c.CustomerID, c.CompanyName, o.OrderID, date(o.OrderDate) as current_order,
lead(date(o.OrderDate),1 ) over (partition by c.CustomerID, c.CompanyName order by o.OrderDate desc) as last_order,
lag(date(o.OrderDate),1) over(partition by c.CustomerID, c.CompanyName order by o.OrderDate desc) as next_order
from customers c
left join orders o on c.CustomerID=o.CustomerID
) 
select tt1.CustomerID, tt1.CompanyName, tt1.OrderID, tt1.order_date, tt1.total_revenue, 
tt2.order_date as last_order_date, tt2.last_order_revenue, tt1.total_revenue-tt2.last_order_revenue as diffprev,
tt3.order_date as next_order_date, tt3.next_order_revenue, tt1.total_revenue-tt3.next_order_revenue as diffnext
from 
(
select t1.CustomerID, t1.CompanyName, t2.OrderID,t1.order_date, t2.current_order, t2.last_order, t2.next_order, t1.total_revenue
from t1 join t2 on t1.CustomerID=t2.CustomerID and t1.order_date=t2.current_order
) tt1
left join
(
select t1.CustomerID, t1.CompanyName, t1.order_date, t2.current_order, t2.last_order, t2.next_order, t1.total_revenue as last_order_revenue
from t1 join t2 on t1.CustomerID=t2.CustomerID and t1.order_date=t2.last_order
) tt2 on tt1.CustomerID=tt2.CustomerID and tt1.current_order=tt2.current_order
left join 
(
select t1.CustomerID, t1.CompanyName, t1.order_date, t2.current_order, t2.last_order, t2.next_order, t1.total_revenue as next_order_revenue
from t1 join t2 on t1.CustomerID=t2.CustomerID and t1.order_date=t2.next_order
) tt3 on tt1.CustomerID=tt3.CustomerID and tt1.current_order=tt3.current_order;




with t1 as
(
select c.CustomerID, c.CompanyName,date(o.OrderDate) as order_date, sum(od.UnitPrice*od.Quantity*od.Discount) as total_revenue, rank() over(partition by c.CustomerID, c.CompanyName order by sum(od.UnitPrice*od.Quantity*od.Discount)desc) as `rank`
from customers c
left join orders o on c.CustomerID=o.CustomerID
left join orderdetails od on od.OrderID=o.OrderID
group by c.CustomerID, c.CompanyName, o.OrderDate
),
t2 as
(
select c.CustomerID, c.CompanyName, o.OrderID, date(o.OrderDate) as current_order,
lead(date(o.OrderDate),1 ) over (partition by c.CustomerID, c.CompanyName order by o.OrderDate desc) as last_order,
lag(date(o.OrderDate),1) over(partition by c.CustomerID, c.CompanyName order by o.OrderDate desc) as next_order
from customers c
left join orders o on c.CustomerID=o.CustomerID
) 
select tt1.CustomerID, tt1.OrderID, tt1.total_revenue, 
tt1.total_revenue-tt2.last_order_revenue as diffprev,
tt1.total_revenue-tt3.next_order_revenue as diffnext
from 
(
select t1.CustomerID, t1.CompanyName, t2.OrderID,t1.order_date, t2.current_order, t2.last_order, t2.next_order, t1.total_revenue
from t1 join t2 on t1.CustomerID=t2.CustomerID and t1.order_date=t2.current_order
) tt1
left join
(
select t1.CustomerID, t1.CompanyName, t1.order_date, t2.current_order, t2.last_order, t2.next_order, t1.total_revenue as last_order_revenue
from t1 join t2 on t1.CustomerID=t2.CustomerID and t1.order_date=t2.last_order
) tt2 on tt1.CustomerID=tt2.CustomerID and tt1.current_order=tt2.current_order
left join 
(
select t1.CustomerID, t1.CompanyName, t1.order_date, t2.current_order, t2.last_order, t2.next_order, t1.total_revenue as next_order_revenue
from t1 join t2 on t1.CustomerID=t2.CustomerID and t1.order_date=t2.next_order
) tt3 on tt1.CustomerID=tt3.CustomerID and tt1.current_order=tt3.current_order;


-- 8


with tmp as
(
with t1 as
(
select c.CustomerID, c.CompanyName,date(o.OrderDate) as order_date, sum(od.UnitPrice*od.Quantity*od.Discount) as total_revenue, rank() over(partition by c.CustomerID, c.CompanyName order by sum(od.UnitPrice*od.Quantity*od.Discount)desc) as `rank`
from customers c
left join orders o on c.CustomerID=o.CustomerID
left join orderdetails od on od.OrderID=o.OrderID
group by c.CustomerID, c.CompanyName, o.OrderDate
),
t2 as
(
select c.CustomerID, c.CompanyName, date(o.OrderDate) as current_order,
lead(date(o.OrderDate),1 ) over (partition by c.CustomerID, c.CompanyName order by o.OrderDate desc) as last_order,
lag(date(o.OrderDate),1) over(partition by c.CustomerID, c.CompanyName order by o.OrderDate desc) as next_order
from customers c
left join orders o on c.CustomerID=o.CustomerID
) 
select tt1.CustomerID, tt1.CompanyName, tt1.order_date, tt1.total_revenue, 
tt2.order_date as last_order_date, tt2.last_order_revenue,
tt3.order_date as next_order_date, tt3.next_order_revenue
from 
(
select t1.CustomerID, t1.CompanyName, t1.order_date, t2.current_order, t2.last_order, t2.next_order, t1.total_revenue
from t1 join t2 on t1.CustomerID=t2.CustomerID and t1.order_date=t2.current_order
) tt1
left join
(
select t1.CustomerID, t1.CompanyName, t1.order_date, t2.current_order, t2.last_order, t2.next_order, t1.total_revenue as last_order_revenue
from t1 join t2 on t1.CustomerID=t2.CustomerID and t1.order_date=t2.last_order
) tt2 on tt1.CustomerID=tt2.CustomerID and tt1.current_order=tt2.current_order
left join 
(
select t1.CustomerID, t1.CompanyName, t1.order_date, t2.current_order, t2.last_order, t2.next_order, t1.total_revenue as next_order_revenue
from t1 join t2 on t1.CustomerID=t2.CustomerID and t1.order_date=t2.next_order
) tt3 on tt1.CustomerID=tt3.CustomerID and tt1.current_order=tt3.current_order
)
select ta.repeated_purchased_rate, tb.avg_growth_rate
from
(
select round(count(*)/(select count(distinct CustomerID) from orders),2) as repeated_purchased_rate
from
(
select CustomerID
from orders 
group by CustomerID
having count(OrderID)>1
) t
) ta,
(
select avg((total_revenue-last_order_revenue)/if(last_order_revenue=0 or last_order_revenue is null,total_revenue, last_order_revenue)) as avg_growth_rate
from tmp where total_revenue is not null and last_order_revenue is not null
) tb;


-- --

with tmp as
(
with t1 as
(
select c.CustomerID, c.CompanyName,date(o.OrderDate) as order_date, sum(od.UnitPrice*od.Quantity*od.Discount) as total_revenue, rank() over(partition by c.CustomerID, c.CompanyName order by sum(od.UnitPrice*od.Quantity*od.Discount)desc) as `rank`
from customers c
left join orders o on c.CustomerID=o.CustomerID
left join orderdetails od on od.OrderID=o.OrderID
group by c.CustomerID, c.CompanyName, o.OrderDate
),
t2 as
(
select c.CustomerID, c.CompanyName, date(o.OrderDate) as current_order,
lead(date(o.OrderDate),1 ) over (partition by c.CustomerID, c.CompanyName order by o.OrderDate desc) as last_order,
lag(date(o.OrderDate),1) over(partition by c.CustomerID, c.CompanyName order by o.OrderDate desc) as next_order
from customers c
left join orders o on c.CustomerID=o.CustomerID
) 
select tt1.CustomerID, tt1.CompanyName, tt1.order_date, tt1.total_revenue, 
tt2.order_date as last_order_date, tt2.last_order_revenue,
tt3.order_date as next_order_date, tt3.next_order_revenue
from 
(
select t1.CustomerID, t1.CompanyName, t1.order_date, t2.current_order, t2.last_order, t2.next_order, t1.total_revenue
from t1 join t2 on t1.CustomerID=t2.CustomerID and t1.order_date=t2.current_order
) tt1
left join
(
select t1.CustomerID, t1.CompanyName, t1.order_date, t2.current_order, t2.last_order, t2.next_order, t1.total_revenue as last_order_revenue
from t1 join t2 on t1.CustomerID=t2.CustomerID and t1.order_date=t2.last_order
) tt2 on tt1.CustomerID=tt2.CustomerID and tt1.current_order=tt2.current_order
left join 
(
select t1.CustomerID, t1.CompanyName, t1.order_date, t2.current_order, t2.last_order, t2.next_order, t1.total_revenue as next_order_revenue
from t1 join t2 on t1.CustomerID=t2.CustomerID and t1.order_date=t2.next_order
) tt3 on tt1.CustomerID=tt3.CustomerID and tt1.current_order=tt3.current_order
)
select *,  (total_revenue-last_order_revenue)/if(last_order_revenue=0 or last_order_revenue is null,total_revenue, last_order_revenue)
from tmp;

