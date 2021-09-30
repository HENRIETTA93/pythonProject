
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

select p.product_name, round(p.unit_price::numeric,2) as current_price,
round(od.unit_price::numeric,2) as previous_unit_price,
round((p.unit_price-od.unit_price)::numeric/(od.unit_price::numeric)*100,2) as percent_increase
from products p join order_details od on p.product_id=od.product_id
order by percent_increase;



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


-- 7
-- select c.category_name,s.region as supplier_region, sum(unit_in_stock) as units_in_stock,
-- sum(unit_on_order) as units_on_order, reorder_level
-- from categories c join products p on c.category_id=p.category_id
-- join suppliers s on s.supplier_id=p.supplier_id
-- where s.region in ('America','Europe','Asia-Pacific')
-- group by c.category_name, s.region, reorder_level
-- order by c.category_name, supplier_region, reorder_level;

create table country_region(
country varchar(20) primary key,
region varchar(20)
);

insert into country_region values
('UK','Europe'),
('USA','America'),
('Japan','Asia-Pacific'),
('Australia','Asia-Pacific'),
('Sweden','Europe'),
('Brazil','America'),
('Germany','Europe'),
('Italy','Europe'),
('Norway','Europe'),
('France','Europe'),
('Singapore','Asia-Pacific'),
('Denmark','Europe'),
('Netherlands','Europe'),
('Finland','Europe'),
('Canada','America');



select c.category_name,s.country as supplier_region, sum(unit_in_stock) as units_in_stock,
sum(unit_on_order) as units_on_order, reorder_level
from categories c join products p on c.category_id=p.category_id
join suppliers s on s.supplier_id=p.supplier_id
join country_region cr on s.country=cr.country
where cr.region in ('America','Europe','Asia-Pacific')
group by c.category_name, s.country, reorder_level
order by c.category_name, supplier_region, reorder_level;

-- 8
select t1.category_name, t1.product_name, t1.unit_price, t2.average_unit_price, t2.median_unit_price,
case when t1.unit_price<t2.average_unit_price then 'Below Average'
when t1.unit_price=t2.average_unit_price then 'Equal Average' else 'Over Average' end as average_unit_price_position,
case when t1.unit_price<t2.median_unit_price then 'Below Median'
when t1.unit_price=t2.median_unit_price then 'Equal Median' else 'Over Median' end as median_unit_price_position
from
(
select c.category_name,p.product_name,p.unit_price
from categories c join products p on c.category_id=p.category_id
where p.discontinued=0
) t1
join
(
select c.category_name,round(avg(unit_price)::numeric,2) as average_unit_price,
round(percentile_disc(0.5) within group (order by unit_price)::numeric,2) as median_unit_price
from categories c join products p on c.category_id=p.category_id
group by c.category_name
) t2 on t1.category_name=t2.category_name
order by t1.category_name, t1.product_name;


-- 9
select e.first_name|| ' '||e.last_name as employee_full_name, e.title as employee_title,
round(sum(od.quantity*od.unit_price)::numeric,2) as  total_sales_amount_excluding_discount,
count(o.order_id) as total_number_unique_orders,
count(od.product_id) as total_number_products,
round(avg(od.unit_price)::numeric,2) as average_product_amount,
round(avg(od.quantity*od.unit_price)::numeric,2) as  average_order_amount,
round(sum(od.quantity*od.unit_price*od.discount)::numeric,2) as total_discount_amount,
round(sum(od.quantity*od.unit_price*(1-od.discount))::numeric,2) as  total_sales_amount_including_discount,
round((sum(od.quantity*od.unit_price*od.discount)::numeric)/ (sum(od.quantity*od.unit_price)::numeric)*100,2) as total_discount_percentage
from employees e join orders o on e.employee_id=o.employee_id
join order_details od on od.order_id=o.order_id
group by e.first_name|| ' '||e.last_name, e.title
order by round(sum(od.quantity*od.unit_price*(1-od.discount))::numeric,2) desc;


-- 10
select c.category_name, e.first_name|| ' '||e.last_name as employee_full_name,
round(sum(od.unit_price*(1-od.discount)*od.quantity)::numeric,2) as total_sale_amount
from categories c join products p on c.category_id=p.category_id
join order_details od on od.product_id=p.product_id
join orders o on o.order_id=od.order_id
join employees e on e.employee_id=o.employee_id
group by c.category_name,
 e.first_name|| ' '||e.last_name
order by c.category_name, total_sale_amount desc;


percentile_disc()

select tt1.category_name, tt1.employee_full_name, tt1.total_sale_amount, tt1.percent_of_employee_sales,
tt2.percent_of_category_sales
from
(
select t.category_name, t.employee_full_name, t.total_sale_amount, round(t.total_sale_amount/t1.total_sale_amount*100::numeric,2) as percent_of_employee_sales
from
(
select c.category_name, e.first_name|| ' '||e.last_name as employee_full_name,
round(sum(od.unit_price*(1-od.discount)*od.quantity)::numeric,2) as total_sale_amount
from categories c join products p on c.category_id=p.category_id
join order_details od on od.product_id=p.product_id
join orders o on o.order_id=od.order_id
join employees e on e.employee_id=o.employee_id
group by c.category_name,
 e.first_name|| ' '||e.last_name
) t
join
(
select  e.first_name|| ' '||e.last_name as employee_full_name,
round(sum(od.unit_price*(1-od.discount)*od.quantity)::numeric,2) as total_sale_amount
from categories c join products p on c.category_id=p.category_id
join order_details od on od.product_id=p.product_id
join orders o on o.order_id=od.order_id
join employees e on e.employee_id=o.employee_id
group by e.first_name|| ' '||e.last_name
) t1 on t.employee_full_name=t1.employee_full_name
) tt1,
(
select t.category_name, t.employee_full_name, t.total_sale_amount, round(t.total_sale_amount/t1.total_sale_amount*100::numeric,2) as percent_of_category_sales
from
(
select c.category_name, e.first_name|| ' '||e.last_name as employee_full_name,
round(sum(od.unit_price*(1-od.discount)*od.quantity)::numeric,2) as total_sale_amount
from categories c join products p on c.category_id=p.category_id
join order_details od on od.product_id=p.product_id
join orders o on o.order_id=od.order_id
join employees e on e.employee_id=o.employee_id
group by c.category_name,
 e.first_name|| ' '||e.last_name
) t join
(
select c.category_name,
round(sum(od.unit_price*(1-od.discount)*od.quantity)::numeric,2) as total_sale_amount
from categories c join products p on c.category_id=p.category_id
join order_details od on od.product_id=p.product_id
join orders o on o.order_id=od.order_id
join employees e on e.employee_id=o.employee_id
group by c.category_name
) t1 on t.category_name=t1.category_name
) tt2 where tt1.category_name=tt2.category_name and tt1.employee_full_name=tt2.employee_full_name
order by tt1.category_name, tt1.total_sale_amount desc;
