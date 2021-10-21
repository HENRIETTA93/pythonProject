-- select queries

-- 1 SELECTION condition query
-- query all custom-made extras of tshirts which material is cotton.

select ExtrasMaterial,ExtrasFont,ExtrasColour, ExtrasText
from Extras
where  ExtrasMaterial='Cotton';

-- 2 GROUP BY query
-- query all custom-made tshirts, which tshirt material and extral material has beed ordered and its number.
select t.Material, e.ExtrasMaterial, count(t.TShirtID) as custom_made_tshirtNumbers
from TShirt t left join Extras e on t.ExtrasID=e.ExtrasID
group by t.Material, e.ExtrasMaterial;


-- 3 JOIN query
-- query all customers and they made custom tshirts number and total amount.
select c.FirstName, c.LastName, count(o.OrderID) as orderNumber, sum(ot.Quantity*t.Price) as totalAmount
from Orders o join OrderShirts ot on o.OrderID=ot.OrderID
join Customer c on o.CustomerID=c.CustomerID
join TShirt t on ot.TShirtID=t.TShirtID
group by c.FirstName, c.LastName;

-- 4 NESTED query
-- query which customer has not made any custom-made Tshirts, display all information of the customers.
select c.*
from Customer c
where c.CustomerID not in
(
select distinct CustomerID
from Orders
);
