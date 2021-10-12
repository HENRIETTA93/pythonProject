--****PLEASE ENTER YOUR DETAILS BELOW****
--T2-ml-dm.sql

--Student ID:
--Student Name:
--Tutorial No:

/* Comments for your marker:




*/

-- 2 (b) (i)

INSERT INTO book_detail VALUES('005.74 C824C','Design, Implementation, and Management','R',793,TO_DATE('2019-01-01','YYYY-MM-DD'), 13);

INSERT INTO book_copy
SELECT branch_code,(SELECT MAX(bc_id)+1 FROM book_copy WHERE branch_code=(SELECT branch_code FROM branch WHERE branch_contact_no='0395413120')),120,'N','005.74 C824C'
FROM branch WHERE branch_contact_no='0395413120'

UNION
SELECT branch_code,(SELECT MAX(bc_id)+1 FROM book_copy WHERE branch_code=(SELECT branch_code FROM branch WHERE branch_contact_no='0395601655')),120,'N','005.74 C824C'
FROM branch WHERE branch_contact_no='0395601655'

UNION
SELECT branch_code,(SELECT MAX(bc_id)+1 FROM book_copy WHERE branch_code=(SELECT branch_code FROM branch WHERE branch_contact_no='0395461253')),120,'N','005.74 C824C'
FROM branch WHERE branch_contact_no='0395461253';

COMMIT;





-- 2 (b) (ii)



DROP SEQUENCE SEQ_BORROWER;

CREATE SEQUENCE SEQ_BORROWER
INCREMENT BY 1
START WITH 100
MAXVALUE 999999
NOCYCLE
NOCACHE;

DROP SEQUENCE SEQ_RESERVE;

CREATE SEQUENCE SEQ_RESERVE
INCREMENT BY 1
START WITH 100
MAXVALUE 999999
NOCYCLE
NOCACHE;



-- 2 (b) (iii)

INSERT INTO borrower VALUES (
SEQ_BORROWER.NEXTVAL,
'Ada',
'LOVELACE',
'2 Alphabet Way',
'Alphaville',
2000,
(SELECT branch_code FROM branch WHERE branch_contact_no='0395413120')
);


INSERT INTO reserve VALUES (SEQ_RESERVE.NEXTVAL,
(SELECT branch_code FROM branch WHERE branch_contact_no='0395413120'),
(SELECT bc_id FROM book_copy WHERE book_call_no='005.74 C824C' AND branch_code=(SELECT branch_code FROM branch WHERE branch_contact_no='0395413120')),
TO_DATE('2021-09-14 15:30:00','YYYY-MM-DD HH24:MI:SS'),
(SELECT bor_no FROM borrower WHERE bor_fname='Ada' AND bor_lname='LOVELACE')
);
commit;




-- 2 (b) (iv)


INSERT INTO loan VALUES(
(SELECT branch_code FROM branch WHERE branch_contact_no='0395413120'),
(SELECT bc_id FROM book_copy WHERE book_call_no='005.74 C824C' AND branch_code=(SELECT branch_code FROM branch WHERE branch_contact_no='0395413120')),
TO_DATE('2021-09-21 12:30:00','YYYY-MM-DD HH24:MI:SS'),
TO_DATE('2021-10-21 23:59:59','YYYY-MM-DD HH24:MI:SS'),
NULL,
(SELECT bor_no FROM borrower WHERE bor_fname='Ada' AND bor_lname='LOVELACE')
);

DELETE FROM reserve WHERE
branch_code=(SELECT branch_code FROM branch WHERE branch_contact_no='0395413120')
AND bc_id=(SELECT bc_id FROM book_copy WHERE book_call_no='005.74 C824C' AND branch_code=(SELECT branch_code FROM branch WHERE branch_contact_no='0395413120'))
AND reserve_date_time_placed=TO_DATE('2021-09-14 15:30:00','YYYY-MM-DD HH24:MI:SS');

commit;
