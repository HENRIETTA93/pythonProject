-- DATA2x01 Week 05 Helper file
-- NOTE:: You must run these lines one at time - the purpose is to look at the performance of each query!
-- Exercise 2)
	SELECT * FROM pg_indexes;

-- Exercise 3a)
	SELECT * FROM pg_indexes where schemaname <> 'pg_catalog'; -- you can alter this condition to see specific schemas, this filter is just to see all non-system schemas

-- Exercise 03b)
	set search_path to carHire; -- using the schema we set up with the Week05 schema file
-- equality queries
	SELECT * FROM Driver WHERE given_name = 'Eric';
	SELECT * FROM Driver WHERE family_name = 'Andrews';
-- aggregate on an equality query
	SELECT COUNT(*) FROM Vehicle WHERE year = 2005;
-- aggregate on a ranged query
	SELECT COUNT(*) FROM Vehicle WHERE year < 2005;
-- single attribute ranged query
	SELECT * FROM TripLog WHERE distance > 200;
-- single attribute, double predicate ranged query
	SELECT * FROM TripLog WHERE distance > 200 AND distance < 250;
-- triple attribute, double predicate ranged query
	SELECT * FROM TripLog WHERE distance > 200
						  AND (end_time-start_time) < (INTERVAL '1 hours');

-- Exercise 03d)
-- equality queries
	EXPLAIN ANALYZE SELECT * FROM Driver WHERE given_name = 'Eric';
	EXPLAIN ANALYZE SELECT * FROM Driver WHERE family_name = 'Andrews';
-- aggregate on an equality query
	EXPLAIN ANALYZE SELECT COUNT(*) FROM Vehicle WHERE year = 2005;
-- aggregate on a ranged query
	EXPLAIN ANALYZE SELECT COUNT(*) FROM Vehicle WHERE year < 2005;
-- single attribute ranged query
	EXPLAIN ANALYZE SELECT * FROM TripLog WHERE distance > 200;
-- single attribute, double predicate ranged query
	EXPLAIN ANALYZE SELECT * FROM TripLog WHERE distance > 200 AND distance < 250;
-- triple attribute, double predicate ranged query
	EXPLAIN ANALYZE SELECT * FROM TripLog WHERE distance > 200
						  AND (end_time-start_time) < (INTERVAL '1 hours');
						  
-- Exercise 3e)
-- Create indices
	CREATE INDEX distance_triplog_ind ON TripLog (distance);
	CREATE INDEX car_id_triplog_ind ON TripLog (car_id);
	CREATE INDEX driver_id_triplog_ind ON TripLog (driver_id);
	CREATE INDEX vehicle_year_ind ON Vehicle (year);
	
-- Exercise 3f)
-- Clear the query planner
VACUUM ANALYZE; -- This will only work without warnings on a personal installation - you do not have the requisite priveleges on the system tables on university machines.
-- equality queries
	EXPLAIN ANALYZE SELECT * FROM Driver WHERE given_name = 'Eric';
	EXPLAIN ANALYZE SELECT * FROM Driver WHERE family_name = 'Andrews';
-- aggregate on an equality query
	EXPLAIN ANALYZE SELECT COUNT(*) FROM Vehicle WHERE year = 2005;
-- aggregate on a ranged query
	EXPLAIN ANALYZE SELECT COUNT(*) FROM Vehicle WHERE year < 2005; 
-- single attribute ranged query
	EXPLAIN ANALYZE SELECT * FROM TripLog WHERE distance > 200;
-- single attribute, double predicate ranged query
	EXPLAIN ANALYZE SELECT * FROM TripLog WHERE distance > 200 AND distance < 250;
-- triple attribute, double predicate ranged query
	EXPLAIN ANALYZE SELECT * FROM TripLog WHERE distance > 200
						  AND (end_time-start_time) < (INTERVAL '1 hours');