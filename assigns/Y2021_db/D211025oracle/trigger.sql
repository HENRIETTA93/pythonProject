/*

1. Assume that the film_id should be automatically populated when a new film is added. Write a SQL statement to create a sequence object to generate values for this column. The sequence, named FILM_ID_SEQ, should start from 20,010 and increment by 10.
2. Write a SQL statement to create an Oracle trigger called BI_FILM_ID that binds the sequence object FILM_ID_SEQ to the film_id column, i.e., the trigger populates values of FILM_ID_SEQ to the film_id column when a new film is added.
3. Write a SQL statement to create an Oracle trigger BI_FILM_DESP that appends text to the description of every new film inserted into the database. The text is based on the rating, the language, and the original language of the film. The format of the text you append should be as follows (replacing tokens):
<rating>-<seq>: Originally in <original language>. Re-released in <language>.
Here, <seq> is the sequence number of the film with that <rating>, and <original language> and <language> should be the name of the language from the language table.
Hint: You might need to use some built-in functions for string manipulation such as TO_CHAR, CONCAT, SUBSTR, INSTR, etc.
 */

 -- 1
create sequence FILM_ID_SEQ
start with 20010
increment by 10;

-- 2
create trigger BI_FILM_ID
before insert on film for each row
begin
select FILM_ID_SEQ.nextval into :new.film_id from dual;
end;


-- 3
-- drop trigger BI_FILM_DESP;

create trigger BI_FILM_DESP
before insert on film for each row
begin
select :new.rating||'-'||(select count(*)+1 from film where rating=:new.rating)||': '||'Originally in '|| (select name
from language where language_id=:new.original_language_id)
||'.'||'Re-released in '||(select name
from language where language_id=:New.language_id) ||'.'
into :new.description from dual;
end;

/*
test:
INSERT INTO film (title, description, language_id, original_language_id, rating)
VALUES ('B Movie', 'Movie about wasps.', 1, 2, 'PG');
 SELECT description FROM film WHERE film_id = 20010;
*/

