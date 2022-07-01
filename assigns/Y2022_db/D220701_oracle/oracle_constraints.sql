SQL> insert into instructor values('63395', 'McKinnon', 'Cybernetics', 94333.99);
insert into instructor values('63395', 'McKinnon', 'Cybernetics', 94333.99)
*
ERROR at line 1:
ORA-00001: unique constraint (C##TEST01.SYS_C0016181) violated


SQL> alter table instructor disable primary key;
alter table instructor disable primary key
*
ERROR at line 1:
ORA-02297: cannot disable constraint (C##TEST01.SYS_C0016181) - dependencies
exist



SQL> select * from user_constraints a where a.constraint_type = 'R'  and a.table_name ='teaches';

no rows selected

SQL>
SQL> drop table teaches;

Table dropped.

SQL> drop table advisor;

Table dropped.

SQL> alter table instructor disable primary key;

Table altered.

SQL> insert into instructor values('63395', 'McKinnon', 'Cybernetics', 94333.99);

1 row created.

SQL> alter table instructor enable primary key;
alter table instructor enable primary key
*
ERROR at line 1:
ORA-02437: cannot validate (C##TEST01.SYS_C0016181) - primary key violated


SQL> delete from instructor where id='63395' and name='McKinnon';

2 rows deleted.

SQL> alter table instructor enable primary key;

Table altered.
--

SQL>
SQL> insert into instructor values('99053', 'Dale', 'Cybernetics1', 93348.83);
insert into instructor values('99053', 'Dale', 'Cybernetics1', 93348.83)
*
ERROR at line 1:
ORA-02291: integrity constraint (C##TEST01.SYS_C0016182) violated - parent key
not found


SQL> insert into department values('Cybersecurity', 'Rauch', null);

1 row created.

SQL> insert into instructor values('99053', 'new teacher', 'Cybersecurity', 93348.83);

1 row created.

SQL> delete from department where dept_name='Cybersecurity';

1 row deleted.

SQL> select * from instructor where ID='99053';

ID    NAME                 DEPT_NAME                SALARY
----- -------------------- -------------------- ----------
99053 new teacher                                 93348.83



create table instructor
	(ID			varchar(5),
	 name			varchar(20) not null,
	 dept_name		varchar(20),
	 salary			numeric(8,2) check (salary > 29000),
	 primary key (ID),
	 constraint fk_inst_dept foreign key (dept_name) references department (dept_name)
		on delete set null
	);



SQL> alter table instructor drop constraint fk_inst_dept;

Table altered.


SQL> alter table instructor add constraint fk_inst_dept foreign key (dept_name) references department(dept_name);

Table altered.
SQL> insert into department values('Cybersecurity', 'Rauch', null);

1 row created.

SQL> insert into instructor values('99054', 'new teacher', 'Cybersecurity', 93348.83);

1 row created.

SQL> delete from department where dept_name='Cybersecurity';
delete from department where dept_name='Cybersecurity'
*
ERROR at line 1:
ORA-02292: integrity constraint (C##TEST01.FK_INST_DEPT) violated - child
record found


--

SQL>
SQL>


SQL> alter table takes add constraint uni_id_course_sems unique(ID, course_id,sec_id, semester);

Table altered.

SQL> insert into takes values('65901', '401', '1', 'Fall', 2003, 'B');
insert into takes values('65901', '401', '1', 'Fall', 2003, 'B')
*
ERROR at line 1:
ORA-00001: unique constraint (C##TEST01.SYS_C0016195) violated


SQL> insert into takes values('65901', '401', '1', 'Fall', 2022, 'B');
insert into takes values('65901', '401', '1', 'Fall', 2022, 'B')
*
ERROR at line 1:
ORA-00001: unique constraint (C##TEST01.UNI_ID_COURSE_SEMS) violated





SQL> alter table takes disable constraint uni_id_course_sems;

Table altered.

SQL> insert into takes values('65901', '401', '1', 'Fall', 2022, 'B');
insert into takes values('65901', '401', '1', 'Fall', 2022, 'B')
*
ERROR at line 1:
ORA-02291: integrity constraint (C##TEST01.SYS_C0016196) violated - parent key
not found


SQL> insert into takes values('65901', '401', '1', 'Fall', 2004, 'B');
insert into takes values('65901', '401', '1', 'Fall', 2004, 'B')
*
ERROR at line 1:
ORA-02291: integrity constraint (C##TEST01.SYS_C0016196) violated - parent key
not found


SQL> insert into takes values('65901', '401', '1', 'Fall', 2003, 'B');
insert into takes values('65901', '401', '1', 'Fall', 2003, 'B')
*
ERROR at line 1:
ORA-00001: unique constraint (C##TEST01.SYS_C0016195) violated



SQL> alter table takes drop constraint uni_id_course_sems;

Table altered.

SQL> alter table instructor add constraint chk_salary check(salary<500000);

Table altered.

SQL> insert into instructor values('99999', 'McKinnon', 'Cybernetics', 600000);
insert into instructor values('99999', 'McKinnon', 'Cybernetics', 600000)
*
ERROR at line 1:
ORA-02290: check constraint (C##TEST01.CHK_SALARY) violated


