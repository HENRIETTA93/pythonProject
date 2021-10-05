# Lab 2

In this lab, you will create SQL files to create tables in a schema, add data to those tables, and run a few simple queries against that data.

You may work in teams of up to three students, but make sure each of you understands the process.

This lab is **due to Submitty by 23:59pm** on Thursday October 1. 

## Summary

Consider a very basic schema for a public library, which contains the following relations:

- `Book(barcode, isbn, title, author)`
    - barcode is the key
    - barcode is a number between 0 and 9,999,999,999
    - isbn should be considered a string between 10 and 21 characters in length
    - title and author are both strings up to 127 characters in length
- `Patron(card_number, branch, name, phone_number, email)`
    - `(card_number, branch)` is the key
    - card_number is a number between 0 and 1,000,000
    - branch is a string up to 63 characters in length
    - name is a string up to 127 characters in length
    - phone number is a 10-digit number
    - email is a string up to 255 characters in length
- `Checkout(barcode, card_number, branch, checkout_time, due_date)`
    - Has no defined key
    - barcode refers to the Book barcode
    - card_number and branch refer to the Patron
    - checkout_time is the exact checkout time (regardless of where the server is located)
    - due_date is the day the book is due


## Setup

Run the following as a superuser (usually `postgres`) on your local postgres installation from Lab 1:

```postgresql
DROP DATABASE IF EXISTS lab_db;
CREATE DATABASE lab_db;

DROP USER IF EXISTS lab_owner;
CREATE USER lab_owner WITH PASSWORD 'insecure-password';

GRANT ALL PRIVILEGES ON DATABASE lab_db TO lab_owner;

```

Then you should be able to connect to your instance as the `lab_owner` user. Some variant of:

`psql -U lab_owner lab_db`

And as in Lab 1, you can run an arbitrary SQL file from the command line (from your host OS, not from the psql shell):

`psql -U lab_owner lab_db < file.sql`

You can clean up your work at any time by dropping the database and re-creating it by re-running the statements above. (Feel free to put them into a cleanup file you can run as a superuser, if you want.)

## Assignment

You will create four SQL files:
- `schema.sql`
- `data.sql`
- `1.sql`
- `2.sql`

### `schema.sql`

This file needs to contain three `CREATE TABLE` statements, one for each of the relations specified above. Make sure you choose appropriate data types and define the keys properly (where specified).

For the `Checkout` relation, don't worry about creating referential integrity constraints (we haven't covered that in class yet).

### `data.sql`

Create statements to insert data representing the following:

- Library patron "Bill Smith", card number 256, "Troy" branch, phone number (518) 555-1234, bsmith@example.com
- Library patron "Annie Rivera", card number 562, "Troy" branch, phone number (518) 555-7384, ar@example.com
- Book "The Lord of the Rings" by "J. R. R. Tolkien" ISBN `978-0618640157`, barcode 5837239683
- Book "Database Systems: The Complete Book" by "Hector Garcia-Molina" ISBN `0131873253`, barcode 234
- Book "Ender's Game" by "Orson Scott Card" ISBN `978-1608872770` barcode 488329
- Annie Rivera checks out Lord of the Rings at 2:35pm EST on February 15, 2020, due March 14, 2020
- Bill Smith checked out Lord of the Rings at 10:01am EST on December 1, 2019, due December 29, 2019
- Bill Smith checked out Database Systems at 9:37am EST on April 2, 2004, due April 30, 2004

### Query files

Write two sql queries:

- `1.sql`: Provide email, title, due_date for all checkouts, ordered by due_date, newest first
- `2.sql`: Provide title, isbn, name for all books, where name is anyone who's checked out the book. Make sure you include books that haven't been checked out, ordered by title

Each query should be in its own file, as defined above.