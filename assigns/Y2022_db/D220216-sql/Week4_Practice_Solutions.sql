--Using the apple database

--------------------------------------
--1 
--The number of watches sold
--Grouped by the prod_grp
--Columns: prod_grp, num_sold
--Order by: num_sold (hi to lo)

SELECT prod_grp
     , sum(qty) num_sold 
  FROM prods p
  JOIN order_items i USING (prod_id)
 WHERE prod_cat = 'Watch'
 GROUP BY 1
 ORDER BY 2 DESC;

--------------------------------------
--2
--The best days of the week for online sales
--of Macs

SELECT date_part('dow', ord_dt) weekday
     , sum(qty*price) sales
  FROM prods p
  JOIN order_items i USING (prod_id)
  JOIN orders o USING (ord_id)
 WHERE prod_cat = 'Mac'
 GROUP BY 1
 ORDER BY 2 DESC;

SELECT to_char(ord_dt, 'Day') weekday
     , sum(qty*price) sales
  FROM prods p
  JOIN order_items i USING (prod_id)
  JOIN orders o USING (ord_id)
 WHERE prod_cat = 'Mac'
 GROUP BY 1
 ORDER BY 2 DESC;
 
--------------------------------------
--3
--The stores (b&m only) with the highest ratio
--  of quantity of iPads to iPhones sold
--Columns: store_name, store_city, store_state, ipad_iphone_ratio
--Order by: ipad_iphone_ratio (hi to lo), store_state

SELECT store_name
     , city store_city
     , st store_state
     , 1.0 * ipads / iphones ipad_iphone_ratio
  FROM (SELECT store_id
             , sum(qty) ipads
          FROM stores s
          JOIN orders o USING (store_id)
          JOIN order_items i USING (ord_id)
          JOIN prods p USING (prod_id)
         WHERE prod_cat ILIKE 'ipad'
           AND store_id != 'R000'
         GROUP BY 1) a
  JOIN (SELECT store_id
             , sum(qty) iphones
          FROM stores s
          JOIN orders o USING (store_id)
          JOIN order_items i USING (ord_id)
          JOIN prods p USING (prod_id)
         WHERE prod_cat ILIKE 'iphone'
           AND store_id != 'R000'
         GROUP BY 1) b USING (store_id)
  JOIN stores s USING (store_id)
 ORDER BY 4 DESC, 3;
 
--------------------------------------
--4
--The top 10 customers who purchased the most in $ amount 
--During a weekday (Mon through Fri)
--Living in cities beginning with the letters 'A' or 'P' 
--Columns: cust_name, amt_purchased 

SELECT cust_name
     , sum(qty*price) amt_purchased
  FROM custs c
  JOIN orders o USING (cust_id)
  JOIN order_items i USING (ord_id)
  JOIN prods p USING (prod_id)
 WHERE date_part('dow', ord_dt) BETWEEN 1 AND 5
   AND (city ILIKE 'a%' OR city ILIKE 'p%')
 GROUP BY 1
 ORDER BY 2 DESC
 LIMIT 10;

--------------------------------------
--5
--The favorite 10 product groups purchased by
--  customers who live in the same city as an Apple Store
--Columns: prod_grp, qty_purchased
--Order by: qty_purchased (hi to lo)

SELECT prod_grp
     , sum(qty) qty_purchased
  FROM prods p
  JOIN order_items i USING (prod_id)
  JOIN orders o USING (ord_id)
  JOIN custs c USING (cust_id)
  JOIN stores s USING (store_id)
 WHERE c.city = s.city
   AND c.st = s.st
 GROUP BY 1
 ORDER BY 2 DESC
 LIMIT 10;
  
--------------------------------------
--6
--The sales from customers who bought at least 
--  one 'Pro' product
--  and nothing else
--Columns: cust_name, email, qty, sales

 
SELECT cust_name
     , email
     , n qty
     , sales
  FROM (SELECT cust_id
             , sum(qty) n
             , sum(qty*price) sales
          FROM custs c
          JOIN orders o USING (cust_id)
          JOIN order_items i USING (ord_id)
          JOIN prods p USING (prod_id)
         WHERE prod_grp ILIKE '%pro%'
         GROUP BY 1) a --custs who bought pro product
  LEFT
  JOIN (SELECT cust_id
          FROM custs c
          JOIN orders o USING (cust_id)
          JOIN order_items i USING (ord_id)
          JOIN prods p USING (prod_id)
         WHERE prod_grp NOT ILIKE '%pro%') b USING (cust_id) --custs who bought non-pro product   
  JOIN custs USING (cust_id)
 WHERE b.cust_id IS NULL;
 
--------------------------------------
--7
--iPhone sales by email domain
--Email domain is the string following the '@' in the email
--Columns: email_domain, iphone_sales
--Order by: iphone_sales (hi to lo) and then email_domain (A to Z)

SELECT split_part(email, '@', 2) email_domain
     , sum(qty*price) iphone_sales
  FROM custs c
  JOIN orders o USING (cust_id)
  JOIN order_items i USING (ord_id)
  JOIN prods p USING (prod_id)
 WHERE prod_cat ILIKE 'iphone'
 GROUP BY 1
 ORDER BY 2 DESC, 1;
 
--------------------------------------
--8
--The genius with the highest ratio of 
--  (sales by genuis) : (sales by entire store of genius) 
--Columns: genius_name, store_name, genius_sales, store_sales, gs_ratio
--Order by: gs_ratio (hi to lo)

SELECT genius_name
     , store_name
     , genius_sales
     , store_sales
     , genius_sales / store_sales gs_ratio
FROM (SELECT genius_name
             , g.store_id
             , sum(qty*price) genius_sales
          FROM geniuses g
          JOIN orders o USING (genius_id)
          JOIN order_items i USING (ord_id)
          JOIN prods p USING (prod_id)
         GROUP BY 1, 2) a
         JOIN
        (SELECT store_id
             , sum(qty*price) store_sales
          FROM orders o
          JOIN order_items i USING (ord_id)
          JOIN prods p USING (prod_id)
         GROUP BY 1) b USING (store_id)
         JOIN stores s USING (store_id)
         ORDER BY 5 DESC
         LIMIT 1;
 
--------------------------------------
--9
--Customers who live within 10km radius  
--  of Apple Store where they made purchase
--Store must be in New York, NY
--Measure distance using the function dist_km
--Columns: cust_name, email, city, st, dist
  
SELECT cust_name
     , email
     , city
     , st
     , dist
  FROM (SELECT cust_name
             , email
             , c.city
             , c.st
             , dist_km(c.lat, c.lng, s.lat, s.lng) dist
          FROM custs c
          JOIN orders o USING (cust_id)
          JOIN stores s USING (store_id)
         WHERE s.city = 'New York'
           AND s.st = 'NY') a
 WHERE dist <= 10;
       
--------------------------------------
--10
--The customers in each 15-year age band 
--Where
--  Band1 = ages 15 to 29
--  Band2 = ages 30 to 44
--  Band3 = ages 45 to 59
--  Band4 = ages 60 to 74
--  Band5 = ages 75 to 89
--Who purchased at least $10,000
--Columns: age_band, cust_name, cust_age, amount
--Order by: age_band (A to Z), amount (hi to lo), age (lo to hi)

--15 Band1  15/15 = 1  29/15 = 1
--35 Band2  30/15 = 2  44/15 = 2
  
SELECT 'Band' || date_part('year', age(ord_dt, dob))::int / 15 age_band
     , cust_name
     , date_part('year', age(ord_dt, dob)) cust_age
     , sum(qty*price) amount 
  FROM custs c
  JOIN orders o USING (cust_id)
  JOIN order_items i USING (ord_id)
  JOIN prods p USING (prod_id)
 GROUP BY 1,2,3
HAVING sum(qty*price) >= 10000
 ORDER BY 1, 4 DESC, 3;
 