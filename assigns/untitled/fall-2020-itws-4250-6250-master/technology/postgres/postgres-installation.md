# Postgres

We'll be making extensive use of Postgres throughout the semester. You should be able to install it on your laptop without much difficulty.

## Installation

On **Windows**, you can use installer available on the Postgres [Windows Installers](https://www.postgresql.org/download/windows/) page. At the least, you should install the Postgres server. pgAdmin might be helpful but is not a requirement. StackBuilder is provided by the company that creates the installer; it's not necessary.

On **Mac**, use [homebrew](https://brew.sh/): `brew install postgres`. You can install pgAdmin separately if you wish.

On Linux, there are [instructions](https://www.postgresql.org/download/linux/) available. There are packages for most major distributions that will be sufficient for this course.

### A note on pgAdmin

pgAdmin is a GUI tool for administering a Postgres database (similar to phpMyAdmin for a MySQL database). You might find it helpful, particularly for exploring databases.

However, be careful not to use it as a crutch. Everything we do in this class can be done from the command line (the `psql` tool). It's important to know how to interact with the database from a command line interface, and aspects of the class (like the exams) may require knowledge of the relevant SQL commands (as opposed to being able to do it from a GUI).

## Setup

Once you've installed Postgres, you should be able to run the `psql` command from the command line. 

Postgres ties into the underlying user accounts of the host operating system, so when you run `psql` with no other arguments, it will attempt to connect to a Postgres user with the same name as whatever username you're signed in with, and to a database with the same name. We'll cover these concepts more extensively later in the semester.

Start the postgres prompt with some variation of 
- `psql`
- `psql -U postgres postgres`
- `sudo -u postgres psql postgres`
depending on the specifics of your installation. 

(StackOverflow is your friend here. Try to figure it out yourself first if you can, before turning to your peers, the TAs and undergraduate mentors, and the instructor for help.)

You'll know you've logged in correctly when you see: `postgres=# ` as the prompt (note that if you're logging in as yourself, rather than the `postgres` user, you'll see your username instead).

Use `\q` or `\quit` to exit.

