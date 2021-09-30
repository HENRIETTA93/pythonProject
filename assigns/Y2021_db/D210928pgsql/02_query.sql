-------------------------------
-- 2
-------------------------------
select ship_country, round(avg(date_part('day', cast(shipped_date as TIMESTAMP)-cast(order_date as TIMESTAMP)))::numeric,2) as average_days_between_order_shipping,
count(*) as  total_number_orders
from orders
where extract(year from order_date)=1998
group by ship_country
having
round(avg(date_part('day', cast(shipped_date as TIMESTAMP)-cast(order_date as TIMESTAMP)))::numeric,2)>=5
and count(*)>10
order by ship_country;
