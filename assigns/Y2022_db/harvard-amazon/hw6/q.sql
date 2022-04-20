use bike_stores;

select * from products 
where product_name='Trek Farley Alloy Frameset - 2017';
-- where product_name ='Electra Amsterdam Royal 8i Ladies - 2018';

select * from stocks where product_id=32;
select * from stores;

select p.product_id, p.product_name, max(st.quantity)
from products p 
join stocks st on p.product_id=st.product_id
join stores s on s.store_id=st.store_id
group by p.product_id, p.product_name;

select s.store_id, t.*
from stocks s
join
(
select p.product_id, p.product_name, max(st.quantity) as max_quantity
from products p 
join stocks st on p.product_id=st.product_id
group by p.product_id, p.product_name
) t on s.product_id= t.product_id and s.quantity=t.max_quantity;

-- Q1

delimiter //
create function findStoreByProduct(prod_name varchar(255))
returns int deterministic
begin
declare storeid int;
select s.store_id into storeid
from stocks s
join
(
select p.product_id, p.product_name, max(st.quantity) as max_quantity
from products p 
join stocks st on p.product_id=st.product_id
where p.product_name=prod_name
group by p.product_id, p.product_name
) t on s.product_id= t.product_id and s.quantity=t.max_quantity;
return storeid;
end //

delimiter ;

SELECT findStoreByProduct("Trek XM700+ - 2018");


--
select * from orders order by order_id desc limit 2;
select s.store_id into storeid
from stocks s
join
(
select p.product_id, p.product_name, max(st.quantity) as max_quantity
from products p 
join stocks st on p.product_id=st.product_id
where p.product_id=1
group by p.product_id, p.product_name
) t on s.product_id= t.product_id and s.quantity=t.max_quantity;


select * from staffs where store_id=1 and active=1;

select curdate() , adddate(curdate(), interval 7 day);

select * from order_items;

-- create procedure placeOrder(in customerId int, in productId int, in qty int, out order_id int)	

DELIMITER //
CREATE PROCEDURE placeOrder(IN customerId INT, IN productId INT, IN qty INT, OUT createdOrderId INT)
 BEGIN
 /* Declare your variables. */
 declare next_order_id int;
 declare storeId int;
 declare orderStatus int;
 declare staffId int;
 declare listPrice decimal(10,2);
 set orderStatus=1;

 /* Calculate the next order id, since this column is not auto-increment. */
 set next_order_id=(select max(order_id)+1
 from orders);
 set createdOrderId=next_order_id;
 /* Find the store to use for serving this order. */
set storeId=(
select s.store_id
from stocks s
join
(
select p.product_id, p.product_name, max(st.quantity) as max_quantity
from products p 
join stocks st on p.product_id=st.product_id
where p.product_id=productId
group by p.product_id, p.product_name
) t on s.product_id= t.product_id and s.quantity=t.max_quantity
);

 /* Pick any staff member that works in the selected store. */
 set staffId=(
 select staff_id from staffs where store_id=storeId and active=1 limit 1
 );
 /* Create the order row. */
 insert into orders(order_id, customer_id, order_status, order_date, required_date, shipped_date, store_id, staff_id)
 values(next_order_id, customerId, orderStatus, curdate(), adddate(curdate(), interval 7 day), null, storeId, staffId);

 /* Find the price for the product */
 set listPrice=(
 select list_price
 from products where product_id=productId
 );

 /* Create the item row. */
insert into order_items(order_id, item_id, product_id, quantity, list_price, discount)
values(next_order_id, 1, productId, qty, listPrice, 0);
 END //
DELIMITER ;


-- 

select quantity
from stocks 
where store_id=1 and product_id=12;
update stocks set quantity=16 where store_id=1 and product_id=12;

drop procedure placeOrder;

DELIMITER //
CREATE PROCEDURE placeOrder(IN customerId INT, IN productId INT, IN qty INT, IN storeId int, OUT createdOrderId INT)
 BEGIN
 /* Declare your variables. */
 declare next_order_id int;
 declare orderStatus int;
 declare staffId int;
 declare listPrice decimal(10,2);
 declare _quantity int;
 set orderStatus=1;

 /* Calculate the next order id, since this column is not auto-increment. */
 set next_order_id=(select max(order_id)+1
 from orders);
 set createdOrderId=next_order_id;
 
 START TRANSACTION;
 
 set staffId=(
 select staff_id from staffs where store_id=storeId and active=1 limit 1
 );

 insert into orders(order_id, customer_id, order_status, order_date, required_date, shipped_date, store_id, staff_id)
 values(next_order_id, customerId, orderStatus, curdate(), adddate(curdate(), interval 7 day), null, storeId, staffId);


 set listPrice=(
 select list_price
 from products where product_id=productId
 );


insert into order_items(order_id, item_id, product_id, quantity, list_price, discount)
values(next_order_id, 1, productId, qty, listPrice, 0);


 /* verify that the requested store has stock for the requested product and quantity. */
 
set _quantity=(select quantity
from stocks 
where store_id=storeId and product_id=productId
);
 
if _quantity<qty then
rollback;
set createdOrderId=-1;
else 
update stocks set quantity=quantity-qty where store_id=storeId and product_id=productId;
commit;
end if;
END //
DELIMITER ;



-- 
DECLARE EXIT HANDLER FOR SQLEXCEPTION
 BEGIN
 ROLLBACK;
 END;


drop procedure placeOrder;

DELIMITER //
CREATE PROCEDURE placeOrder(IN customerId INT, IN productId INT, IN qty INT, IN storeId int, OUT createdOrderId INT)
 BEGIN
 /* Declare your variables. */
 declare next_order_id int;
 declare orderStatus int;
 declare staffId int;
 declare listPrice decimal(10,2);
 declare _quantity int;
 DECLARE EXIT HANDLER FOR SQLEXCEPTION
 BEGIN
 ROLLBACK;
 set createdOrderId=-1;
 END;
 set orderStatus=1;
 /* Calculate the next order id, since this column is not auto-increment. */
 set next_order_id=(select max(order_id)+1
 from orders);
 set createdOrderId=next_order_id;
 
 START TRANSACTION;
 
 set staffId=(
 select staff_id from staffs where store_id=storeId and active=1 limit 1
 );

 insert into orders(order_id, customer_id, order_status, order_date, required_date, shipped_date, store_id, staff_id)
 values(next_order_id, customerId, orderStatus, curdate(), adddate(curdate(), interval 7 day), null, storeId, staffId);


 set listPrice=(
 select list_price
 from products where product_id=productId
 );


insert into order_items(order_id, item_id, product_id, quantity, list_price, discount)
values(next_order_id, 1, productId, qty, listPrice, 0);


 /* verify that the requested store has stock for the requested product and quantity. */
 
set _quantity=(select quantity
from stocks 
where store_id=storeId and product_id=productId
);
 
if _quantity<qty then
rollback;
set createdOrderId=-1;
else 
update stocks set quantity=quantity-qty where store_id=storeId and product_id=productId;
commit;
end if;
END //
DELIMITER ;


select * from customers where customer_id=1500;

select * from products where product_id=500;

select * from stores where store_id=8;



-- bonus
DELIMITER //
CREATE TRIGGER gpa_update
AFTER UPDATE
 ON enrollments FOR EACH ROW
BEGIN
 DECLARE number_of_classes INT;
 DECLARE current_gpa decimal (2,1);
 select gpa into current_gpa from students where student_id = NEW.student_id;
 select count(*) into number_of_classes from enrollments where student_id = NEW.student_id;
 update students set gpa = (((current_gpa * (number_of_classes-1)) + NEW.grade_received) / 
number_of_classes) where students.student_id = NEW.student_id;
END // 
DELIMITER ;

select * from orders;
ALTER TABLE orders MODIFY store_id INT NULL, MODIFY staff_id INT NULL;

 /* Find the store to use for serving this order. */

 /* Pick any staff member that works in the selected store. */

drop trigger orders_update;

DELIMITER //
CREATE TRIGGER orders_update
AFTER insert
 ON order_items FOR EACH ROW
BEGIN
 DECLARE storeId INT;
 declare staffId int;

select s.store_id into storeId
from stocks s
join
(
select p.product_id, p.product_name, max(st.quantity) as max_quantity
from products p 
join stocks st on p.product_id=st.product_id
where p.product_id=new.product_id
group by p.product_id, p.product_name
) t on s.product_id= t.product_id and s.quantity=t.max_quantity
;

 select staff_id into staffId from staffs where store_id=storeId and active=1 limit 1;
 update orders set store_id=storeId, staff_id=staffId where order_id=NEW.order_id;

END // 
DELIMITER ;


drop procedure placeOrder;
DELIMITER //
CREATE PROCEDURE placeOrder(IN customerId INT, IN productId INT, IN qty INT, OUT createdOrderId INT)
 BEGIN
 /* Declare your variables. */
 declare next_order_id int;
 declare orderStatus int;
 declare listPrice decimal(10,2);
 set orderStatus=1;

 /* Calculate the next order id, since this column is not auto-increment. */
 set next_order_id=(select max(order_id)+1
 from orders);
 set createdOrderId=next_order_id;

 /* Create the order row. */
 insert into orders(order_id, customer_id, order_status, order_date, required_date, shipped_date)
 values(next_order_id, customerId, orderStatus, curdate(), adddate(curdate(), interval 7 day), null);

 /* Find the price for the product */
 set listPrice=(
 select list_price
 from products where product_id=productId
 );

 /* Create the item row. */
insert into order_items(order_id, item_id, product_id, quantity, list_price, discount)
values(next_order_id, 1, productId, qty, listPrice, 0);
 END //
DELIMITER ;

select * from orders order by order_id desc limit 2;
delete from orders where order_id=1619;
CALL placeOrder( 11, 12, 3, @order_id);
CALL placeOrder( 11, 12, 3, @order_id);
-- cs229
-- cs231n
-- cs241
-- cs224n
-- cs226

-- http://cs231n.stanford.edu/

-- http://www.nltk.org/