mysql> -- First name, Last name and Phone number of customers
mysql>
mysql> select FirstName,LastName,PhoneNumber
    -> from CustomerDetails;
+-----------+----------+--------------+
| FirstName | LastName | PhoneNumber  |
+-----------+----------+--------------+
| Colin     | Chou     | 1312563251   |
| Jay       | Chou     | 13888888888  |
| Judy      | Wang     | 13178945610  |
| Zara      | Jack     | 180123456789 |
| Feng      | Li       | 13741258965  |
| alin      | Li       | 13741258965  |
| Xuanfeng  | Shen     | 13621943038  |
+-----------+----------+--------------+
7 rows in set (0.00 sec)

mysql>
mysql> -- The number of Customers from Tasmania and Queensland states of Australia.
mysql> select State, count(CustomerID)
    -> from CustomerDetails
    -> where State = 'Tas'
    -> or State = 'Qld'
    -> group by State;
+-------+-------------------+
| State | count(CustomerID) |
+-------+-------------------+
| Qld   |                 2 |
+-------+-------------------+
1 row in set (0.00 sec)

mysql>
mysql> -- The Reservation dates range from 25th December to 1st January.
mysql> select *
    -> from Reservations
    -> where Date between '2022-01-01' and '2022-12-25' ;
+---------------+------------+------------+-----------+
| ReservationID | CustomerID | Date       | PartySize |
+---------------+------------+------------+-----------+
|             1 |          2 | 2022-02-25 | 4 persons |
|             2 |          3 | 2022-04-17 | 6 persons |
|             3 |          4 | 2022-05-17 | 2 persons |
|             4 |          5 | 2022-06-01 | 4 persons |
|             5 |     618247 | 2022-03-22 | 4 persons |
+---------------+------------+------------+-----------+
5 rows in set (0.00 sec)

mysql>
mysql> -- The name of the Dishes in the Ascending order.
mysql> select Name
    -> from Dishes
    -> order by Name asc;
+------------+
| Name       |
+------------+
| Bread      |
| Chicken    |
| Pumpkin    |
| Rice       |
| Spicy Food |
+------------+
5 rows in set (0.00 sec)

mysql>
mysql> -- Total number of customers from Tasmania.
mysql> select  count(CustomerID)
    -> from CustomerDetails
    -> where State = 'Tas';
+-------------------+
| count(CustomerID) |
+-------------------+
|                 0 |
+-------------------+
1 row in set (0.00 sec)

mysql>
mysql> -- The price of average, cheapest and most expensive dishes.
mysql> select AVG(Price),MIN(Price),MAX(Price)
    -> from Dishes;
+------------+------------+------------+
| AVG(Price) | MIN(Price) | MAX(Price) |
+------------+------------+------------+
|    20.0000 |         12 |         29 |
+------------+------------+------------+
1 row in set (0.00 sec)

mysql>
mysql> -- Dishes of the customers with FirstName, LastName, DishID and DishName.
mysql>
mysql> select CustomerDetails.FirstName,CustomerDetails.LastName,
    -> CustomersDishes.CustomerID,CustomersDishes.DishID,Dishes.Name
    -> from CustomerDetails
    -> join CustomersDishes on CustomerDetails.CustomerID = CustomersDishes.CustomerID
    -> join Dishes on CustomersDishes.DishID = Dishes.DishID;
+-----------+----------+------------+--------+---------+
| FirstName | LastName | CustomerID | DishID | Name    |
+-----------+----------+------------+--------+---------+
| Colin     | Chou     |          1 |      2 | Rice    |
| Colin     | Chou     |          1 |      3 | Pumpkin |
| Judy      | Wang     |          3 |      3 | Pumpkin |
| Feng      | Li       |          5 |      1 | Chicken |
| Xuanfeng  | Shen     |     618247 |      1 | Chicken |
+-----------+----------+------------+--------+---------+
5 rows in set (0.00 sec)

mysql>
mysql>
mysql>
mysql> -- Update a customer details as my details where CustomerID is 1 and my friends details where customerID is 3.
mysql> update CustomerDetails
    -> set FirstName = 'Xuanfeng',
    ->       LastName = 'Shen',
    ->       Email = 'xshen11@utas.edu.au',
    ->       Address = 'Tas.01 Ring Road',
    ->       City = 'Tasmania',
    ->       State = 'Tas',
    ->       PhoneNumber = '13621943038',
    ->       Birthday = '2001-11-19'
    -> where CustomerID = 1;
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql>
mysql> update CustomerDetails
    -> set
    ->       FirstName = 'Feng',
    ->       LastName = 'Li',
    ->       Email = '66666@gmail.com',
    ->       Address = 'Tas.01 Ring Road',
    ->       City = 'Tasmania',
    ->       State = 'Tas',
    ->       PhoneNumber = '13741258965',
    ->       Birthday = '2002-03-12'
    -> where CustomerID = 3;
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql>
mysql>
mysql> --
mysql> select * from customerdetails;
+------------+-----------+----------+---------------------+-------------------+------------+-------+--------------+------------+---------------+
| CustomerID | FirstName | LastName | Email               | Address           | City       | State | PhoneNumber  | Birthday   | FavouriteDish |
+------------+-----------+----------+---------------------+-------------------+------------+-------+--------------+------------+---------------+
|          1 | Xuanfeng  | Shen     | xshen11@utas.edu.au | Tas.01 Ring Road  | Tasmania   | Tas   | 13621943038  | 2001-11-19 | Chicken       |
|          2 | Jay       | Chou     | jaychou@gmail.com   | Qld.230 Ring Road | Queensland | Qld   | 13888888888  | 2002-01-20 | Rice          |
|          3 | Feng      | Li       | 66666@gmail.com     | Tas.01 Ring Road  | Tasmania   | Tas   | 13741258965  | 2002-03-12 | Pumpkin       |
|          4 | Zara      | Jack     | 1245@gmail.com      | Tas.01 Ring Road  | Tasmania   |  Tas  | 180123456789 | 2001-01-11 | Chicken       |
|          5 | Feng      | Li       | 66666@gmail.com     | Tas.01 Ring Road  | Tasmania   |  Tas  | 13741258965  | 2002-03-12 | Spicy Food    |
|          6 | alin      | Li       | 520@gmail.com       | Tas.01 Ring Road  | Tasmania   |  Tas  | 13741258965  | 2002-03-22 | Spicy Food    |
|     618247 | Xuanfeng  | Shen     | xshen11@utas.edu.au | Tas.01 Ring Road  | Tasmania   |  Tas  | 13621943038  | 2001-11-19 | Bread         |
+------------+-----------+----------+---------------------+-------------------+------------+-------+--------------+------------+---------------+
7 rows in set (0.00 sec)

mysql> select * from customersdishes;
+-------------------+------------+--------+
| CustomersDishesID | CustomerID | DishID |
+-------------------+------------+--------+
|                 1 |          1 |      2 |
|                 2 |          1 |      3 |
|                 3 |          3 |      3 |
|                 4 |          5 |      1 |
|                 5 |     618247 |      1 |
+-------------------+------------+--------+
5 rows in set (0.00 sec)

mysql> select * from dishes;
+--------+------------+-------------+-------+
| DishID | Name       | Description | Price |
+--------+------------+-------------+-------+
|      1 | Chicken    | Chicken     |    29 |
|      2 | Rice       | Rice        |    15 |
|      3 | Pumpkin    | Pumpkin     |    18 |
|      4 | Bread      | Bread       |    12 |
|      5 | Spicy Food | Spicy Food  |    26 |
+--------+------------+-------------+-------+
5 rows in set (0.00 sec)

mysql> select * from events;
+------------------+------------+---------+
| CustomersEventID | CustomerID | EventID |
+------------------+------------+---------+
|                1 |          1 |    1001 |
|                2 |          3 |    1002 |
|                3 |          1 |    1003 |
|                4 |          4 |    1004 |
|                5 |     618247 |    1005 |
+------------------+------------+---------+
5 rows in set (0.00 sec)

mysql> select * from orders;
+---------+------------+------------+
| OrderID | CustomerID | OrderDate  |
+---------+------------+------------+
|       1 |          1 | 2022-03-11 |
|       2 |          3 | 2022-01-22 |
|       3 |          1 | 2022-03-29 |
|       4 |          4 | 2022-04-13 |
|       5 |     618247 | 2022-03-12 |
+---------+------------+------------+
5 rows in set (0.00 sec)

mysql> select * from ordersdish;
+----------------+---------+--------+
| OrdersDishesID | OrderID | DishID |
+----------------+---------+--------+
|              1 |       1 |      1 |
|              2 |       2 |      2 |
|              3 |       2 |      4 |
|              4 |       4 |      3 |
|              5 |       4 |      5 |
+----------------+---------+--------+
5 rows in set (0.00 sec)

mysql> select * from reservations;
+---------------+------------+------------+-----------+
| ReservationID | CustomerID | Date       | PartySize |
+---------------+------------+------------+-----------+
|             1 |          2 | 2022-02-25 | 4 persons |
|             2 |          3 | 2022-04-17 | 6 persons |
|             3 |          4 | 2022-05-17 | 2 persons |
|             4 |          5 | 2022-06-01 | 4 persons |
|             5 |     618247 | 2022-03-22 | 4 persons |
+---------------+------------+------------+-----------+
5 rows in set (0.00 sec)