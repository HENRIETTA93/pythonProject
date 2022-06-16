
select a.Suburb, count(o.ID) as order_count
from Address a join Orders o on o.AddressID=a.AddressID
group by a.Suburb
order by a.Suburb;


select a.Suburb, count(o.ID) as orderCount
from Orders o inner join  Address a on o.AddressID=a.AddressID
group by a.Suburb
order by a.Suburb;


--2b
select p.Name, sum(pp.price*l.Qty) as total_sale_amount
from Produce p
join ProducePrice pp on pp.PLU=p.PLU
join LineItem l on pp.PLU=l.PLU and pp.priceListNum=l.priceListNum
group by p.Name;


--2b
select p.Name, sum(t.Price*Qty) as totalSaleAmount
from LineItem l inner join Produce p on p.PLU=l.PLU
inner join ProducePrice t on t.PLU=l.PLU and t.priceListNum=l.priceListNum
group by p.Name;


--2c

select monthname(o.OrderDate) as monthName, year(o.OrderDate) as year, concat('$',sum(pp.Price*l.Qty)) as
total_amount
from Orders o join LineItem l on o.ID=l.OrderID
join Clients c on c.ClientID=o.ClientID
join ProducePrice pp on  pp.PLU=l.PLU and pp.priceListNum=l.priceListNum
where c.ABN is null and c.TradingName is null
group by monthname(o.OrderDate), year(o.OrderDate)
having sum(pp.Price*l.Qty)<10000;


--2c

select monthname(o.OrderDate) as month, year(o.OrderDate) as year, concat('$',sum(p.Price*Qty)) as
totalAmount
from LineItem l inner join Orders o on o.ID=l.OrderID
inner join ProducePrice t on  t.PLU=l.PLU and t.priceListNum=l.PriceListNum
inner join Clients c on c.ClientID=o.ClientID
where c.ABN is null and c.TradingName is null
group by monthname(o.OrderDate), year(o.OrderDate)
having sum(t.Price*l.Qty)<10000;

-- 2d
select t1.client_name, t1.retail_cost, t2.trade_cost, t1.retail_cost+t2.trade_cost as total_cost
from
(
select concat(c.FirstName, c.LastName) as client_name, sum(p.Price*l.Qty) as retail_cost
from Clients c join Orders o on c.ClientID=o.ClientID
join LineItem l on o.ID=l.OrderID
join ProducePrice p on p.PLU=l.PLU and p.PriceListNum=l.PriceListNum
where c.ABN is null and c.TradingName is null
group by concat(c.FirstName, c.LastName)
) t1,
(
select concat(c.FirstName, c.LastName) as client_name, sum(p.Price*l.Qty) as trade_cost
from Clients c join Orders o on c.ClientID=o.ClientID
join LineItem l on o.ID=l.OrderID
join ProducePrice p on p.PLU=l.PLU and p.PriceListNum=l.PriceListNum
where c.ABN is not null and c.TradingName is not null
group by concat(c.FirstName, c.LastName)
) t2 where t1.client_name=t2.client_name;


select t1.client_name, t1.retail_cost, t2.trade_cost, t1.retail_cost+t2.trade_cost as total_cost
from
(
select concat(c.FirstName, c.LastName) as client_name, sum(p.Price*l.Qty) as trade_cost
from Clients c inner join Orders o on c.ClientID=o.ClientID
inner join LineItem l on o.ID=l.OrderID
inner join ProducePrice p on p.PLU=l.PLU and p.PriceListNum=l.PriceListNum
where c.ABN is not null and c.TradingName is not null
group by concat(c.FirstName, c.LastName)
) t1
inner join
(

select concat(c.FirstName, c.LastName) as client_name, sum(p.Price*l.Qty) as retail_cost
from Clients c inner join Orders o on c.ClientID=o.ClientID
inner join LineItem l on o.ID=l.OrderID
inner join ProducePrice p on p.PLU=l.PLU and p.PriceListNum=l.PriceListNum
where c.ABN is null and c.TradingName is null
group by concat(c.FirstName, c.LastName)
) t2 on t1.client_name=t2.client_name;




-- 2e
insert into Produce values(5802,'Fitzroy', 'ea','St David Dairy Full Cream Milk 2L',null),
(5801,'Fitzroy', 'ea','St David Dairy Full Crem Milk 1L',null),
(5902,'Fitzroy', 'ea','St David Dairy Low Fat Milk 1L',null),
(5901,'Fitzroy', 'ea','St David Dairy Low Fat Milk 1L',null);

insert into ProducePrice
values
(5802, 1, 6.49, '2021-11-05', null),
(5801, 1, 3.25, '2021-11-05', null),
(5902, 1, 6.40, '2021-11-05', null),
(5901, 1, 3.25, '2021-11-05', null);


Vaccination (registeredNurse, nurseName, venue, address, (batch, vaccineName, patientID, gender, date)
batch, registeredNurse, patientID is the candidate key for this relation.
The following functional dependencies hold
registeredNurse nurseName
venue address
batch vaccineName
patientID gender
Q3. Please convert the non-normalised Vaccination relation into 3rd normal form (3NF). Please identify the intermediate steps (1NF, 2NF) .

vaccination is in 1NF for there's no 重复的 tuples

for there are partial dependencies:
registeredNurse->nurseName
batch->vaccineName
patientID->gender

消除部分函数依赖：得到 2nf
nurse (registeredNurse, nurseName）
batch(batch,vaccineName)
patient(patientID, gender)
vaccination(registeredNurse, venue, address, batch,patientID, date)

for there are 传递函数依赖：

registeredNurse->venue
venue->address
so remove 传递函数依赖,  get 3nf

nurse (registeredNurse, nurseName）
batch(batch,vaccineName)
patient(patientID, gender)
venue(venue, address)
vaccination(registeredNurse, venue,  batch,patientID, date)

-- 7a
不可以 可以从html的<ol>标签下的<li> the Searcher中找到 "Red River" ;
但在<h3>标签下的The Directors 无法找到 "Red River"


-- 7c
ol 是有序的 ul 是无序的

-- 7d
web， app， bussiness logic，  db

-- 9a
Horizontal partitioning
• Table rows distributed across sites
因为不同的国家地区存储的数据的结构均一致，但是数据有所不通，所以使用垂直分布的方式

-- 9b
需要更大的存储空间
数据量非常大时造成的数据更新、查询性能瓶颈
communication成本很高

-- 10a
数据的结构不是固定的，可能随着时间变化；
另外，即使数据结构一致，数据量非常大，导致关系数据库如mysql、oralce 的读写性能可能变得很低
