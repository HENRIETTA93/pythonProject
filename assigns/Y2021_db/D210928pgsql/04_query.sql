-------------------------------
-- 4
-------------------------------

select extract(year from order_date) || '-'||extract(month from order_date)||'-01' as year_month, count(order_id) as total_number_orders, sum(freight)::int as total_freight
from orders
where extract(year from order_date) between 1997 and 1998
group by extract(year from order_date) || '-'||extract(month from order_date)||'-01'
having count(order_id)>35
order by total_freight desc;
