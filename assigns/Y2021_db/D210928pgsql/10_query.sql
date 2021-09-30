-------------------------------
-- 10
-------------------------------

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