
/*

 Question 2: SQL Scripts
• Based on data modelling from Question 1, create 3 queries that have the
following requirements. Note that each of the query can cover one or more of
the requirements.
o One of the 3 queries should have a calculation.
o One of the 3 queries should make use of Group By.
o One of the 3 queries should include a scalar function (one that returns
a value).
o One of the 3 queries should demonstrate Nested Query (could be
either standard or correlated sub-query).
o One of the 3 queries should demonstrate joining tables.
o One of the 3 queries should demonstrate the creation and testing of
Trigger with test data.
• For each query,
o Explain and justify its business purpose and business value or impact.
o Provide the SQL script.
o Explain the design of SQL script.
o Make use of a table(s) with sample data to show the potential result/
outcome of the query.

 */

 -- 1
/*
 query every year, the total sales of the company
 using calculation, group by, scalar function, joining tables
 */
select year(o.orderDate) as orderYear, sum(p.price*oi.qty) as totalSales
from orders o join order_items oi on o.orderID = oi.orderID
join product p on oi.productID = p.productID
group by year(o.orderDate);

-- 2
/*
 find all the customers who has paid for the highest amount for buying the products of the company in 2021 october
 using nested query, joining tables, group by, scalar function, calculation
 */
select c.custID, c.firstName, c.lastName
from customer c join orders o on c.custID = o.custID
join order_items oi on o.orderID = oi.orderID
join product p on oi.productID = p.productID
where year(o.orderDate)=2021 and month(o.orderDate)=10
group by c.custID, c.firstName, c.lastName
having sum(p.price*oi.qty)=
(
select sum(p.price*oi.qty) as maxPaid
from customer c join orders o on c.custID = o.custID
join order_items oi on o.orderID = oi.orderID
join product p on oi.productID = p.productID
where year(o.orderDate)=2021 and month(o.orderDate)=10
group by c.custID
order by sum(p.price*oi.qty) desc
limit 1);

-- 3
/*
trigger
when an order has been made, the invoice will be triggered to generate.
 */

delimiter ||
create trigger trg_invoice after insert on orders for each row
    begin
    declare v_emp char(10);
    declare v_invoice_date date;
    declare v_orderId varchar(20);
    declare v_invoiceId varchar(20);
    set v_emp=new.empID;
    set v_invoice_date=new.orderDate;
    set v_orderId=new.orderID;
    set v_invoiceId=concat('IN',new.orderID);
    insert into invoice values(v_invoiceId, v_orderId, v_invoice_date, v_emp);
    end ||
delimiter ;

INSERT INTO `orders` VALUES ('o11', 'cust1', 'emp2', '2021-11-01');
/*
 test script
 */
select * from invoice;