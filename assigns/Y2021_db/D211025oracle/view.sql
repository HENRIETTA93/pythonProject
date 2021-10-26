/*
Task 3 – Views
1. Write a SQL statement to find the ‘Action’ (category) films with the shortest running
time (length). Your query should output the titles and lengths of the films.
2. Write a SQL statement to create a (virtual) view called MIN_ACTION_ACTORS
that contains all the actors who have acted in the films you obtained in Task 3.1.
The view should include the columns actor_id, first_name, and last_name. (Note:
Each actor should only appear once in the view, even if they may have acted in
multiple films)
3. Write a SQL statement to create a (virtual) view called V_ACTION_ACTORS_2012
that lists the ids, first names and last names of all the actors who have acted in an
‘Action’ film released in the year 2012. (Note: There should be no duplicate rows
in the view, similar to Task 3.2)
Example: Assume the following film is inserted into the database, which is the
5th film with a rating ‘PG’ (i.e., there are already 4 films with the rating ‘PG’ in the
database), and the current FILM_ID_SEQ value is 20,010.
INSERT INTO film (title, description, language_id, original_language_id, rating)
VALUES (‘B Movie’, ‘Movie about wasps.’, 1, 2, ‘PG’);
It should produce the following result when the following SQL statement is run:
SQL> SELECT description FROM film WHERE film_id = 20010;
DESCRIPTION
-----------------------------------------------------------------------------------------
Movie about wasps.PG-5: Originally in Italian. Re-released in English.
4. Write a SQL statement to create a materialized view MV_ACTION_ACTORS_2012
that lists the same information as in Task 3.3.
5. Execute the following two SQL statements and report their query execution time.
Question: Did the materialized view speed up the query processing? Explain your
answer. (Hint: You should look at both the elapsed time and the cost in the query
execution plan)
SELECT * FROM V_ACTION_ACTORS_2012;
SELECT * FROM MV_ACTION_ACTORS_2012;
Note: For any task mentioning the execution time, please run the queries on a
computer with a HDD rather than an SSD, so that the timing difference is noticeable.
All lab computers have HDDs and are appropriate for such task.
*/

-- 1
create view MIN_ACTIONS_FILM
as
select f.title, min(f.length) as length
from film f join film_category fc on f.film_id=fc.film_id
join category c on c.category_id=fc.category_id
where c.name='Action';

-- 2
create view MIN_ACTION_ACTORS
as
select distinct a.actor_id, a.first_name, a.last_name
from actor a join film_actor fa on a.actor_id=fa.actor_id
join film f on f.film_id=fa.film_id
join MIN_ACTION_FILM v1 on v1.title=f.title;

-- 3
create view V_ACTION_ACTORS_2012
as
select distinct a.actor_id, a.first_name, a.last_name
from actor a join film_actor fa on a.actor_id=fa.actor_id
join film f on f.film_id=fa.film_id
join film_category fc on fc.film_id
join category c on c.category_id=fc.category_id
where c.name='Action' and f.release_year=2012;

-- 4
create materialized view MV_ACTION_ACTORS_2012
as
select distinct a.actor_id, a.first_name, a.last_name
from actor a join film_actor fa on a.actor_id=fa.actor_id
join film f on f.film_id=fa.film_id
join film_category fc on fc.film_id
join category c on c.category_id=fc.category_id
where c.name='Action' and f.release_year=2012;

-- 5

