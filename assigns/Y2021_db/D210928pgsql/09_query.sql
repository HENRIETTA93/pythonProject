-------------------------------
-- 9
-------------------------------

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
