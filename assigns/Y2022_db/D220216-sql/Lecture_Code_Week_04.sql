--upper function
SELECT upper('apple');

--lower function
SELECT lower('APPLE')

--length of string
SELECT length('apple')

--substr function
SELECT substr('apple', 2, 2);
SELECT substr('apple', 2);

--position function
SELECT position('l' IN 'apple');

SELECT split_part('name@china.com.cn', '@', 1)
     , split_part(split_part('name@china.com.cn', '@', 2), '.', 1)
     , split_part(split_part('name@china.com.cn', '@', 2), '.', 2)
     , split_part(split_part('name@china.com.cn', '@', 2), '.', 3);
     
--what is three weeks from today?
SELECT current_date + INTERVAL '3 weeks';

--what is 5 months from yesterday?
SELECT current_date - 1 - INTERVAL '5 months';

--age
SELECT date_part('year', age(date('1999-10-1')));

--inner join
--name of customers & their emails who purchased on 1/2/2021
SELECT cust_name
     , email
  FROM custs c
  JOIN orders o USING (cust_id) --ON c.cust_id = o.cust_id
 WHERE ord_dt = '2021-1-2';
 
--products purchased from order id = 5
SELECT prod_grp
     , disp_size
     , chip
     , hd_storage
     , memory
  FROM prods p
  JOIN order_items i USING (prod_id)
 WHERE ord_id = 5;
 
--total sales by month
SELECT date_part('month', ord_dt)
     , sum(qty * price) sales
  FROM prods p
  JOIN order_items i USING (prod_id)
  JOIN orders o USING (ord_id)
 GROUP BY 1
 ORDER BY 1;
 
--how many items (qty) sold between 1st and 15th of every month
--group by month
SELECT date_part('month', ord_dt) mo
     , sum(qty) n
  FROM orders o
  JOIN order_items i USING (ord_id)
 WHERE date_part('day', ord_dt) <= 15
 GROUP BY 1
 ORDER BY 1;
 
--left outer join
--all states that customers live in and 
--total # of their orders on 6/15/2021
SELECT c.st
     , count(ord_id)
  FROM custs c
  LEFT
  JOIN (SELECT st
             , ord_id
          FROM custs c
          LEFT 
          JOIN orders o USING (cust_id)
         WHERE ord_dt = '2021-6-15') co USING (st)
 GROUP BY 1
 ORDER BY 1;
 
--kings or queens of each prod_cat
SELECT genius_name
     , b.prod_cat
     , sales
  FROM (SELECT prod_cat
             , max(sales) max_sales
          FROM (SELECT genius_name
                     , prod_cat
                     , sum(qty*price) sales
                  FROM geniuses g
                  JOIN orders o USING (genius_id)
                  JOIN order_items i USING (ord_id)
                  JOIN prods USING (prod_id)
                 GROUP BY 1,2) a
         GROUP BY 1) b
  JOIN (SELECT genius_name
             , prod_cat
             , sum(qty*price) sales
          FROM geniuses g
          JOIN orders o USING (genius_id)
          JOIN order_items i USING (ord_id)
          JOIN prods USING (prod_id)
         GROUP BY 1,2) c ON b.prod_cat = c.prod_cat
                        AND b.max_sales = c.sales;

--customer info of best customer by each store
SELECT b.store_name
     , cust_name
     , email
     , city
     , st
     , gender
     , sales
  FROM (SELECT store_name
             , max(sales) max_sales
          FROM (SELECT store_name
                     , cust_id
                     , sum(qty*price) sales
                  FROM custs c
                  JOIN orders o USING (cust_id)
                  JOIN order_items i USING (ord_id)
                  JOIN prods p USING (prod_id)
                  JOIN stores s USING (store_id)
                 GROUP BY 1,2) a
         GROUP BY 1) b
  JOIN (SELECT store_name
             , cust_id
             , sum(qty*price) sales
          FROM custs c
          JOIN orders o USING (cust_id)
          JOIN order_items i USING (ord_id)
          JOIN prods p USING (prod_id)
          JOIN stores s USING (store_id)
         GROUP BY 1,2) aa ON b.store_name = aa.store_name
                         AND b.max_sales = aa.sales
  JOIN custs c USING (cust_id);     
