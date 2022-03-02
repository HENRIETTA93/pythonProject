--coalesce
SELECT 1,2, coalesce(NULL, 3);

--all cust_id's with their acct types
SELECT cust_id
     , COALESCE(acct_type, 'No Active Accounts')
  FROM custs 
  LEFT
  JOIN accts USING (cust_id)
 ORDER BY 1;
 
--least function
--the least of two values
SELECT least(1,2);

--greatest of 15 days or days until the end of this month
SELECT greatest(15, date_part('day',age('2022-2-28', current_date)));

--case statement where interest rate based on state of cust
--NY 3%, CA 2%, IL 1%, other 0.5%

SELECT cust_first || ' ' || cust_last cust_name
     , st
     , CASE st
         WHEN 'NY' THEN 0.03
         WHEN 'CA' THEN 0.02
         WHEN 'IL' THEN 0.01
         ELSE 0.005
       END intrate
  FROM custs;

--case statement
--promotion is based on zipcode
--even zipcode $100 gift card
--odd zipcode $50 gift card
  
SELECT cust_first || ' ' || cust_last cust_name
     , email
     , city
     , st
     , zip
     , CASE
         WHEN zip::int % 2 = 0 THEN 100
         ELSE 50
       END giftcard
  FROM custs;
  
--case statement
--define withdrawal categories
--during bank hours (9-5) or not
--group by acct_id
--number of transactions, total amount of txns
  
SELECT acct_id
     , CASE
         WHEN date_part('hour', tran_dt) BETWEEN 9 AND 16 THEN 'in'
         ELSE 'out'
       END timeblock
     , count(*) n
     , sum(tran_amt) totalamt
  FROM trans
 WHERE tran_type = 'w'
 GROUP BY 1,2;
  
--CTE
--how many txns occurred on Tuesdays
--by customers aged 20-29
--checking accounts only

WITH t
  AS (SELECT tran_id
           , tran_dt
           , dob
           , acct_type
        FROM custs 
        JOIN accts USING (cust_id)
        JOIN trans USING (acct_id))
SELECT count(*)
  FROM t
 WHERE date_part('dow', tran_dt) = 2
   AND date_part('year', age(tran_dt, dob)) BETWEEN 20 AND 29
   AND acct_type = 'c';
   
--view
--eoy balance by customer
CREATE OR REPLACE VIEW bal_eoy_dy2365 AS
SELECT cust_id
     , sum(net_amt) bal_eoy
  FROM (SELECT cust_id
             , CASE tran_type
                 WHEN 'w' THEN -1 * tran_amt
                 ELSE tran_amt
               END net_amt
          FROM custs
          JOIN accts USING (cust_id)
          JOIN trans USING (acct_id)) a
 GROUP BY 1;
   
--using this view, which state has the highest avg balance
--at eoy
SELECT st
     , avg(bal_eoy) avg_bal
  FROM bal_eoy_dy2365
  JOIN custs USING (cust_id)
 GROUP BY 1
 ORDER BY 2 DESC;
 