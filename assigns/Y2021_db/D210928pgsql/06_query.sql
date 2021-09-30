-------------------------------
-- 6
-------------------------------

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