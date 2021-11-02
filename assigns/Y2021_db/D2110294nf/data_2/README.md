# Exam #1

The solutions content of this file below will be updated according to [the instructions](instructions/instructions.md).

## Solutions

The following sections contain a report on the solutions to each of the required components of this exam.

### Data munging

The code in the Python program, [solution.py](solution.py), contains the solutions to the **data munging** part of this exam.

### Spreadsheet analysis

The spreadsheet file, [users.xlsx](./data/users.xlsx), contains the solutions to the **spreadsheet analysis** part of this exam. In addition, the formulas used in that spreadsheet are indicated below:

- abide by [the instructions](./instructions/instructions.md#entering-respones-into-the-readme-file) for how to enter responses into this file correctly.
- **Make sure that all spreadsheet formulae you enter into this document work exactly as written.**

1. Total number of users of the social network

```
Place your formula here.
```

2. Number of users in each of the states in the Pacific sub-region, which includes Alaska, California, Hawaii, Oregon and Washington.

```
Place your formula here.
```

3. Number of users in each of the given 5 cities of the USA: Nashville, Tennessee; San Diego, California; New York City, New York; Dallas, Texas; and Seattle, Washington.

```
Place your formula here.
```

4. The average affinity category IDs of all users in New York for each of the content types.

```
Place your formula here.
```

### SQL queries

This section shows the SQL queries that you determined solved each of the given problems.

- abide by [the instructions](./instructions/instructions.md#entering-respones-into-the-readme-file) for how to enter responses into this file correctly.
- **Make sure that all SQL commands you enter into this document work exactly as written, including semi-colons, where necessary.**

1. Write two SQL commands to create two tables named `users` and `affinity_categories` within the given database file.

```sql
Place your first command here.
```

```sql
Place your second command here.
```

2. Import the data in the `users.csv` and `affinity_categories.csv` CSV files into these two tables.

```sql
Place your first command(s) here.
```

```sql
Place your second command(s) here.
```

3. Display the state name and the number of users in that state for each of the states for which we have users.

```sql
Place your query here.
```

4. Display the state name, the number of users in that state, and the average `travel_affinity_category_id` for each of the states for which we have users.

```sql
Place your query here.
```

5. Display the email addresses only of all users residing in Pittsburgh, Pennsylvania.

```sql
Place your query here.
```

6. Display the email addresses of all users residing in Pittsburgh, Pennsylvania, along with the price the social network would charge an advertiser to show one advertisement to each of them, based on their `travel_affinity` level.

```sql
Place your query here.
```

7. Display the amount the social network would charge an advertiser to show two advertisement to three thousand users with a `real_food_affinity` level of `0.75`.

```sql
Place your query here.
```

8. Show all the users for whom the `tech_gadget_affinity_category_id` field contains an invalid foreign key.

```sql
Place your query here.
```

9. Write an additional SQL query of your choice using SQL with this table; then describe the results

Write a description of the query here.

```sql
Place your query here.
```

### Normalization and Entity-relationship diagramming

This section contains responses to the questions on normalization and entity-relationship diagramming.

- abide by [the instructions](./instructions/instructions.md#entering-respones-into-the-readme-file) for how to enter responses into this file correctly.

1. Is the data in `users.csv` in fourth normal form?

```
Enter your response here
```

2. Explain why or why not the `users.csv` data meets 4NF.

```
Enter your response here
```

3. Is the data in `affinity_categories.csv` in fourth normal form?

```
Enter your response here
```

4. Explain why or why not the `affinity_categories.csv` data meets 4NF.

```
Enter your response here
```

5. Use [draw.io](https://draw.io) to draw an Entity-Relationship Diagram showing a 4NF-compliant form of this data, including primary key field(s), relationship(s), and cardinality.

![Placeholder E-R Diagram](./images/placeholder-er-diagram.svg)
