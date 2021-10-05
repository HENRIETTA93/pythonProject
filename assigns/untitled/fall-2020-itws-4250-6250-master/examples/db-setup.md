# Example database

We'll be running through examples in class. It's helpful to set up an example database, so that the class examples don't conflict with anything else you may be trying to do on the database (like homework assignments). You can do that with by running the following from psql:

```postgresql
CREATE USER example_user WITH PASSWORD 'example-password';
CREATE DATABASE example_db;
GRANT ALL PRIVILEGES ON DATABASE example_db TO example_user;
```

Then you can log into Postgres using `psql -U example_user example_db` and providing `example-password` as the password. If you've done it right, you should see a prompt like: `example_db=> `. Use `\q` to quit and return to the command prompt.

You can use the command line to pipe input into the `psql` tool if you need to run a SQL file. For example, you can run the SQL file to set up and add data to our course schema by executing the following from this directory:

``` 
psql -U example_user example_db < course-schema-and-data.sql
```

Then log into Postgres as above, and running a query like `SELECT * FROM course` should output some data.