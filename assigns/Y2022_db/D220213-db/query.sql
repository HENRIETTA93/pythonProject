-- 查询每个category 有分别有多少Product 被售卖（显示Customers更关注哪种产品）, display category 名称，产品数量，一个产品id 仅被计算一次， 并将结果由大到小排列。
select c."Category Name", count(distinct p."Product Card Id") as ProductNum
from Category c
join Product p on c."Category Id"=p."Product Category Id"
group by c."Category Name"
order by ProductNum desc;


-- 查询不同地区的客户购买产品总金额，按照产品金额降序排列

select c."Customer State", sum(oi."Order Item Total") as TotalAmount
from Customer c
join "Order" o on c."Customer Id"=o."Order Customer Id"
join OrderItem oi on o."Order Id"=oi."Order Id" and o."Store Id"=oi."Store Id"
group by c."Customer State"
order by TotalAmount desc;



-- 查询Order is delivered to 哪些Market的数量？即query 所有Market的Order的数量

select o.Market, count(o."Order Id") as OrderCount
from "Order" o
group by o.Market
order by OrderCount desc;

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