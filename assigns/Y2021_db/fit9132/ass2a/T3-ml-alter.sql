--****PLEASE ENTER YOUR DETAILS BELOW****
--T3-ml-alter.sql

--Student ID:
--Student Name:
--Tutorial No:

/* Comments for your marker:




*/

-- 3 (a)



ALTER TABLE book_copy ADD book_status CHAR(1) DEFAULT 'G' NOT NULL;

ALTER TABLE book_copy ADD CONSTRAINT book_status_chk CHECK (book_status IN ('G','D','L'));

UPDATE book_copy SET book_status='D'
WHERE branch_code=(SELECT branch_code FROM branch WHERE branch_contact_no='0395413120')
AND bc_id=(SELECT bc_id FROM book_copy WHERE book_call_no='005.74 C824C' AND branch_code=(SELECT branch_code FROM branch WHERE branch_contact_no='0395413120'));

COMMIT;

-- 3 (b)

ALTER TABLE loan ADD return_branch NUMBER(2);
UPDATE loan SET return_branch=branch_code;
COMMIT;


-- 3 (c)



DROP TABLE branch_manager PURGE;
CREATE TABLE branch_manager(
branch_code NUMBER(2) NOT NULL,
man_id NUMBER(2) NOT NULL,
collection CHAR(1)
);
ALTER TABLE branch_manager ADD CONSTRAINT branch_man_pk PRIMARY KEY (branch_code, man_id);
ALTER TABLE branch_manager ADD CONSTRAINT branch_man_fk1 FOREIGN KEY (branch_code) REFERENCES branch(branch_code);
ALTER TABLE branch_manager ADD CONSTRAINT branch_man_fk2 FOREIGN KEY (man_id) REFERENCES manager(man_id);

INSERT INTO branch_manager
SELECT branch_code,man_id,NULL
FROM branch;

ALTER TABLE branch DROP COLUMN man_id;

UPDATE branch_manager SET collection='R'
WHERE branch_code=(SELECT branch_code FROM branch WHERE branch_contact_no='0395413120')
AND man_id=10;

INSERT INTO branch_manager VALUES(
(SELECT branch_code FROM branch WHERE branch_contact_no='0395413120'),
12,
'F'
);
COMMIT;
