-- 设计思路
设计产品实体（数据通过excel中的得到），产品类型实体，其中一个categroy可以包含多个product
设计供应商supplier实体，一个supplier可以供应多种Product
设计零售商实体、分销商实体

设计订单实体，用来描述供应商给平台供货。
Order Product 实体，用来描述每个订单包含的Product信息
当收到订单后，将产品入 warehouse。
warehouse实体记录平台的仓库信息。
设计入库实体 warehouse_stock，其中warehouse_id references warehouse实体。
入库实体需记录入库时间。

设计supply_retail 实体和supply_distributor 实体，记录平台给零售商和分销商的供货信息。记录发货时间，完成时间以及实际收到货时间。



--
-- 准时发货：准时到达客户的发货是仓库成功的关键指标。它本身很重要，因为它反映了仓库是否正确地完成了工作。然而，延迟发货也会在业务的其他方面造成隐藏成本和困难。他们会引起客户服务电话和投诉。它们会导致包裹跟踪和其他时间浪费。最终，延迟发货可能会损害您的品牌并导致客户缺陷。
--
-- 接收效率：假设工作日为 8 小时，一周内每小时接收的供应商订单数量
--
-- 供应商准时收货：按准时要求从供应商处收到的订单的百分比。
--
-- 每小时上架的行数：在八小时工作日内每小时上架的订单数量。
--
-- 使用的平均仓库容量：现有数量大于零的库存存储位置的数量除以库存存储位置的总数。
--
-- 按地点的库存盘点准确性：每个地点的库存盘点是否准确？这是另一个比看起来更重要的隐身问题。如果垃圾箱中的物品少于系统所说的应有数量，则可能表示被盗或未报告的损坏。库存计算错误的结果包括不可预见的缺货和对客户态度不利的履行问题。
--
-- 每行填充率：填充数量计算为完成后各个装运行项目与原始请求装运指令行项目数量之间的差异。然后将差额除以请求的数量，并在定义的基准测试期内对所有订单进行汇总。
--
-- 如果您在生成结果时遇到问题，请检查每个查询的语法。在编写与运营活动相关的查询时，您可能会发现您的数据库设计需要改进（即，可能需要更多表或更改表）。如果不需要更改，请完成编写和执行查询。


-- Receiving efficiency: Number of supplier orders received per hour over the course of a week assuming 8-hour workdays
-- 接收效率：假设工作日为 8 小时，一周内每小时接收的供应商订单数量
-- Q: 查询2022年5月份每个工作日内每小时接收的供应商订单接收效率,display：日期，每天的接收效率
select DateName(day,DeliveryTo_Date) as workday,
convert(decimal(4,2), count(Order_ID)/(8*1.0)) as  [Receiving efficiency]
from Orders
where DateName(month,GetDate()) =5 and DateName(year,GetDate())=2022
group by DateName(day,DeliveryTo_Date);

-- On-time receipts from suppliers: The percent of orders received from a supplier per on-time requirements.
-- 供应商准时收货：按准时要求从供应商处收到的订单的百分比。
-- Q: 查询从每个供应商处收到的订单数（分别展示按时收到的订单数，订单总数） 以及按准时要求从供应商处收到的订单的百分比
select s.Supplier_Name,
sum(case when o.Finish_Date<=o.DeliveryTo_Date then 1 else 0 end) as [On-time receipts],
count(o.Order_ID) as [Total receipts],
convert(decimal(4,2),sum(case when o.Finish_Date<=o.DeliveryTo_Date then 1 else 0 end)*1.0/count(o.Order_ID)) as [On-time receipts frequency]
from Orders o
join Order_Product op on o.Order_ID=op.Order_ID
join Product p on p.Product_ID=op.Product_ID
join Supplier s on s.Supplier_Name=p.Supplier_Name
group by s.Supplier_Name;

-- Lines put away per hour: The number of orders put away per hour during an eight-hour working day.
-- 每小时上架的行数：在八小时工作日内每小时上架的订单数量。
-- Q: 查询每天从供应商收到的订单并入库上架的数量，以及每小时平均上架的订单数量

select DateName(day,Stock_Date) as workday,
count(Order_ID) as Total_Stock,
convert(decimal(4,2), count(Order_ID)/(8*1.0)) as  [Lines put away per hour]
from Warehouse_Stock
group by DateName(day,Stock_Date);

-- Average warehouse capacity used: The number of inventory storage locations with an on-hand quantity greater than zero, is divided by the total number of inventory storage locations.
-- Q: 查询每个仓库的平均使用率

select w.Warehouse_ID,
convert(decimal(4,2), sum(ws.Stock)*1.0/w.Capacity) as [Average warehouse capacity used]
from Warehouse_Stock ws
join Warehouse w on ws.Warehouse_ID=w.Warehouse_ID
group by w.Warehouse_ID, w.Capacity;


-- On-time Shipments: Shipments reaching customers on time is a critical success metric for warehouses.
-- It’s important on its own because it reflects if the warehouse doing its job right. However, late shipments
-- also create hidden costs and difficulties elsewhere in the business. They cause customer service calls and complaints.
-- They cause package tracking and other wastes of time. Ultimately, late shipments can damage your brand and cause customers to defect.

-- Q: 查询仓库发送给零售商和分销商的的准时收货率

select rs.Retail_Stockist as RetailsOrDistributors,
sum(case when sr.Finish_Date<=sr.DeliveryTo_Date then 1 else 0 end) as [On-time shipments],
convert(decimal(4,2),sum(case when sr.Finish_Date<=sr.DeliveryTo_Date then 1 else 0 end)*1.0/count(sr.Supply_ID)) as [On-time shipments frequency]
from Warehouse_Stock ws
join Supply_Retails sr on ws.Warehouse_ID=sr.Warehouse_ID and ws.Product_ID=sr.Product_ID
join Retail_Stockist rs on rs.Retail_ID=sr.Retail_ID
group by rs.Retail_Stockist
union
select d.Distributor_Name as RetailsOrDistributors,
sum(case when sd.Finish_Date<=sd.DeliveryTo_Date then 1 else 0 end) as [On-time shipments],
convert(decimal(4,2),sum(case when sd.Finish_Date<=sd.DeliveryTo_Date then 1 else 0 end)*1.0/count(sd.Supply_ID)) as [On-time shipments frequency]
from Warehouse_Stock ws
join Supply_Distributors sd on ws.Warehouse_ID=sd.Warehouse_ID and ws.Product_ID=sd.Product_ID
join Distributors d on sd.Distributor_Name=d.Distributor_Name
group by d.Distributor_Name;
