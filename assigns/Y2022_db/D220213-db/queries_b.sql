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
