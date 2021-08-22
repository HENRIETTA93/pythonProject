-- List all employee names and their department's location.
select ename,loc from emp e, dept d where e.deptno = d.deptno;

-- Define the midpoint of a salary grade to be (lower range + upper range)/2. Select the names and salary of all employees whose salary is at least as high as the midpoint of the salary grade of the employee named SCOTT. Order the results by the salaries (in ascending order).
select ename,sal from emp e1,salgrade s1 where e1.sal >= (s1.losal + s1.hisal)/2 and s1.grade in (select grade from salgrade s2, emp e2 where e2.ename = 'SCOTT' and e2.sal between s2.losal and s2.hisal) order by e1.sal;

-- List the employee names (and their department's location) that work in a department that is not at the same location as the departments where either JONES or MILLER work. (You can't assume that department locations are unique even if the data tells you otherwise.)
select ename,loc from emp e,dept d where e.deptno = d.deptno and d.loc not in (select loc from dept d2,emp e2 where e2.ename in ('JONES','MILLER') and d2.deptno=e2.deptno);
