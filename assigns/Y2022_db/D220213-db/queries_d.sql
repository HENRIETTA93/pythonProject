-- with clause: 查询

-- which department 销往不同国家的销售总额最多？

with t as
(
select d."Department Name", o."Order Country", sum(oi."Order Item Total") as TotalAmount
from Department d join Store s on s."Department Id"=d."Department Id"
join "Order" o
on o."Store Id"=s."Store Id"
join OrderItem oi on o."Order Id"=oi."Order Id" and o."Store Id"=oi."Store Id"
group by d."Department Name", o."Order Country"
order by TotalAmount desc
)
select * from t limit 1;