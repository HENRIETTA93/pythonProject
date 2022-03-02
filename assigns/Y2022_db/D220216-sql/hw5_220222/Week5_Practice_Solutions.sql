--Using the bank database

--------------------------------------
--1
--Customers grouped by year of birth 
--# of transactions by customers in that year
--maximum # of transactions by a single customer
--  within that year
--include all account types
--Columns: yob, num_txns, max_num_txns
--Order by: yob (lo to hi)

WITH cat
  AS (SELECT cust_id
           , dob
        FROM custs
        JOIN accts USING (cust_id)
        JOIN trans USING (acct_id)),
     y
  AS (SELECT date_part('year', dob) yob
           , cust_id
           , count(*) n
        FROM cat
       GROUP BY 1,2)
SELECT yob
     , sum(n) num_txns
     , max(n) max_num_txns
  FROM y
 GROUP BY 1
 ORDER BY 1;

--2
--Report of monthly deposits and withdrawals, and net amount
--net amount = deposits - withdrawals
--Columns: mot, total_deposits, total_withdrawals, net_amt
--Order by: mot

WITH dw
  AS (SELECT date_part('month', tran_dt) mot
           , sum(CASE tran_type
                   WHEN 'd' THEN tran_amt
                 END) d
           , sum(CASE tran_type
                   WHEN 'w' THEN tran_amt
                 END) w
        FROM trans
       GROUP BY 1)
SELECT mot
     , d total_deposits
     , w total_withdrawals
     , d-w net_amt
  FROM dw
 ORDER BY 1;
 
--3
--A split of deposits made in checking accounts
--  by weekday vs weekend
--Columns: week_part, num_deposits, total_deposit_amt
--Order by: week_part (weekday to weekend)

SELECT CASE
         WHEN date_part('dow', tran_dt) BETWEEN 1 AND 5 THEN 'weekday'
         ELSE 'weekend'
       END week_part
     , count(*) num_deposits
     , sum(tran_amt) total_deposit_amt
  FROM trans 
  JOIN accts USING (acct_id)
 WHERE acct_type = 'c'
   AND tran_type = 'd'
 GROUP BY 1
 ORDER BY 1;
     
--4
--Using a CTE called 'svgs_custs' showing 
--  full_name, dob, bal_svgs_boy
--  of customers who have a savings account 
--Main query columns: full_name, dob, bal_svgs_eoq1
--  where bal_svgs_eoq1 = balance in savings acct after Q1
--Order by: bal_svgs_eoq1 (hi to lo)

WITH svgs_custs --customers who have a savings acct
  AS (SELECT cust_id
           , cust_first || ' ' || cust_last full_name
           , dob
           , bal_boy bal_svgs_boy
        FROM custs
        JOIN accts USING (cust_id)
       WHERE acct_type = 's'),
     svgs_txns --txn amts BY customer WITH correct signs
  AS (SELECT cust_id
           , tran_dt
           , CASE tran_type
               WHEN 'w' THEN -1*tran_amt
               ELSE tran_amt
             END net_amt
        FROM custs
        JOIN accts USING (cust_id)
        JOIN trans USING (acct_id)
       WHERE acct_type = 's'
         AND date_part('qtr', tran_dt) = 1),
    svgs_eoq1 --total net amts BY customer @ eoq1
  AS (SELECT cust_id
           , sum(net_amt) net_svgs_amt
        FROM svgs_txns
       GROUP BY 1)
SELECT full_name
     , dob
     , bal_svgs_boy + net_svgs_amt bal_svgs_eoq1
  FROM svgs_eoq1
  JOIN svgs_custs USING (cust_id)
 ORDER BY 3 DESC;
 
--5
--Fee per customer where fee is:
--  $8 for each withdrawal from a savings account 
--  where the withdrawal amount exceeds the average 
--  savings withdrawal amount for the customer
--Columns: cust_id, cust_city, cust_state, avg_svg_wd, fee
--Order by fee (hi to lo)

WITH sw --avg svgs wd BY customer
  AS (SELECT cust_id
           , acct_type
           , avg(tran_amt) avg_svg_wd
        FROM custs
        JOIN accts USING (cust_id)
        JOIN trans USING (acct_id)
       WHERE acct_type = 's'
         AND tran_type = 'w'
       GROUP BY 1,2)
SELECT cust_id
     , city cust_city
     , st cust_state
     , round(avg_svg_wd,2)
     , sum(CASE
             WHEN tran_amt > avg_svg_wd THEN 8
             ELSE 0
           END) fee
  FROM sw
  JOIN custs USING (cust_id)
  JOIN accts USING (cust_id)
  JOIN trans USING (acct_id)
 GROUP BY 1,2,3,4
 ORDER BY 5 DESC;
 
--6
--Transaction activity by physical locn type (a or b)
--  for customers who conducted majority of  
--  his/her live transactions in that locn
--Columns: locn_type, num_custs, num_txns, tot_deps, tot_wds
--Order by locn_type (A to Z)
 
WITH x --custs AND locns WITH num txns
  AS (SELECT cust_id
           , locn_id
           , count(*) n
        FROM custs
        JOIN accts USING (cust_id)
        JOIN trans USING (acct_id)
        JOIN locns USING (locn_id)
       WHERE locn_type IN ('a', 'b')
       GROUP BY 1,2),
     y --custs who have a majority location
  AS (SELECT cust_id
           , max(n) maxn
           , sum(n) sumn
        FROM x
       GROUP BY 1
      HAVING max(n) > 0.5 * sum(n)),
     z -- custs AND locns FOR ONLY majority locns
  AS (SELECT cust_id
           , locn_id
        FROM x
        JOIN y USING (cust_id)
       WHERE n = maxn)
SELECT locn_type
     , count(DISTINCT cust_id) num_custs
     , count(*) num_txns
     , sum(CASE tran_type
             WHEN 'd' THEN tran_amt
             ELSE 0
           END) tot_deps
     , sum(CASE tran_type
             WHEN 'w' THEN tran_amt
             ELSE 0
           END) tot_wds 
  FROM (SELECT cust_id FROM z) a
  JOIN accts USING (cust_id)
  JOIN trans USING (acct_id)
  JOIN locns USING (locn_id)
 WHERE locn_type IN ('a', 'b')
   AND locn_id IN (SELECT locn_id FROM z)
 GROUP BY 1;
