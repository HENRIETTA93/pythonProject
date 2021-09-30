-------------------------------
-- 5
-------------------------------

select p.product_name, round(p.unit_price::numeric,2) as current_price,
round(od.unit_price::numeric,2) as previous_unit_price,
round((p.unit_price-od.unit_price)::numeric/(od.unit_price::numeric)*100,2) as percent_increase
from products p join order_details od on p.product_id=od.product_id
order by percent_increase;