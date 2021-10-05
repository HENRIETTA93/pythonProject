# Homework 4

In this homework, you will create triggers that will help maintain the consistency of a database. The database is an example of a database a restaurant might use to manage its food offerings. 

## What's in the folder?

`restaurant-setup.sql` contains SQL code that can be run as a superuser (usually `postgres`, but you could have other superusers as well) to create the database and user expected by the testing framework.

`restaurant-data.sql` contains SQL code to set up the database and populate the database. This will be run by the testing framework before each test, so that the database is reset to a known state. You can also run it yourself, if you want to be able to explore the data. 

`restaurant_test.py` contains unit tests for testing the implementation. I will use something similar (though not necessarily an exact match) for grading.

`data_structures.py` contains a single supporting data structures: `RecipeInstructions`.

## Setup

This relies on the [psycopg2](http://initd.org/psycopg/) module to connect to a Postgres database. You'll need to have that available when you run your python code.

It also relies on the python [unittest](https://docs.python.org/3/library/unittest.html) framework. I believe that comes with python, but you can also download it (or use `pip` to install it) separately, if necessary.

The test framework expects a user named `restaurant` (with password `restaurant`) to have full privileges to a database named `restaurant` on `localhost`. You can run the commands in `restaurant-setup.sql` to configure all that. (Or you could also use whatever database and user you want if you change the `connection_string` variable in `restaurant_test.py`.)

You'll also need to specify the location of your `.sql` file, so that the test script can run it after it's set up the database. Change the `homework_file` variable to point to the correct location.

## Running

From the a terminal (or command prompt) in the `homework-4/` directory, you can run the unit test suite by running:

``` 
python -m unittest restaurant_test.py
```

That will run the unit tests checking that the necessary added database functionality is present and works correctly.

## Assignment

You need to add checks, constraints, or triggers to add the following functionality to the database:

- When an order is inserted into the order table, the database should check the following:
    - whether the ingredients needed for the recipe are present in sufficient quantity in the inventory table. If not, the order should be rejected. 
    - whether or not the recipe specified in the order conforms to the `kosher` requirement. If an order is kosher (`kosher=TRUE`), the recipe must not contain any non-kosher ingredients. If the order is not kosher, there is no requirement.
    - whether the order starts with a value in the `filled` column. An order should not be permitted to start with a value for the `filled` column.

- When the order table is updated so that a timestamp is added to the `filled` column of a tuple (denoting when the order was filled), the ingredients should be subtracted from inventory.

- Once a timestamp has been added to the 'filled' column, it shouldn't be able to be changed.

## Deliverables

You should upload to Submitty a single file: `homework-4.sql`. It should contain your fully implemented code.

The due date for this assignment is **23:59 on Friday October 23**.

## Grading

The assignment will be graded by running similar unit tests on your submitted `.sql` file. Five points will be awarded for a passing unit test, for a total of forty (40) possible. No partial credit will be awarded for a failed unit test.