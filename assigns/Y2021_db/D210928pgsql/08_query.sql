-------------------------------
-- 8
-------------------------------

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