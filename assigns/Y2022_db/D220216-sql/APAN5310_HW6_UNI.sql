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


-- HOMEWORK ASSIGNMENT 6

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
 * QUESTION 1 (30 points)
 * --------------------
 *
 * Write a SQL statement to generate a list of the top 4 cities in each state
 *   where the most customers live.
 * Include all cities tied for the 4th spot.
 * Include only states with at least 100 customers.
 * The columns: st, city, num_custs
 * Order by: st (A to Z), num_custs (hi to lo), city (Z to A)
 *
 */

-- START ANSWER --



-- END ANSWER --

-------------------------------------------------------------------------------

/*
 * QUESTION 2 (35 points)
 * --------------------
 *
 * Write a SQL statement to find all the transactions at each location
 *   where they are part of at least two consecutive transactions with
 *   amounts >= $5,000.
 * The tran_id should be used to determine the order of the transactions.
 * All transaction types (d or w) can be included.
 * Exclude mobile transactions.
 * The columns: locn_id, city, st, tran_id, tran_type, tran_amt
 * Order by: locn_id (lo to hi) and then tran_id (lo to hi)
 *
 */

-- START ANSWER --



-- END ANSWER --

-------------------------------------------------------------------------------

/*
 * QUESTION 3 (35 points)
 * --------------------
 *
 * Write a SQL statement to generate a report showing bi-daily total amounts
 *   for deposits, withdrawals, and 4-day moving average of net amount.
 * Bi-daily total amounts mean the totals during a 2-day span.
 * For the moving average window, use the trailing 4-days formula 
 *   (current day + three days before it)
 * The moving average for the first 2-day span should be the 2-day average.
 * Use all transactions in the trans table.
 * The columns: end_of_biday, dep_amt, wd_amt, net_amt, ma4_net_amt
 *   where end_of_biday = the date that ends the 2-day period,
 *         dep_amt = total deposit amounts during the 2-day period
 *         wd_amt = total withdrawal amounts during the 2-day period
 *         net_amt = dep_amt - wd_amt,
 *         ma4_net_amt - 4-day moving average of net_amt
 * Order by: end_of_biday (lo to hi)
 *
 */

-- START ANSWER --



-- END ANSWER --

-------------------------------------------------------------------------------

-- END HOMEWORK ASSIGNMENT 6 --

-------------------------------------------------------------------------------
