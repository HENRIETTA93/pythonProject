-- What is the number of dates on which an employee was hired?
select count(distinct hiredate) from emp

-- Retrieve the name and salary of the employees whose salary is at most half of the maximum salary.
select ename,sal
from emp
where sal <= (select max(sal)/2 from emp)


-- List the average length of the employee names for each department number.
select deptno,avg(length(ename)) from emp group by deptno

-- Retrieve the name and hire date of the employees that were hired on the same date as at least one other employee.
select ename,hiredate
from emp
where hiredate in
  (select hiredate from emp group by hiredate having count(*)>=2)

-- Retrieve the names and jobs of the employees that have a job for which there are at least 3 employees in the company with the same job and where the average salary of employees with that job is at least 1500.
select ename,job
from emp
where job in
  (select job
    from emp
    group by job
    having count(*)>=3 and avg(sal)>=1500)

-- Retrieve the names of the departments where the minimum salary of the employees is at least a quarter of the maximum salary paid to any employee in the company.
select dname
from dept
where deptno in
  (select deptno
    from emp
    group by deptno
    having min(sal) >= (select max(sal) from emp)/4);
