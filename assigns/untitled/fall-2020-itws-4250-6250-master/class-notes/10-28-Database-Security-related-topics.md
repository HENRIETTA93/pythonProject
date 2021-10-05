# User Authorization in SQL

SQL has the concept of *Authorization IDs* which are basically usernames

There's a special authorization ID `PUBLIC` which includes any user

Authorization IDs may be granted privileges, similar to a Unix file system.


## Privileges

SQL defines 9 types of privileges:

These apply to relations (tables or views):
- `SELECT`*
- `INSERT`*
- `UPDATE`*
- `DELETE`

Others:
- `REFERENCES`*: the right to assert referential integrity
- `USAGE` applies to other schema elements (e.g., `nextval()`)
- `TRIGGER` (self-explanatory)
- `EXECUTE` is the right to execute stored procedures/functions
- `UNDER` is the right to create subtypes 

* These may also have an associated list of attributes 

Different implementations may define others as well. For example, Postgres also has:
- `TRUNCATE`
- `CREATE`
- `CONNECT`
- `TEMPORARY`

A SQL statement cannot be executed without the privileges appropriate for that statement

Consider:
```postgresql
SELECT *
FROM course
WHERE semester='F20';

INSERT INTO enroll(student_email, course_name, semester) 
SELECT email, 'Computer Lab', 'F20'
FROM student 
WHERE major = 'ITWS';
```

### Triggers and Privileges

A trigger is created using the `TRIGGER` privilege. However, the creator must have all the necessary privileges for the condition and action of the trigger as well. 

Then, the trigger is executed under the privileges of the creator, not the user who does the action that awakens it. 

## Granting Privileges

Two aspects to awarding privileges:
- How they're initially created
- How they're passed from user to user

SQL elements (schemas, modules, etc.) have an owner. The owner has all privileges associated with that element.

Ownership is established at three points:
1. When a schema is created it, and all the tables and other elements within it, are owned by the user who created it.
2. When a session is created using a `CONNECT` there is an opportunity to associate an Authorization ID with the session
3. When a module is created, we have the option to give it an owner using an `AUTHORIZATION` clause. 
    - A module can also be created without one, but then the module's contents are publicly viewable, but the privileges for executing them must come from elsewhere. 
    
## Checking Privileges

Each schema, module, or session has an associated user (Authorization ID)

Any SQL operation has two parties:
- The database elements on which the operation is being performed 
- The agent that causes the operation 

The privileges available to the agent derive from an Authorization ID called the *current authorization ID*. 

This is either:
- Module authorization ID (if it exists), or
- Session Authorization ID otherwise

We execute the SQL statement only if the current authorization ID possesses all the necessary privileges.

Basically we can execute a statement when:
- The data is owned by the same user whose ID is the current authorization ID
- The user who's the current authorization ID has been granted the necessary privileges by the owner (or delegates)
- We're executing a module owned by the owner of the data, and we've been granted `EXECUTE` privileges
- We're executing a publicly available module with a session ID that has the necessary privileges

### Granting Privileges

SQL provides a `GRANT` statement to allow one user to give privileges to another. 

Each privilege has an associated `GRANT OPTION` that allows a user to grant the privilege.

`GRANT <privilege list> ON <database element> TO <user list> [WITH GRANT OPTION]`


The database element is typically a relation (table or view). Other elements must be preceded by their type

`GRANT EXECUTE ON PROCEDURE foo TO users`

```postgresql
SELECT course_name as course, AVG(grade) as grade
FROM grades
WHERE student_email = 'alice@example.com'
GROUP BY course_name, semester;

CREATE OR REPLACE FUNCTION check_grade(email VARCHAR(255)) RETURNS TABLE (course VARCHAR(255), score FLOAT)
AS $$
BEGIN
    RETURN QUERY
    SELECT course_name as course, AVG(grade) as score
    FROM grades
    WHERE student_email = email
    GROUP BY course_name, semester;
END;
$$ LANGUAGE plpgsql;

select course_name from enroll;
```


We can use `ALL PRIVILEGES` allows for granting everything 

### Grant diagrams

It can be helpful to use a directed graph to visualize privileges. Nodes are user and privilege. Edges show how they're granted.

Example:


### Revoking Privileges

A granted privilege may be revoked at any time.

`REVOKE <privileges> ON <element> FROM <user list>`

Then either:
- `CASCADE`: revoke any privileges that were granted solely because of the revoked privilege
- `RESTRICT`: the revoke only succeeds if `CASCADE` option wouldn't have removed any other privileges. 

In Postgres, `RESTRICT` is the default and is assumed if `CASCADE` is not specified

We can also `REVOKE GRANT OPTION FOR ...` (also needs a `CASCADE`/`RESTRICT`) 



# Database Security Topics

## Storing Sensitive Data

So far, we've only considered plain text data. 

Some data is more sensitive

Two general categories of sensitive data:
- Personally identifiable information (SSN, bank account, credit numbers, etc.)
- Passwords or Credentials

### Why is this a problem?

Consider this example:

```postgresql
CREATE TABLE financial(
    student_email VARCHAR(255) PRIMARY KEY REFERENCES student(email),
    account_number VARCHAR(31),
    balance money 
);

INSERT INTO financial(student_email, account_number, balance) VALUES('alice@example.com', '123-456', 7000.00);
INSERT INTO financial(student_email, account_number, balance) VALUES('bob@example.com', '10-11-12', 3250.91);
```

### Symmetric Key Encryption

Data is encrypted with a public key or password and stored, so it can be retrieved later

We have the option for Postgres (or other implementations) to handle the encryption for us.

`pg_crypto` module that supports that. 

Basic idea:

We create an encrypted message that consists of two parts or "packets"
- Packet containing a session key (either symmetric or public key encrypted)
- Packet containing the data, encrypted with the session key 

Encrypting with a password:
1. A given password is hashed using a S2K (string to key) algorithm 
2. We use the hashed password or a randomly generated session key to encrypt the data packet
    - If password, we store the S2K settings 
    - Otherwise, we store the session key 

Encrypting with a public key:
1. A random session key is generated
2. Session key encrypted with the public key and stored 

Then we can do optional data manipulation (compression, UTF-8, etc.)

Then:
- Data is prefixed with random bytes
- Append the SHA1 Hash bytes + data 
- Encrypt with the session key, and store the data packet

Note that there is a period of time when both the key and unencrypted data exist on the server. (Vulnerable to a malicious database administrator).

It's also possible that the key will end up in various server logs.

A viable alternative is to encrypt the data in the application, so that the database server never handles the plaintext.

### Asymmetric Encryption (storing passwords)

A hash algorithm is a one-way function that converts any amount of data into a fixed-length block.

Cannot be reversed. 

**General workflow for storing a password**

1. User create account
2. A password is provided, hashed and stored in the database 
    - At no point is the plaintext password written to disk 
3. When the user attempts to log in:
    1. Hash the given password
    2. Compare the hashed password to the hashed password that's stored (from step 2)
    3. If they match, grant access
        - If there's no match, never indicate that it's the wrong password (always invalid credentials)

Note that the hashing algorithms aren't the same as the ones used for hash tables. 

We want hashing algorithms that are time or resource intensive.

Current acceptable options: Argon2, PBKDF2, scrypt, bcrypt

Now we have a table of hashed passwords. If it's stolen, how much security do we have?

**Ways hashed passwords are broken** (offline attacks):
- Brute Force: iterate through the possible combinations 
- Dictionary/Topology attack:
    - Use known words. Start with the ones more commonly used in passwords
    - Use known password topologies 
- Lookup Tables: pre-compute hashes and stored passwords, and store them in a data structure 
- Reverse lookup tables: find users whose hashed passwords are the same (involves making password guesses)
- Rainbow tables: similar to a lookup table, but we sacrifice lookup speed to save storage space 

We can only combat the first two with stronger password requirements. 

We combat the remaining three by using "salt." 

Lookup tables work because the same hash is applied to all users. If two users have the same password, they'll have the same hash, and the work only needs to be done once. (This is particularly relevant because passwords are re-used)

Salt allows us to randomize the hash function a bit. 

We add (to the beginning or end) a random string called a "salt" to the password before hashing it.

`password` salt: `abc`, what gets hashed is `passwordabc`

Then we store the salt along with the hash. 

No protection against brute force attack. Salt does little to reduce the cost of a single attack. 

However, it does deny the attacker re-use of that attack. 

**Salting Mistakes**
- Salt re-use 
- Short salt: lookup tables are still possible (though more expensive) 
    - Use same size salt as the output of the hash function (SHA256 is 256 bits, so we'd use 256 bits of salt)
    
### Other common security mistakes

Don't invent a complicated scheme with double hashes, etc. It provides little added value and makes it easier to make mistakes. 

Don't roll your own cryptographic algorithms 

Standard well-tested approaches are harder to get wrong 

Generate salt with a secure random number generator 

## SQL Injection

A SQL Injection attack consists of insertion or "injection" of a SQL query via the input data from the client into the application.

A successful exploitation of a SQL Injection vulnerability can allow an attacker to:
- Read sensitive data
- Modify the database data
- execute administrative operations 
- Recover files on the DBMS system
- Possibly execute commands on the host OS

This builds on what we looked at last class

[Examples](../examples/python/sql_injection.py)



