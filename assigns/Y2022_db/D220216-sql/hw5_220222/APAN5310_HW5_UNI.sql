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


-- HOMEWORK ASSIGNMENT 5

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
 *      database system (MySQL, MS SQL Server, SQLite, Oracle, etc).
 *
 *    - The source database 'bank' is provided to you. If you modify the data 
 *      in any way, your results might differ from the correct results. You can  
 *      always add a fresh version of the original database with the set of scripts
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
 *    - For this assignment, do not create or use any views! Use CTEs or subqueries
 *      to represent intermediate tables.
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
 * QUESTION 1 (25 points)
 * --------------------
 *
 * Provide the SQL statement that returns the states in which the customers
 *   live and the account type (c or s) in greatest use by those customers.
 * Greatest use is defined by the number of transactions incurred for the 
 *   given account type.
 * If there are ties for the top account type, choose Checking Account (c).
 * For example, if state ZZ had 
 *   - Checking accounts with 200 total transactions
 *   - Savings accounts with 200 total transactions
 *   Then, the output for this state should be: 'ZZ', 'c'. 
 * Label the columns: st, greatest_acct_type
 * Order by state (A to Z).
 *
 */

-- START ANSWER --

with t
as
(

with tmp
as
(
select c.st, a.acct_type, count(t.tran_id) as trans_num
from custs c
join accts a using(cust_id)
join trans t using(acct_id)
group by c.st, a.acct_type
order by c.st
)
select st, acct_type
from tmp t1
where trans_num=(select max(trans_num) from tmp t2 where t1.st=t2.st)
order by st
)
select t.st, case when t2.top_num>1 then 'c' else t.acct_type end as greatest_acct_type
from t join
(
select st, count(acct_type) top_num
from t
group by st
) t2 using(st);

-- END ANSWER --


/*
AK	s
AL	s
AR	c
AZ	c
CA	c
CO	c
CT	s
DC	s
DE	s
FL	s
GA	s
HI	s
IA	c
ID	c
IL	c
IN	c
KS	c
KY	s
LA	c
MA	s
MD	s
MI	c
MN	s
MO	c
MS	c
NC	c
NE	s
NJ	s
NM	s
NV	c
NY	c
OH	c
OK	s
OR	s
PA	s
RI	s
SC	s
SD	s
TN	s
TX	s
UT	s
VA	c
WA	c
WI	c
WV	c
*/
-------------------------------------------------------------------------------

/*
 * QUESTION 2 (25 points)
 * --------------------
 *
 * Use four Common Table Expressions (CTEs) to help produce a report showing
 *   customers grouped by the first three digits of their zip code (zip3)
 *   and the number of customers by gender and age groups.
 * 
 * Label the columns: 
 *   'Zip3', 
 *   'Female_Customers_0_to_45', 
 *   'Female_Customers_46_and_Over', 
 *   'Male_Customers_0_to_45', 
 *   'Male_Customers_46_and_Over'
 * 
 * Each CTE (named c1, c2, c3, c4) should show the zip3 code along with the
 *   number of customers living in that zip3 code and within the necessary
 *   gender/age group.
 * 
 *     - c1 for female customers aged 0 to 45
 *     - c2 for female customers aged 46 and over
 *     - c3 for male customers aged 0 to 45
 *     - c4 for male customers aged 46 and over
 * 
 * There should be no NULL values in the final output. Replace with zeroes.
 * Order by total customers (hi to lo).
 *
 */

-- START ANSWER --

--select left(zip,3) as zip3,
--sum(case when gender='f' and date_part('year',age(current_date, dob))<=45 then 1 else 0 end) as c1,
--sum(case when gender='f' and date_part('year',age(current_date, dob))>=46 then 1 else 0 end) as c2,
--sum(case when gender='m' and date_part('year',age(current_date, dob))<=45 then 1 else 0 end) as c3,
--sum(case when gender='m' and date_part('year',age(current_date, dob))>=46 then 1 else 0 end) as c4
--from custs
--group by left(zip,3)
--order by sum(case when gender='f' and date_part('year',age(current_date, dob))<=45 then 1 else 0 end)
--+sum(case when gender='f' and date_part('year',age(current_date, dob))>=46 then 1 else 0 end)
--+sum(case when gender='m' and date_part('year',age(current_date, dob))<=45 then 1 else 0 end)
--+sum(case when gender='m' and date_part('year',age(current_date, dob))>=46 then 1 else 0 end)
-- desc;

with t
 as
 (
 select left(zip,3) as zip3,
sum(case when gender='f' and date_part('year',age(current_date, dob))<=45 then 1 else 0 end) as c1,
sum(case when gender='f' and date_part('year',age(current_date, dob))>=46 then 1 else 0 end) as c2,
sum(case when gender='m' and date_part('year',age(current_date, dob))<=45 then 1 else 0 end) as c3,
sum(case when gender='m' and date_part('year',age(current_date, dob))>=46 then 1 else 0 end) as c4
from custs
group by left(zip,3)
 )
 select zip3, c1,c2,c3,c4
 from t
 order by c1+c2+c3+c4 desc;


-- END ANSWER --
/*
891	47	22	32	15
303	32	21	37	23
900	38	12	35	20
606	33	29	25	17
331	31	18	28	15
850	23	16	32	16
352	26	11	25	18
921	26	12	27	15
328	18	14	28	18
101	25	18	25	9
336	29	14	21	13
*/
-------------------------------------------------------------------------------

/*
 * QUESTION 3 (25 points)
 * --------------------
 *
 * Although none of the accounts earn interest in this bank, the bank 
 * decides to reward certain customers with a one-time year-end interest
 * payment who meet all the following qualifications:
 * 
 *   1) own either a savings or a checking account, but not both
 *   2) live in the same zip code with at least nine other customers
 *        (including those with no active accounts)
 *   3) conduct the majority of his/her transactions on a mobile device
 *
 * The interest payment is equal to:
 * 
 *   int_pmt = (bal @ end of day 3/31/2021) * 0.00325 +
 *             (bal @ end of day 9/30/2021) * 0.00525
 * 
 *   Round the int_pmt to 2 dp.
 * 
 * The payment will be credited to the affected account on 1/1/2022.
 * Label the columns: cust_name, acct_type, bal331, bal930, int_pmt
 *   (cust_name is cust_last and cust_first separated by a comma and space;
 *    e.g. John Doe should be Doe, John)
 * Order by int_pmt (hi to lo), then by cust_name (A to Z).
 * 
 */

-- START ANSWER --
 
  with t1
 as
 (
 select cust_id
 from custs c
 join accts a using(cust_id)
 where a.acct_type in('s','c')
 group by cust_id
 having count(distinct acct_type)=1
 ),
 t2
 as
 (
 select c.cust_id,count(c1.cust_id) as other_custs_num
 from custs c
 join custs c1 using (zip)
 group by c.cust_id
 ),
 t3
 as
 (
 select c.cust_id, a.acct_id,sum(case when l.locn_type='a' then 1 else 0 end) as atm_num,
sum(case when l.locn_type='b' then 1 else 0 end) as branch_num,
sum(case when l.locn_type='m' then 1 else 0 end) as mobile_num
,count(t.tran_id) as tran_num
 from custs c
 join accts a using(cust_id)
 join trans t using(acct_id)
 join locns l using(locn_id)
 group by c.cust_id,  a.acct_id
 ),
 t4
 as
 (
 select c.cust_id,a.acct_id,
sum(case when t.tran_type='d' then t.tran_amt else 0.0-tran_amt end) as bal331
 from custs c
 join accts a using(cust_id)
 join trans t using(acct_id)
 where tran_dt::date<='2021-03-31'
 group by c.cust_id,a.acct_id
 ),
 t5
 as
 (
 select c.cust_id, a.acct_id,
sum(case when t.tran_type='d' then t.tran_amt else 0.0-tran_amt end) as bal930
 from custs c
 join accts a using(cust_id)
 join trans t using(acct_id)
 where tran_dt::date<='2021-09-30'
 group by c.cust_id,a.acct_id
 )
 select distinct c.cust_first||', '||c.cust_last as cust_name,
 a.acct_type,a.bal_boy+t4.bal331 as bal331,
 a.bal_boy+t5.bal930 as bal930,
 round((a.bal_boy+t4.bal331)*0.00325+(a.bal_boy+t5.bal930)*0.00525,2) as int_pmt
 from t1
 join t2 using (cust_id)
 join t3 using (cust_id)
 join t4 using (cust_id)
 join t5 using (cust_id)
 join custs c using(cust_id)
 join accts a on a.acct_id=t3.acct_id and  a.acct_id=t4.acct_id and a.acct_id=t5.acct_id
 where t2.other_custs_num>=9 and t3.mobile_num>=t3.atm_num+t3.branch_num
 order by int_pmt desc,cust_name ;

-- END ANSWER --
 
/*
 * QUESTION 4 (25 points)
 * --------------------
 *
 * Because the bank is needing additional sources of revenue, it decides to
 *   impose two separate penalty fees to customers for certain withdrawal 
 *   activity as noted below:
 *
 *   Fee1: $25 for each withdrawal from a savings account where the withdrawal amount
 *       exceeds the average savings withdrawal amount for the customer's 
 *       state of residence
 * 
 *   Fee2: 0.012% of total withdrawal amounts for all accounts within a quarter 
 *       if that total exceeds $5,000 (round fee to 2 dp)
 *
 * Replace any null values with zeroes.
 * Label the columns: cust_id, full_name, fee1, fee2, total_fee 
 * Order by total fee (hi to lo).
 * Include only the top 25 customers.
 * full_name = cust_first and cust_last separated by a space
 *
 */

-- START ANSWER --

 with
 t1
 as
 (
 select c.st, avg(t.tran_amt) as st_avg_amt
 from custs c
 join accts a using(cust_id)
 join trans t using(acct_id)
 where a.acct_type='s'
 and t.tran_type='w'
 group by c.st
 ),
t2
as
(
select c.cust_id, date_part('quarter', t.tran_dt) as quarter ,sum(t.tran_amt) as total_amt
from custs c
join accts a using(cust_id)
join trans t using(acct_id)
where t.tran_type='w'
group by c.cust_id, date_part('quarter',t.tran_dt)
),
t3
as
(
 select c.cust_id,
 sum(case when t.tran_type='w' and a.acct_type='s' and t.tran_amt>t1.st_avg_amt
 then 25 else 0 end) as fee1

 from custs c
 join accts a using(cust_id)
 join trans t using(acct_id)
 join t1 using(st)
 group by c.cust_id
),
t4
as
(
select c.cust_id,
sum(case when t2.total_amt>5000 then round(t2.total_amt*0.00012,2) else 0 end) as fee2
from custs c
join t2 using (cust_id)
group by c.cust_id
)
select c.cust_first||' '||c.cust_last as full_name, t3.fee1, t4.fee2, t3.fee1+t4.fee2 as total_fee
from custs c
join t3 using(cust_id)
join t4 using(cust_id)
order by total_fee desc
limit 25;
-- END ANSWER --

-------------------------------------------------------------------------------

-- END HOMEWORK ASSIGNMENT 5 --

-------------------------------------------------------------------------------
