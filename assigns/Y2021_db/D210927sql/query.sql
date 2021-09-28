# 1. Output the number of customers of all Regions, display the region name, and the number of customers of the region.

SELECT Region.RegionName, COUNT(Customer.CustID) as CustNumber
FROM Region JOIN USState ON USSTate.RegionID=RegionID
JOIN Customer ON Customer.CustState=USState.StateID
GROUP BY Region.RegionName;

/*
this query can help the company to know the number of customers in different regions, it can help them to make right decision to sell their products and make more profit.
*/

# 2. Output the best sell of the model in 2021-09. display the model name, sold total quantity, and total sold price, and sort the total quantity in desc order.

SELECT Model.ModelName, SUM(Qty) as TotalQuantity, SUM(ModelPrice*Qty) as TotalPrice
FROM SaleOrder JOIN OrderLine ON SaleOrder.SOID=OrderLine.SOID
JOIN Model ON OrderLine.ModelID=Model.ModelID
WHERE SODate BETWEEN '2021-09-01' AND '2021-09-30'
GROUP BY Model.ModelName
ORDER BY TotalQuantity DESC;

/*
from the query above, it will help the company decision makers to learn about the model sells.
it can easily and clearly know which model has the best sell.
*/