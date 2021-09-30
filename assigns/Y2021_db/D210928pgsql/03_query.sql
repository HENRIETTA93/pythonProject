-------------------------------
-- 3
-------------------------------

select e1.first_name || ' '|| e1.last_name as employee_full_name, e1.title as employee_title,
extract(year from e1.hire_date)-extract(year from e1.birth_date) as employee_age,
e2.first_name || ' '||e2.last_name as manager_full_name,
e2.title as manager_title
from employees e1 left join employees e2
on e1.reports_to=e2.employee_id
order by employee_age, employee_full_name;
