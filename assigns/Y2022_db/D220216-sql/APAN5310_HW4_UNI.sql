-- APAN 5310: SQL & RELATIONAL DATABASES

   -------------------------------------------------------------------------
   --                                                                     --
   --                            HONOR CODE                               --
   --                                                                     --
   --  I affirm that I will not plagiarize, use unauthorized materials,   --
   --  or give or receive illegitimate help on assignments, papers, or    --
   --  examinations. I will also uphold equity and honesty in the         --
   --  evaluation of my work and the work of others. I do so to sustain   --
   --  a community built around this Code of Honor.                       --
   --                                                                     --
   -------------------------------------------------------------------------

/*
 *    You are responsible for submitting your own, original work. We are
 *    obligated to report incidents of academic dishonesty as per the
 *    Student Conduct and Community Standards.
 */


-------------------------------------------------------------------------------
-------------------------------------------------------------------------------


-- HOMEWORK ASSIGNMENT 4

/*
 *  NOTES:
 *
 *    - For all SQL statements, enter your answers between the START and END tags 
 *      for each question, as shown in the example. Do not alter this template 
 *      file in any other way other than adding your answers. Do not delete the
 *      START/END tags. The .sql file you submit will be validated before
 *      grading and will not be graded if it fails validation due to any
 *      alteration of the commented sections.
 *
 *    - Our course is using PostgreSQL. We will grade your assignments in PostgreSQL.
 *      You risk losing points if you prepare your SQL queries for a different
 *      database system (MySQL, MS SQL Server, SQLIte, Oracle, etc).
 *
 *    - The source database 'apple' is provided to you. If you modify the data 
 *      in any way, your results might differ from the correct results. You can  
 *      always add a fresh version of the original database with the script
 *      from Canvas if needed. You DO NOT need to run this script if connecting
 *      to the database on the remote server.
 *
 *    - Make sure you test each one of your answers. If a query returns an
 *      error it will earn no points.
 *
 *    - Each question specifies the exact columns requested in the output. Any more
 *      or any less columns will result in less than full score for the question.
 *
 *    - You are free to use JOINS and any other SQL logic to solve these problems.
 *
 *    - You will receive full credit for each problem only if the minimum number
 *      of tables are joined to solve the problem.
 *
 */

-------------------------------------------------------------------------------

/*
 * EXAMPLE
 * -------
 *
 * Provide the SQL statement that returns all columns and rows from
 * a table named "tbl1".
 *
 */

-- START EXAMPLE --

SELECT * FROM tbl1;

-- END EXAMPLE --

-------------------------------------------------------------------------------

/*
 * QUESTION 1 (10 points)
 * --------------------
 *
 * Provide the SQL statement that returns all the customers from the 
 *   custs table who have not purchased a single item during the 
 *   4th quarter of 2021.
 * Label the columns: cust_name, cust_email, cust_city, cust_state
 * Order by cust_state (A to Z) and then cust_name (A to Z).
 *
 */

-- START ANSWER --

select cust_name, email as cust_email, city as cust_city, st as cust_state
 from custs
 where cust_id not in
 (
 select distinct c.cust_id
 from custs c
 join orders o on c.cust_id=o.cust_id
 where date_part('quarter',o.ord_dt)=4
 ) order by cust_state;

-- END ANSWER --

-------------------------------------------------------------------------------

/*
 * QUESTION 2 (20 points)
 * --------------------
 *
 * Provide the SQL statement that returns all the brick and mortar Apple stores
 *   in the states of CA, TX, FL, and NY along with the number of items purchased
 *   by male customers under the age of 30 (during day of purchase).
 * Only include stores with at least one qualifying purchase.
 * Label the columns: store_name, store_city, store_state, items_purchased
 * Order by items_purchased (hi to lo) and then store_state (A to Z).
 *
 */

-- START ANSWER --


select store_name, s.city as store_city, s.st as store_state, sum(oi.qty) as items_purchased
from stores s
join orders o on s.store_id=o.store_id
join order_items oi on oi.ord_id=o.ord_id
join custs c on c.cust_id=o.cust_id
where s.st in ('CA', 'TX', 'FL', 'NY')
and date_part('year',age(o.ord_dt, c.dob))<30
group by store_name, s.city, s.st
order by items_purchased desc, store_state;
-- END ANSWER --

-------------------------------------------------------------------------------

/*
 * QUESTION 3 (20 points)
 * --------------------
 *
 * Provide the SQL statement that returns the geniuses 
 *   who assisted on more orders than the average
 *   number of orders assisted by all geniuses.
 * Label the columns: genius_name, store_name, num_orders
 * Order by num_orders (hi to lo) and then genius_name (A to Z).
 *
 */

-- START ANSWER --


 select g.genius_name, s.store_name, count(o.ord_id) as num_orders
 from geniuses g
 join orders o on o.genius_id=g.genius_id
 join stores s on g.store_id=s.store_id
 group by g.genius_name, s.store_name
 having count(o.ord_id)>(
 select avg(geniuses_count)
 from
 (
 select g.genius_id, count(o.ord_id) as geniuses_count
 from geniuses g
 join orders o on o.genius_id=g.genius_id
 group by g.genius_id
 ) t
 )
 order by num_orders desc, g.genius_name;

-- END ANSWER --

-------------------------------------------------------------------------------

/*
 * QUESTION 4 (25 points)
 * --------------------
 *
 * Provide the SQL statement that returns the price per GB for
 *   certain MacBook products.
 * 
 *   price_per_gb = price / # of GB in hd_storage
 * 
 * Include only MacBooks with less than 1TB of storage space.
 * Include only MacBooks purchased more than 25 times
 *   on a weekday (Mon thru Fri).
 * Label the columns: prod_grp, chip, disp_size, hd_storage, 
 *                    memory, price_per_gb
 * Order by price_per_gb (hi to lo).
 * 
 */

-- START ANSWER --

 select prod_grp,chip,disp_size,hd_storage, memory, p.price/left(hd_storage,2)::int as price_per_gb
 from prods p
 join order_items oi on oi.prod_id=p.prod_id
 join orders o on o.ord_id=oi.ord_id
 where prod_grp like 'MacBook%' and hd_storage not like '%TB'
 and date_part('dow', ord_dt) not in (0,6)
 group by prod_grp,chip,disp_size,hd_storage, memory, p.price,hd_storage
 having count(oi.ord_id)>25
 order by price_per_gb desc;

-- END ANSWER --

-------------------------------------------------------------------------------

/*
 * QUESTION 5 (25 points)
 * --------------------
 *
 * Provide the SQL statement that returns the dollar amount of iPads purchased
 *   for each full week in October 2021. 
 * There were four full weeks during the month:
 *    Week1: 10/03 - 10/09 
 *    Week2: 10/10 - 10/16 
 *    Week3: 10/17 - 10/23
 *    Week4: 10/24 - 10/30
 * Exclude the iPad mini.
 * Label the columns: week, amt_ipads
 * The values in the week column must be 'Week1', 'Week2', 'Week3', and 'Week4'.
 * Order by week (lo to hi).
 *
 */

-- START ANSWER --

 select
 'Week'||date_part('week', o.ord_dt)- date_part('week', o.ord_dt-((date_part('day',o.ord_dt)-7)|| ' day')::interval)+1 as week,
 sum(oi.qty*p.price) amt_ipads
 from prods p
 join order_items oi using(prod_id)
 join orders o using(ord_id)
 where date_part('year', o.ord_dt)=2021 and date_part('month',o.ord_dt)=10
 and p.prod_grp like 'iPad%' and p.prod_grp!='iPad mini'
 and date_part('week', o.ord_dt)- date_part('week', o.ord_dt-((date_part('day',o.ord_dt)-7)|| ' day')::interval)!='-1'
 group by 'Week'||date_part('week', o.ord_dt)- date_part('week', o.ord_dt-((date_part('day',o.ord_dt)-7)|| ' day')::interval)+1
 order by week;

-- END ANSWER --

-------------------------------------------------------------------------------

/*
 * BONUS QUESTION (10 points)
 * --------------------
 *
 * As an employee of Apple, you are asked to find any customers who fit
 *   all of the following criteria:
 *   - purchased at least $1,000 of any product during November 2021
 *   - purchased at least one Apple Watch of any kind
 *   - total $ spent on Apple Watches / total $ spent on everything > 0.5
 * Label the columns: cust_name, email, watch_sales
 * Order by watch_sales (hi to lo) and then cust_name (A to Z).
 *
 */

-- START ANSWER --



-- END ANSWER --

-------------------------------------------------------------------------------

-- END HOMEWORK ASSIGNMENT 4 --

-------------------------------------------------------------------------------


select
 'Week'||date_part('week', o.ord_dt)- date_part('week', o.ord_dt-((date_part('day',o.ord_dt)-7)|| ' day')::interval)+1 as week,
--  date_part('week', o.ord_dt-7),
-- -- (date_part('day',o.ord_dt)-7),
-- date_part('day',o.ord_dt)
 sum(oi.qty*p.price)
 from prods p
 join order_items oi using(prod_id)
 join orders o using(ord_id)
 where date_part('year', o.ord_dt)=2021 and date_part('month',o.ord_dt)=10
 and p.prod_grp like 'iPad%' and p.prod_grp!='iPad mini'
 and date_part('week', o.ord_dt)- date_part('week', o.ord_dt-((date_part('day',o.ord_dt)-7)|| ' day')::interval)!='-1'
 group by 'Week'||date_part('week', o.ord_dt)- date_part('week', o.ord_dt-((date_part('day',o.ord_dt)-7)|| ' day')::interval)+1



 select 1+date_part('week',dt) - date_part('week', dt - ((date_part('day',dt)-1)||' day')::interval)
 from(values( now() )) data(dt)