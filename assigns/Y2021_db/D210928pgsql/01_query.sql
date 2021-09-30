-------------------------------
-- 1
-------------------------------

select product_name, unit_price
from products
where unit_price between 20 and 50
order by unit_price desc;