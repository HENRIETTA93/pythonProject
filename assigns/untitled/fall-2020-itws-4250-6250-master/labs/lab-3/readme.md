# Lab 3

This lab has two goals:
1. It will give you a chance to explore some of the concepts related to connecting to a Postgres database from python code
2. It will help you explore the `information_schema` to learn more about a database catalog

## Setup

This lab relies on the same restaurant database (more or less) as Homework 4 (and 5). If you haven't already, you can set up the database by running `restaurant-setup.sql` as the `postgres` (or other superuser) user:

```
psql -U postgres postgres < restaurant-setup.sql
```

Unlike Homework 4, there are no unit tests here. You will run the code manually yourself. That includes populating the database yourself:

```
psql -U restaurant restaurant < restaurant-data.sql
```

Make sure you run the script as the `restaurant` user (as in the example above), rather than the `postgres` or other superuser. Otherwise, the unit tests for the homeworks won't be able to modify the `testing` schema, which will cause problems.

## Assignment 

Make modifications to, or insert code into, the `lab-3.py` file for each of the objectives below. For the below questions, add your answers to the `notes.md` file in the appropriate places.

### Reading from the cursor

Note how many records are returned by the first call to `fetchmany()`. Is that what you would have expected?

Modify the `read_from_cursor()` method by adding a single line so that the `remaining_records` variable contains all of the remaining records returned by the query.

Comment out the line you created, and modify the second call to `fetchmany()` so that it has the same effect.

What's the difference between the two approaches? Why might you consider one over the other?

### Query Parameters

Modify the `examine_query()` method so that it prints the query that the `cursor` will send to the database after the parameters have been properly added.

Look at the output generated when your function examines the various query-parameter pairs defined in `query_parameters()`

How does `psycopg2` determine what datatype to use?

Does it always make choices that will lead to valid SQL?

What are the implications for constructing a query that would accept user input in the form of a string and conducting a wildcard search using that string? Are there ways around that difficulty?

### Information Schema

Using the [documentation](https://www.postgresql.org/docs/12/information-schema.html) for the Information Schema, you should be able to create queries to retrieve information about the `testing` schema that's used by the code. Several suggested queries are in the `explore_information_schema()` method, and you should work to create the queries suggested. You can use the `run_query()` and `print_records()` helper methods.

While obviously you could look in the `.sql` file that creates the schema to obtain much of the information (not all of it), it's very uncommon in a production application that a single such file exists. In the best cases, the application maintains a set of *migration* files, each of which is run on the database as it exists at the time the file was written (database schema typically evolve over time with the application), and the state of the database schema is only represented by the layered application of those migration files. In worse cases, it's possible a database administrator simply made the changes to the production system and left no record of what was done. Either way, the `information_schema` (and in Postgres the `db_catalog`) provides a way to learn about the current state of the schema.

## Submission

Submit both your `notes.md` file and your modified `lab-3.py` file to Submitty. There is no autograder component for this assignment.

As with other labs, you may work in teams of up to 3 students.

The lab is due at **11:59pm on Thursday October 22**.