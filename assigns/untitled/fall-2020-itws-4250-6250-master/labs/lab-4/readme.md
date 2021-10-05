# Lab 4: SQL Injection

For this lab, you will use your knowledge of SQL and SQL-Injection vulnerabilities to construct several strings to attack vulnerable code.

The `input.txt` file currently shows what would be "normal" or "safe" input for each of several queries, one input per line. You need to create "unsafe" input which will take advantage of the vulnerabilities written into the code.

As with Homework 5, you can run `python -m unittest restaurant_test.py`, after modifying the expected connection details at the top of the file.


## Assignment

Each test will use only one line of the input file, and each test will start with a fresh install of the schema. The goal of each test is defined here:

### Test One

Output all ingredients in the database, rather than just one.

### Test Two

The objective is the same as for Test One: Output all ingredients in the database, rather than just one.

Note that here, the `Restaurant` class makes an attempt at a more sophisticated method for constructing the query.

### Test Three

The Restaurant class provides a `find_course_recipes` method to find all the recipes for a given course. Note that it will exclude any recipes marked as "experimental."

Here, your SQL Injection attack should return all the recipes for the "Dessert" course, including the experimental ones.

### Test Four

Sabotage the restaurant by defaulting the `filled` values on all new orders to `now()`

(Remember that you can use `ALTER TABLE mytable ALTER COLUMN mycolumn ...` to modify the definition of an existing table)

### Test Five

This has the same objective as Test Three: return all the recipes (including experimental ones) for the "Dessert" course.

Note that here, an attempt has been made by the creators of the `Restaurant` class to sanitize user data.

## Submission

You will upload your modified `input.txt` file to Submitty.

As with other quizzes, you may work in teams of up to 3.

The assignment is due at 11:59PM on Thursday October 29.