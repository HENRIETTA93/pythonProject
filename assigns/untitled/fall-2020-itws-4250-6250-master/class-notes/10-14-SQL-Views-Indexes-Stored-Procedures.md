# Views

Relations defined by `CREATE TABLE` statements actually exist in the database. (Physically stored somewhere on disk)

Another type of relation in SQL: (virtual) View.

Views do not exist physically
- Defined by an expression (like a query)
- Can be queried as if they existed
    - Sometimes can be modified/updated 

## Declaring Views

Simplest form: `CREATE VIEW name AS query`

Example: all database students:

```postgresql
CREATE VIEW database_students AS
SELECT email, major, name
FROM student, enroll
WHERE email = student_email
AND course_name ilike '%database%';

SELECT * FROM database_students;

```

Note the distinction between Relation, Table, and View:
- Both Table and View are relations 
- However, the distinction between them matters both for performance and capability

## Querying views

A view may be queried exactly as if it were a stored table


**Renaming attributes**: we can specify a different set of attribute names if we want to

`CREATE VIEW myView(a1, a2) AS SELECT b1, b2 FROM ...`

```postgresql
CREATE VIEW db_students2(student_email, major, student_name) AS
SELECT email, major, name
FROM student, enroll
WHERE email = student_email
AND course_name ilike '%database%';
```

## Modifying/Updating views

Simplest modification is to drop the view: `DROP VIEW name`
- Note the difference between this and `DROP TABLE name` 

Consider:
`INSERT INTO database_students(email, major, name) VALUES('g@example.com', 'ARCH', 'george');`

In may cases, the answer is, we can't do that

A subset of views (updatable views) are simple enough that modification of the view can be translated into updates of actual tuples

When are modifications to a view permitted?

Generally, modifications are permitted on a view that is defined on some attributes of a relation R using a SELECT (not SELECT DISTINCT) statement when:
- The WHERE clause must not involve R in a subquery 
- The FROM clause involves a single instance of R and no other relation
- The list of attributes in the SELECT clause must include enough attributes that for every other attribute, we can fill in using default values and NULL

```postgresql
CREATE VIEW database_courses AS
SELECT name, semester
FROM course
WHERE name ilike '%data%';

```

In this case, an insertion into the view can be applied directly to the underlying relation (similar to an INSERT where not all of the values are specified)

```postgresql
INSERT INTO database_courses(name, semester) VALUES('Modern Databases', 'S21');

INSERT INTO database_courses(name, semester) VALUES('English Literature', 'S21');
```



DELETEs are similar to INSERTS: the statement is passed through to the underlying relation. However, the WHERE clause from the view definition is appended, to make sure that only tuples that were visible in the view are deleted

```postgresql
DELETE FROM database_courses WHERE semester='S21' AND name='Modern Databases';

DELETE FROM database_courses WHERE name ilike '%mining';

DELETE FROM course WHERE name ilike '%mining' AND name ilike '%data%';
```

## Materialized Views

A view describes how a new relation may be constructed from existing base tables 

If a view is used frequently enough, it may be efficient to *materialize* it: to store it all times. As with indexes, there's a cost associated with maintaining it. 

`CREATE MATERIALIZED VIEW name(columns) AS query`

Postgres provides other options, including whether or not the view should be materialized when the statement is run. 

We can configure the view to update itself periodically rather than on every change

# Indexes in SQL

Consider the query `SELECT * FROM course WHERE name='x' AND semester='S20'`

An *index* on an attribute A of a relation is a data structure that makes it easy to find all tuples with a fixed value for A

We could think of an index as a binary search tree of key-value pairs, where the attribute A is the key, and the value is the location of tuples containing A. 

The key for an index may be any attribute. It doesn't have to be a key for the relation. 

Or consider: 

```postgresql
SELECT * 
FROM course, enroll
WHERE name = course_name AND course.semester = enroll.semester;
```

With indexes we only need to consider the appropriate tuples from each relation. Otherwise, we'd have to consider the whole cross-product 

## Declaring indexes

Creation of indexes is implementation-specific 

`CREATE INDEX name ON table(columns) [TYPE]`

We can specify more than one column. But the order of the columns matters. You want to put the more used attribute first (generally) 

```postgresql
CREATE INDEX course_semester ON course(semester, name);
```

`DROP INDEX name`

## Selection of Indexes

Creation of indexes involves a tradeoff:

An index will greatly speed up queries involving the key attributes, may improve joins involving those attributes as well

However, every index slows down INSERT, UPDATE, and DELETE statements, as the index must be continually maintained 

### Useful indexes:

Often most useful index involves the key for a relation
- Queries involving a specific value for the key are common: the index will be used often
- There is at most one tuple for a given key, so either 0 or 1 page (disk) needs to be retrieved 

When an index is not on the key, there are two situations where it is commonly effective:
1. If the attribute(s) is almost a key: there are relatively few tuples with any given value 
2. If the tuples are "clustered" on that attribute. We "cluster" a relation on an attribute by grouping the tuples that share a value for that attibute into as few pages as possible. 



# Stored Procedures

PSM: Persistent Stored Modules

PSMs are an extension to SQL, provided by the implementation, that allows us to write procedures and store them in the database as part of the schema

Let's us do things we couldn't in just SQL

Each SQL implementation provides its own implementation of the language.

## Procedure declaration

``` 
CREATE PROCEDURE name (parameters)
<local declarations>
<procedure body>;
```

There's also `CREATE FUNCTION`, fundamentally the same, except it must return a value

Parameters are mode-name-type triples

Mode is
- `IN`
- `OUT`
- `INOUT` 

`IN` is default

Mode may be omitted

Function parameters may only be `IN`

## PL/pgSQL

We'll focus on PL/pgSQL, Postgres's procedural language

Why use a PSM?

- Code for maintaining the database stays with the database
- Saves round trips with data. Everything is executed on the database server

Postgres is very extensible. PSMs can be written in C, Perl, Tcl, and Python, as well as PL/pgSQL

It's also possible to create extensions in other languages. Open source options in Java, Lua, R, shell scripts, and JavaScript

## Syntax

```postgresql
CREATE FUNCTION name(params) RETURNS type 
AS 'function body text'
LANGUAGE plpgsql;
```

The function body is stored as a string-literal. By default, we'd then have to escape any single quotes or backslashes in the function body

We can use "dollar quoting" instead

```postgresql
CREATE FUNCTION name(params) RETURNS type 
AS $$
function body text
$$ LANGUAGE plpgsql;
```

Code is structured as blocks.

``` 
[<<label>>]
[DECLARE 
    declarations
]
BEGIN
    statements;
END [label]
```

Declarations and statements are terminated with a semi-colon `;`

Labels are usually optional, ending label is not required

Comments: `--`, `/* */`

Blocks can be nested, masking the outer block's variables. We can still access the outer block variables using the block's label. 

``` 
<<outerblock>>
DECLARE
    i
BEGIN
    i := 50;
    <<innerblock>>
    DECLARE
        i
    BEGIN
        i = outerblock.i - 25;
    END innerblock
END outerblock;
```

### Declarations

All variables used in a block must be declared

Variables can have any SQL datatype 

Also `ROW` and `RECORD` types.

`name type := expression`

Other options as well

We can use previously defined types

`myGradeTuple grade%ROWTYPE`
`myGrade grade.score%TYPE`

### Parameters

Parameters are named with `$1`, `$2`, etc

We can optionally give names 

`CREATE PROCEDURE foo(bar INT, baz INT OUT) RETURNS BOOLEAN AS $$...`

### Expressions

All expressions are processed using the server's SQL executor

Prepared Statement (which we won't cover)

```postgresql
SELECT *
FROM course, enroll, student
WHERE course.name = enroll.course_name 
AND course.semester= enroll.semester 
and student.email = enroll.student_email
and course ilike ?;
```

### Basic Statements

Assignment: `variable := expression` (can also use `variable = expression` in Postgres)

To execute a statement with no result (`INSERT`) by simply including the statement. (Also have `PERFORM` keyword)

Single row result: `SELECT attributes INTO target FROM...` or `INSERT ... RETURNING expressions INTO target`

We can optionally use the `STRICT` keyword. Throws an error if other than one row is returned.

### Control Structures

`RETURN expression` 

Other variants: RETURN NEXT expression, RETURN QUERY query, etc. builds a result set which is returned later.

`RETURN` by itself exits the function and returns the constructed set.

#### Conditionals

`IF ... THEN ... END IF` (also `ELSE`, `ELSIF`)

`CASE ... WHEN ... THEN ... END CASE`

Case statements are similar to IF statements but throw an error is nothing is matched

#### Loops

More or less what you'd expect from a programming language

``` 
[<<label>>]
LOOP 
    statements
END LOOP [label]
```

Can use `EXIT` or `CONTINUE`, `EXIT WHEN ...`

``` 
WHILE boolean-expression LOOP
    statements
END LOOP
```

``` 
FOR name IN expression .. expression [BY expression] LOOP
    statements --can use name here
END LOOP
```

More useful is the ability to loop through query results

``` 
FOR semester IN SELECT semester FROM course LOOP
    statements involving semester
END LOOP
```

#### Errors

By default any error thrown will abort both the function and the surrounding transaction

You can have an `EXCEPTION` block after the statements but before the `END` to catch errors

Error conditions are defined by both name and `SQLSTATE`, similar to an enumerated type.

You can call `RAISE` with a number of different arguments to raise an exception. 

`ASSERT condition, message` will RAISE an error with the defined message if `condition` is false



# Triggers

A database/schema element

Sometimes called "event-condition-action rules"

Differ from previously discussed constraints:
- Only awakened by certain events
- Once awakened, the trigger tests a condition 
- If the condition holds, some action is performed

The action might be something like 
- aborting a transaction
- updating a log table 

Can be potentially anything

The `CREATE TRIGGER` statement provides a number of options in the event, condition, and action parts.

Main features:
1. The check of the condition, and the action may be executed on either the state of the database before or after the triggering event is executed
2. The condition and action can refer to both the old and new values of tuples that were updated in the triggering event
3. It is possible to define events that are limited to a specific attribute or set of attributes
4. The programmer has the option of specifying that the trigger executes either:
    - Once for each modified tuple (row level trigger)
    - Once for each modifying statement that awakens the trigger (statement level trigger)
    
```postgresql
UPDATE course SET location='Remote' WHERE semester='S20' OR semester='F20';
```

## Triggers in Postgres

Unlike standard SQL, where the `CREATE TRIGGER` statement contains the code for the action to be taken, in Postgres we define a special type of function that will be attached to the trigger

Much is the same

``` 
CREATE TRIGGER name
AFTER UPDATE [OF attr] ON table
REFERENCING
    OLD ROW as oldTuple,
    NEW ROW as newTuple
FOR EACH ROW 
WHEN condition
EXECUTE PROCEDURE func(args);
```

Examples:

A trigger that makes sure we don't lower a grade
```postgresql
CREATE FUNCTION verify_grade_floor() RETURNS TRIGGER
AS $$
BEGIN
    IF OLD.grade > NEW.grade
        THEN RETURN NULL;
        ELSE RETURN NEW;
    END IF;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER grade_floor_trigger
BEFORE UPDATE ON grades
FOR EACH ROW
EXECUTE PROCEDURE verify_grade_floor();

SELECT * FROM grades;

UPDATE grades SET grade=0.78 WHERE student_email='alice@example.com' AND assignment='HW-2';
UPDATE grades SET grade=0.75 WHERE student_email='alice@example.com' AND assignment='HW-2';

```

A trigger that logs changes to grades
```postgresql
CREATE TABLE grade_log(
    student_email VARCHAR(255),
    old_grade FLOAT,
    new_grade FLOAT,
    updated TIMESTAMP
);

CREATE OR REPLACE FUNCTION log_grade_change() RETURNS TRIGGER 
AS $$
BEGIN
    INSERT INTO grade_log(student_email, old_grade, new_grade, updated) 
    VALUES(NEW.student_email ,OLD.grade, NEW.grade, now());

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER grade_change_trigger
AFTER UPDATE OF grade ON grades
FOR EACH ROW
WHEN (OLD.grade < NEW.grade)
EXECUTE PROCEDURE log_grade_change();

SELECT * FROM grade_log;
UPDATE grades SET grade=0.79 WHERE student_email='alice@example.com' AND assignment='HW-2';

```

A trigger that "curves" grade changes
```postgresql
CREATE OR REPLACE FUNCTION grade_curver() RETURNS TRIGGER 
AS $$ 
DECLARE 
    diff FLOAT;
    curved grades%ROWTYPE;
BEGIN
    diff := NEW.grade - OLD.grade;
    curved := NEW;
    curved.grade = NEW.grade - (diff / 2);
    IF diff < 0
    THEN RETURN curved;
    ELSE RETURN NEW;
    END IF;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER grade_curve_trigger
BEFORE UPDATE OF grade ON grades 
FOR EACH ROW
EXECUTE PROCEDURE grade_curver();
```