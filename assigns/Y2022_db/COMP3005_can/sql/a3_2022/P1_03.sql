/*
Problem 1.3 List the names of all the subscribers who are originators of a call to someone who is also a subscriber on the same switch (i.e. a line to line call)
*/

SELECT
	subscribers.name
FROM
	subscribers
	JOIN calls ON calls.orig = subscribers.portid
	JOIN subscribers s2 ON s2.portid = calls.term;

/*
Test Output:

name
--------------
Mats Sundin
Jason Allison
Homer Simpson
Michael Jordan
Ed Belfour
*/