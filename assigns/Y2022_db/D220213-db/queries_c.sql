

-- 查询购买客户是'Home Office'或者'Corporate' 的销往亚太地区的产品名称,将产品名称按照字母顺序排列

select distinct p."Product Name" as ProductName
from Customer c join "Order" o on o."Order Customer Id"=c."Customer Id"
join OrderItem oi on o."Order Id"=oi."Order Id" and o."Store Id"=oi."Store Id"
join Product p on p."Product Card Id"=oi."Order Item Cardprod Id"
where c."Customer Segment"='Home Office' and o.Market like '%Pacific Asia%'
union
select distinct p."Product Name"as ProductName
from Customer c join "Order" o on o."Order Customer Id"=c."Customer Id"
join OrderItem oi on o."Order Id"=oi."Order Id" and o."Store Id"=oi."Store Id"
join Product p on p."Product Card Id"=oi."Order Item Cardprod Id"
where c."Customer Segment"='Corporate' and o.Market like '%Pacific Asia%'
order by ProductName;


-- 创建视图 -- query 所有普通客户的订单信息，包含客户first name, last name, 客户所在国家、城市，下订单日期，订单delivery 日期，订单购买的product 数量， 订单总金额

create view customer_orders_view
as
select c."Customer Fname", c."Customer Lname", c."Customer Country", c."Customer City",
o."order date (DateOrders)", o."Shipping date (DateOrders)",
sum(oi."Order Item Quantity") as TotalItemQuantity,
sum(oi."Order Item Total") as TotalOrderAmount
from Customer c
join "Order" o on c."Customer Id"=o."Order Customer Id"
join OrderItem oi on o."Order Id"=oi."Order Id" and o."Store Id"=oi."Store Id"
where c."Customer Segment"='Consumer'
group by
c."Customer Fname", c."Customer Lname", c."Customer Country", c."Customer City",
o."order date (DateOrders)", o."Shipping date (DateOrders)";

select * from customer_orders_view;
