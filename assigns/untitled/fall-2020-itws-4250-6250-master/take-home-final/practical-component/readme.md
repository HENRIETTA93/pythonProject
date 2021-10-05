# Take-Home Exam "Practical" Component

## Overview

The `schema_and_data.sql` file contains an implementation of the relational schema for the record store described on the first page of the exam.

## Assignment

You need to add SQL code to three files:
- `fix_schema.sql`
- `schema_improvements.sql`
- `inventory_trigger.sql`

Your SQL code should accomplish the requirements described below.

### Fix Schema Discrepancies

There are four (4) discrepancies between the requirements for the database as described on the first page of the exam, and the schema as it's implemented in the `schema_and_data.sql` file.

You should be able to correct each discrepancy with a single SQL statement. Put your SQL statements in `fix_schema.sql`.

The schema corrections are worth **10 points**.

### Make Schema Improvements

Write SQL to support the following improvements to the schema (you should be able to do each with a single statement, but the entire file will be run, so that's not a requirement):

- No individual album should have more than one song with the same track number
- Edison invented the phonograph in 1877: no albums should be allowed to exist prior to that year
- Artists occasionally ask how much of their content is being carried by the store. Create a view to handle that request.
    - It should be called `artist_value` and it should have three attributes:
        - `artist_name`
        - `birthdate`
        - `inventory_value`
    - The `inventory_value` attribute should show the amount the store would receive if they sold every album in inventory for that artist
- Improve the performance of searches by UPC by adding an index for that field. Be sure to use the best type of index for the field.

The schema improvements are worth **20 points**.

### Inventory Triggers

The `sale` table needs to be updated every time the `numberInStock` for a given album is reduced. After a sale is made, if anything is out of stock, and order should be placed for five more, and a new tuple added to the `wholesale_order` table, indicating the total cost for the order.

`sale_trigger.sql` contains code that creates a trigger so that a correctly populated row is inserted into the `sale` table any time inventory is reduced. 

The `totalSale` attribute should represent the total value of the sale. If 3 albums were sold (`numberInStock` was reduced by 3) at $10.00 each, the `totalSale` component for the inserted tuple should be $30.00. It doesn't do any sort of integrity-checking or sanity-checking (like making sure there are sufficient albums in inventory, or anything like that).

You need to add SQL code to `inventory_trigger.sql` to implement the creation of data for the `wholesale_order` table.

Any time a statement is executed that reduces the `numberInStock` value for any album, your code should find all of the albums for which the `numberInStock` is < 1, and add a new tuple to the `wholesale_order` table. The `orderId` will be automatically populated by the database. The `cost` will be the total price for five of every album to be included in the order. Its `orderDate` should be the current time.

The inventory trigger functionality is worth **30 points**.

## Submission

Your code is due along with your solutions to the "theory" component no later than **9:30pm** on December 16.

Unlike the labs and homework assignments, you may only submit up to 5 times before incurring a penalty. Each subsequent submission will deduct 10 points up to a maximum of 30 points.