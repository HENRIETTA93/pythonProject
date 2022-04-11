use bike_stores;
select * from customers;
select * from orders;
select * from stores;
select * from staffs;

-- Create a SELECT statement that lists the first_name, last_name and email of any customer that has placed an order between March 1, 2018 and March 10, 2018 inclusive. 
-- Sort the results by first_name and last_name in ascending order.

SELECT 
    first_name, last_name, email
FROM
    customers
        JOIN
    orders ON orders.customer_id = customers.customer_id
WHERE
    order_date >= '2018-03-01'
        AND order_date <= '2018-03-10'
ORDER BY first_name , last_name ASC;

-- Obtain the list of orders placed in California between March 1, 2018 and March 10, 2018 inclusive, and the orders placed in New York 
-- between March 11, 2018 and March 15, 2018 inclusive. List the first_name, last_name and email of the user, along with the id and date 
-- of the order and the store name and state.

select customers.first_name, customers.last_name, customers.email, order_id, order_date, store_name, t.state
from 
(
select orders.*, stores.store_name, stores.state
from orders 
join stores on stores.store_id=orders.store_id
where stores.state='CA' and orders.order_date between '2018-03-01' and '2018-03-10'
union
select orders.*,stores.store_name, stores.state
from orders 
join stores on stores.store_id=orders.store_id
where stores.state='NY' and orders.order_date between '2018-03-11' and '2018-03-15'
) t
join customers 
on t.customer_id = customers.customer_id;

-- In preparation for an upcoming grand opening event for a new BikeStores location, the marketing team has tasked you with putting together a SINGLE list of all customers and employees. The list should contain the following: id, person’s full name, last_name, first_name, email, phone number, and a flag designating if the person is a customer (flag = ‘Y’ or ‘N’). Additionally, the list should be ordered in ascending order by person last_name. (Hint: Ensure that you only include active employees)
-- The report headers should be labeled as such:
-- ●	person_id
-- ●	person_full_name
-- ●	person_last_name
-- ●	person_first_name
-- ●	person_email
-- ●	person_phone_no
-- ●	person_is_customer
SELECT 
    staff_id AS person_id,
    CONCAT(first_name, ' ', last_name) AS person_full_name,
    last_name AS person_last_name,
    first_name AS person_first_name,
    email AS person_email,
    phone AS person_phone_no,
    'N' AS person_is_customer
FROM
    staffs
WHERE
    active = 1 
UNION SELECT 
    customer_id AS person_id,
    CONCAT(first_name, ' ', last_name) AS person_full_name,
    last_name AS person_last_name,
    first_name AS person_first_name,
    email AS person_email,
    phone AS person_phone_no,
    'Y' AS person_is_customer
FROM
    customers
ORDER BY person_last_name;

SELECT 
    customer_id,
    first_name,
    last_name,
    IFNULL(phone, 'not on file') AS phone,
    email
FROM
    customers
ORDER BY customer_id
LIMIT 5;

SELECT 
    s1.first_name,
    s1.last_name,
    s1.store_id,
    s1.email,
    s1.phone,
    COUNT(s2.staff_id) AS num_active_staffs
FROM
    staffs s1
        JOIN
    staffs s2 ON s1.staff_id = s2.manager_id
GROUP BY s1.first_name , s1.last_name , s1.store_id , s1.email , s1.phone;