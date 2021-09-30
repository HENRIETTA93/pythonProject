-------------------------------
-- 7
-------------------------------

select c.category_name,s.country as supplier_region, sum(unit_in_stock) as units_in_stock,
sum(unit_on_order) as units_on_order, reorder_level
from categories c join products p on c.category_id=p.category_id
join suppliers s on s.supplier_id=p.supplier_id
join country_region cr on s.country=cr.country
where cr.region in ('America','Europe','Asia-Pacific')
group by c.category_name, s.country, reorder_level
order by c.category_name, supplier_region, reorder_level;