
-- 1
select product_name, unit_price
from products
where unit_price between 20 and 50
order by unit_price desc;


-- 2
select ship_country, round(avg(date_part('day', cast(shipped_date as TIMESTAMP)-cast(order_date as TIMESTAMP)))::numeric,2) as average_days_between_order_shipping,
count(*) as  total_number_orders
from orders
where extract(year from order_date)=1998
group by ship_country
having
round(avg(date_part('day', cast(shipped_date as TIMESTAMP)-cast(order_date as TIMESTAMP)))::numeric,2)>=5
and count(*)>10
order by ship_country;


-- 3
select e1.first_name || ' '|| e1.last_name as employee_full_name, e1.title as employee_title,
extract(year from e1.hire_date)-extract(year from e1.birth_date) as employee_age,
e2.first_name || ' '||e2.last_name as manager_full_name,
e2.title as manager_title
from employees e1 left join employees e2
on e1.reports_to=e2.employee_id
order by employee_age, employee_full_name;


-- 4
select extract(year from order_date) || '-'||extract(month from order_date)||'-01' as year_month, count(order_id) as total_number_orders, sum(freight)::int as total_freight
from orders
where extract(year from order_date) between 1997 and 1998
group by extract(year from order_date) || '-'||extract(month from order_date)||'-01'
having count(order_id)>35
order by total_freight desc;


-- 5

select * from  products;



-- 6
select c.category_name,
case when p.unit_price<20 then '1. Less than $20'
when p.unit_price between 20 and 50 then '2. $20-$50'
else '3. Over $50' end as price_range,
sum(od.unit_price*(1-od.discount)*od.quantity)::int as total_amount,
count(o.order_id) as total_number_orders
from categories c join products p on c.category_id=p.category_id
join order_details od on od.product_id=p.product_id
join orders o on o.order_id=od.order_id
group by
c.category_name,
case when p.unit_price<20 then '1. Less than $20'
when p.unit_price between 20 and 50 then '2. $20-$50'
else '3. Over $50' end
order by c.category_name, price_range;