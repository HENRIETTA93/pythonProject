# Transactions in SQL

So far, we've only considered one user modifying the database. In reality, it's more complicated

SQL provides some tools to help deal with the common situation where multiple users are making changes concurrently, or where operations fail to fully execute

## Serializability

In many applications (web applications, banking, reservations, etc.) we might need to support hundreds or thousands of operations per second.

It's possible that some of these operations will overlap on the same data.

Consider a course registration system:

We want to check the availability of a course, and register if there's space

``` 
User A          User B
------          -------
Checks open
                Checks open
Registers                  
                Registers (problem)


```

SQL allows a database programmer to state that a certain set of commands must execute as if they were performed serially

This is commonly implemented by locking certain data elements, so that only one function can access them at a time

## Atomicity

It's possible for a crash or interruption to leave the database in an unacceptable state

Example: bank transfer

We want to send $100 from A to B

``` 
command         A           B
check A         $200        $50
deduct from A   $100        $50
----Failure Here-----
add to B        $100        $150
```

SQL provides us with a way to state that a set of commands should execute atomically (all or nothing)

## Transactions

SQL supports both with Transactions

A transaction is a collection of one or more SQL statements that must be executed Atomically

SQL also requires that, by default, transactions be executed in a serial manner 

When we use a generic SQL interface, each statement is in a transaction by itself 

Use the SQL command: `START TRANSACTION` (or `BEGIN` in postgres) to start a transaction

From there, there are two ways to end:
- `COMMIT` ends the transaction successfully: SQL makes its effects permanent
    - Prior to that, any changes are tentative and may or may not be visible to other transactions
- `ROLLBACK` aborts all the modifications made during the transaction

Note that in Postgres, if any statement throws an error, the transaction must be rolled back.  

### Read Only Transactions

Previous examples (registration and bank) required a read and a write

Difficult to parallelize 

If a transaction only reads data, we can parallelize 

Example: a query that checks the availability of a class without making changes 

If we can mark a transaction as Read Only, SQL can potentially leverage that information

`SET TRANSACTION READ ONLY` sets the next transaction to read only 

This must be done before the transaction begins

(In postgres, it's the opposite) 

`SET TRANSACTION READ WRITE` is the default

### Dirty Read

*Dirty Data* is the common term for data that has been written by a transaction that hasn't yet committed

A *dirty read* is a read of dirty data by another transaction

The risk in a dirty read is that the transaction that wrote it may abort 

Dirty reads avoid:
- Time consuming work of the DBMS needed to avoid them 
- Loss of parallelism that results from waiting 

We can indicate that dirty reads are acceptable:

`SET TRANSACTION READ WRITE SET ISOLATION LEVEL READ UNCOMMITTED`

Note that we still specify `READ WRITE` because otherwise setting the isolation level to `READ UNCOMMITTED` overrides the default and makes it `READ ONLY` 

Other isolation levels:
- `READ COMMITTED`
- `REPEATABLE READ`
- `SERIALIZABLE`

Postgres doesn't implement `READ UNCOMMITTED`

`READ COMMITTED` will execute each query using data that was committed before execution began. It can change if other transactions commit between executions

`REPEATABLE READ` will use a snapshot of the database the way it was before the statement execution began. It's possible that other transactions will add "phantom tuples" to the result between executions 

`SERIALIZABLE` will execute as if it were the only thing running

# SQL Constraints

Constraints (and Triggers) are both "active" elements: an expression or statement we write once and store in the database, expecting the element to execute at the appropriate time. 

A big problem faced when writing a database application is that new information can be wrong in a variety of ways. 

We could have our application code validate all input, but it's better to have the database do it

- Checks only need to be written once 
- Efficiency improvement 

SQL provides a variety of ways for expressing *integrity constraints* as part of a database schema. 

Constraints on attributes, tuples, relations, various events

## Keys and Foreign Keys

We've already discussed keys: `PRIMARY KEY`, `UNIQUE` 

Foreign keys express referential integrity constraints: they declare that values for certain attributes must make sense. 

The values for some set of attributes of each tuple of some relation R must exist in some tuple in some other relation S

When we declare some set of attributes a foreign key, we make two claims:
1. The referenced attributes of the second relation must be declared `PRIMARY KEY` or `UNIQUE` 
2. Values of the foreign key appearing in the first relation must also appear in the referenced attributes of some tuple in the second relation

Two ways to declare in the `CREATE TABLE` or `ALTER TABLE` statement:
- `attribute type REFERENCES table(attribute)`
- at the end: `FOREIGN KEY (attributes) REFERENCES table(attributes)`

Example:

```postgresql
DROP TABLE enroll;

CREATE TABLE enroll(
    student_email VARCHAR(255) REFERENCES student(email) 
        ON UPDATE CASCADE
        ON DELETE SET NULL,
    course_name VARCHAR(255),
    semester CHAR(3),
    registered TIMESTAMP DEFAULT now(),
    FOREIGN KEY (course_name, semester) REFERENCES course(name, semester)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

ALTER TABLE enroll ADD FOREIGN KEY (student_email) REFERENCES student(email);
ALTER TABLE enroll ADD FOREIGN KEY (course_name, semester) REFERENCES course(name, semester);
```


### Maintaining Referential Integrity

Once we declare a foreign key, the DBMS will prevent the following:
1. `INSERT` of a new tuple whose values for the foreign key are not null or present in the referenced table
2. `UPDATE` the value to one that is not present in the referenced table
3. We try to delete the referenced tuple 
4. We try to update the referenced tuple


Can't do:

```postgresql
INSERT INTO enroll (student_email, course_name, semester)
VALUES ('email@example.com', 'American Literature', 'F20');

UPDATE enroll SET course_name='American Literature', semester='F20' WHERE course_name ilike 'data%';

DELETE FROM course WHERE name='Database Applications and Systems' AND semester='F20';

UPDATE course SET name='Advanced Database Systems course' WHERE name='Database Applications and Systems' AND semester='F20';



SELECT * FROM enroll;
```



For the first two situations, there is no alternative but to reject the change. 

However, for the last two situations, there are three approaches that can be taken:
- Default policy: reject the change 
- Cascade policy: changes to the referenced attribute are mimicked at the foreign key
- Set-Null policy: changes are allowed. The referring values are set to NULL

```postgresql
UPDATE student SET email='carol@example.com' WHERE email='carol@example.co.uk';

DELETE FROM student WHERE email='bob@example.com';

SELECT * FROM course;

UPDATE course SET semester='S21' WHERE name='Tech Studies';

DELETE FROM course WHERE name='Tech Studies';

```

#### Note on foreign keys and dangling tuples

Dangling tuples don't participate in a join. So dangling tuples are those that would violate the foreign key constraint.

### Deferred Checking of Constraints

Example: we want to add a constraint that every course has a professor, and that every professor must teach at least one course.

```postgresql
DROP TABLE professor;
CREATE TABLE professor(
    name VARCHAR(255) PRIMARY KEY,
    dept CHAR(4) NOT NULL
);

DROP TABLE teaching;
CREATE TABLE teaching(
    course_name VARCHAR(255),
    semester CHAR(3),
    professor VARCHAR(255) UNIQUE REFERENCES professor(name) DEFERRABLE INITIALLY DEFERRED
);

ALTER TABLE professor ADD FOREIGN KEY (name) REFERENCES teaching(professor) DEFERRABLE INITIALLY DEFERRED;

INSERT INTO professor(name, dept) VALUES('Johnson', 'ITWS');
INSERT INTO teaching VALUES('Database Applications and Systems', 'F20', 'Johnson');

```

In case of circular constraints, we can designate a constraint as `DEFERRABLE` telling SQL to defer checking the constraint until the transaction commits

`... REFERENCES table(attributes) DEFERRABLE INITIALLY DEFERRED `

## Constraints on Attributes and Tuples

In a `CREATE TABLE` statement, we can declare two kinds of constraints:
- Constraints on a single attribute
- Constraints on a tuple as a whole

Simplest single-attribute constraint is `NOT NULL` 

### Check contraints

More complex constraints can be attached to an attribute definition using the `CHECK` keyword

`attribute type CHECK(condition)`

- Can refer to the attribute being checked or another attribute on the relation
- Other relations' attributes must be introduced as a subquery 
- Can be anything that would appear in a WHERE clause

We can add to the list of attribute, key, etc. definitions: `CHECK(condition)` of a CREATE TABLE statement

```postgresql
ALTER TABLE course ADD CHECK (capacity > 0);

CREATE TABLE enroll2(
    student_email VARCHAR(255) CONSTRAINT not_ideal_check CHECK ( 
        student_email IN (
            SELECT email FROM student
        )
    )
);

INSERT INTO enroll2 VALUES('alice@example.com');
DELETE FROM student WHERE email='alice@example.com';
```

Note that attribute and tuple-based checks are only done when tuples are inserted into or updated in the relation where the check is defined.  

We use triggers or assertions if more integrity is needed.

## Modifying Constraints

Constraints have na1mes: `attribute type CONSTRAINT name PRIMARY KEY `

If we don't define one, SQL creates one

Once they're named, we can modify:

`ALTER TABLE enroll2 DROP CONSTRAINT not_ideal_check`

## Assertions

An assertion is a boolean value expression that must be true at all times 

Postgres doesn't support assertions