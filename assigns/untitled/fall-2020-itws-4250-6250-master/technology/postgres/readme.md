# Installing Postgres

The [Postgres](https://www.postgresql.org/) database is an open-source relational database. Along with MySQL and SQLite, it's one of the most commonly used open source relational databases, and it will be the database used for most of the examples and assignments in this class.

I've put some together some [basic installation instructions](postgres-installation.md). Once you've done that, there are two basic things it will be helpful to be able to do, for the purposes of this class:
1. Use the command line tool (`psql`) to sign into the database as a root user (typically the `postgres` user) and run queries
2. Use the command line interface or terminal of your laptop to pass SQL files containing queries or other commands to your Postgres installation.

Once you've followed the above instructions, and you've successfully connected to the database using the `psql` tool, you should see a prompt: `postgres=# ` (it might be a different username, depending on your choices during installation). 

Try running a simple query. Type `SELECT 'Hello World!';` and press enter. What output do you see? How does it change if you type `SELECT 'Hello', 'World';` instead?

Type `\q` or `\quit` to exit. 

Now try routing the contents of `hello.sql` to `psql` (you'll need to include whatever additional arguments you used to get into the postgres prompt): 

``` 
psql < hello.sql
```

We'll use this second approach to run scripts to set up databases for homework assignments later in the semester.