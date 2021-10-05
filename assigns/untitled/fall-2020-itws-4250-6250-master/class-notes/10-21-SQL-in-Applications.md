# SQL in Applications

## Common Application Architectures

### 3-Tier / N-Tier Applications

Applications are deployed in 3 tiers:
- Web tier 
- Application tier
- Database tier

**Web Tier** manages interaction with the user

More common now to handle serving code that handles interaction with the user. The web tier managers interactions with that code (JavaScript in the browser)

Apache, Tomcat, Nginx, etc. 

Not just a website anymore: could be an API: REST, SOAP, GraphQL, etc.

**Application Tier** turns data from the database(s) into a response to the request that it receives from the web tier. 

Often called the "business logic" 

It may have sub-tiers to support database integration. 

Many apps connect to multiple, separate DBMS

**Database Tier** manages connections to the database

Two main aspects:
- Manages connections (pooling)
- Manages conversion between SQL datatypes and whatever is needed by the application tier

### Microservices Architecture

Alternative to N-Tier systems

N-Tier tend to be monolithic. Drawbacks:
- Any change to any tier requires a complete rebuild/deploy
- Scaling a monolithic application requires scaling the whole thing

Microservices looks at an application as a suite of separate services which can:
- Be built and redeployed independently 
- Scaled Independently 

Common attributes of microservices architectures:
- Decentralized Governance: teams may manage each service more or less independently
- Decentralized Data management: conceptual model of the data will be different between different teams and services
- Domain-driven design: a complex domain is divided into multiple contexts and relationships between them are managed as needed. 

Microservices also decentralize data storage, including using multiple storage techniques: "polyglot persistence".

Transactions may be delayed: "eventual consistency"

The application must be able to deal with temporary inconsistencies 

## SQL Environment

A SQL environment is the framework in which data may exist and SQL operations on the data may be executed.

In practice, think of a DBMS running on some installation. 

Every SQL element we've discussed is defined within a SQL environment and is organized into a hierarchy of structures

1. Schemas: collections of tables, indexes, triggers, procedures, etc.
    - Basic units of organization. Close to what we think of as a database
2. Catalogs: collection of schemas
    - Basic unit for supporting unique, accessible terminology. 
    - Names of schemas must be unique within a catalog
    - Each catalog contains `INFORMATION_SCHEMA`
3. Clusters: collections of catalogs
    - Each user has a cluster: the set of catalogs visible to that user
        - the "database" as it appears to the user

### Schemas

`CREATE SCHEMA name <element declarations>`

We don't need to add everything at once

`ALTER SCHEMA name RENAME TO new_name`

`DROP SCHEMA name [CASCADE | RESTRICT]`

`SET SCHEMA` lets us set the active schema

*In Postgres* `SET search-path TO my-schema`

Other schema elements:
- Domains: sets of values or types (not often used)
- Character Sets
- Collations
- GRANT statements (access controls)




### Connections

A connection is a connection between a SQL server and a client. It usually has a username and password

Connections can be named

### Sessions

The SQL operations that are made while a connection is active form a *session*

A session lasts as long as the connection that created it. Each session has a current catalog and schema

There's an authorized user for every session

## Invoking SQL in Applications

### JDBC

Java Database Connectivity

Similar to the `psql` CLI but for Java programs connecting to a DBMS

Java specifies an API (`java.sql` and `javax.sql` packages). Each DBMS provides a jar-file implementation 

[Postgres JDBC Jar](https://jdbc.postgresql.org/download.html)

[Java Examples](../examples/java/src/)

#### Basics

Create a connection

Use the connection to create statements, which can execute SQL.

Better to use a PreparedStatement, which handles sanitizing parameters.

Use a ResultSet to step through the results.

Use `.executeUpdate()` to make changes.

### PHP

PHP also has support for major SQL implementations

The process is similar

Create a connection, use methods to make database calls.

[PHP Example](../examples/php/example.php)

### Python

A variety of modules are available, depending on the SQL implementation

[Python Examples](../examples/python/)