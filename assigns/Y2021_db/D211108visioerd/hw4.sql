/*
-- 1
For this problem, you are to compose a script that will accomplish the following tasks. Create a
table called dep active that will contain all of the data in the departments table, including only
those instances for which there is at least one employee in the employees table that is in that
department (i.e., has the associated department ID). Append a column that represents the average
salary of all employees in the employees table that are in that department.
*/

create table hr.dep_active
as
select d.department_id, d.department_name, d.manager_id, d.location_id, avg(e.salary) avg_salry from 
hr.departments d join hr.employees e on e.department_id=d.department_id
group by d.department_id, d.department_name, d.manager_id, d.location_id;

/*
-- 2
For this problem, you are to compose a script that will accomplish the following tasks. For the table
created in Problem 1, set the department id as the primary key. Then, set the department name
as required and unique. Finally, set the location ID as an optional foreign key attribute
*/
alter table dep_active add constraint pk_dep_active primary key(department_id);
alter table dep_active add constraint uk_dep_active_name unique(department_name);
alter table dep_active modify department_name varchar2(30) not null;
alter table dep_active add constraint fk_dep_active_loc foreign key(location_id) references location(location_id);

/*
-- 3
For this problem, you are to compose a script that will accomplish the following tasks. First,
delete the table that you created in Problem 1. Next, the script should copy all of the data in the
employees table into a new table that is called copy employees. Then, add a primary key constraint
called copy emp pk which enforces that employee id is the primary key for the newly created table.
Finally, update the manager ID to 100 for every employee whose department ID is 50 or 80 in the
copy employee table.
*/

drop table dep_active;

create table copy_employees
as
select * from employees;
alter table copy_employees add constraint copy_emp_pk primary key (employee_id);

update copy_employees set manager_id=100 where deparetment_id=50 or department_id=80;

/*
-- 4
Write an SQL query that will display for every country in the countries table, the number of
employees and their corresponding average salary in the employees table that are in a department
whose location is in that country. The output should contain three columns: the country name,
the number of employees, and the average salary for those employees. Round the average salaries
to the nearest integer. There should be an output for each country, even if there is no employee in
that country
*/

select c.country_name, count(e.employee_id), round(avg(e.salary))
from countries c
left join locations l on l.country_id=c.country_id
left join departments d on d.location_id=l.location_id
left join employees e on e.department_id=d.department_id
group by c.country_name;


select c.country_name, count(e.employee_id), round(avg(e.salary))
from hr.countries c
left join hr.locations l on l.country_id=c.country_id
left join hr.departments d on d.location_id=l.location_id
left join hr.employees e on e.department_id=d.department_id
group by c.country_name;




/*
-- 5
Write an SQL query that will display the total salary of all employees in the employees table broken
down by job title of each job id. The output should contain two columns: job title and total salary.
Only include those employees that were hired in the 1990s. There should be an output for every
job, regardless of if there is an employee that matches the criteria.
*/
