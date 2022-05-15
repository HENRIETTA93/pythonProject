

# Useful Links
```shell
## design
https://app.diagrams.net/

## database
https://livesql.oracle.com/apex/f?p=590:1000
aaagogool@gmail.com/Aaa-123456

https://www.postgresql.org/docs/12/index.html

## dataset

## big data
https://community.cloud.databricks.com/login.html

## 算法
https://www.cs.usfca.edu/~galles/visualization/BPlusTree.html
https://visualgo.net/en/bst

https://scrimba.com/learn/learnjavascript


## Apache
https://jmeter.apache.org/download_jmeter.cgi

## 工具
https://msdn.itellyou.cn/
https://tool.oschina.net/codeformat/json/
https://www.bootschool.net/ascii

```

# RDBMS

## DB Concept

## Normalization

## SQL

## Advanced SQL

### Postgres function

```
#=
select current_date, now(), age(now(),current_date), date_part('year',age(now(),current_date)),
date_part('hour',age(now(),current_date)), extract(year from age(now(),current_date));

 current_date |              now              |       age       | date_part | date_part | date_part
--------------+-------------------------------+-----------------+-----------+-----------+-----------
 2022-02-22   | 2022-02-22 14:51:34.247261+08 | 14:51:34.247261 |         0 |        14 |         0
(1 row)





```



### Mysql function





## Index



## Transaction



## Concurrency 





## Abstract Data Types

## Distributed Database Management System (DDBMS)

```
The technical definition of a DDBMS is a DBMS that supports distributed transactions. A DDBMS need not be geographically distributed. One common use of DDBMS technology is high reliability systems with two or more database servers in a fault-tolerant configuration connected by high speed local area networks.
```





# XML



# Big Data Databases



```
HBase is a column-oriented NoSQL distributed database that sits as a layer on top of HDFS. HBase is based on Google's BigTable and is optimized for random reads and writes on very large data tables. You read only the columns you need, which are grouped together in "column families". HBase does not , support secondary indexes, stored procedures or query languages such as SQL, or ACID transactions.

Cassandra is also a fault-tolerant column-oriented distributed. Like HBase, Cassandra uses Google's Big Table column-oriented data model. Cassandra can be layered on Hadoop, but it is most frequently run on Amazon's DynamoDB. Cassandra also supports Pig and Hive, but may not support everything that Hadoop does.

Hive is a data warehouse system that allows ad-hoc queries and analysis of large datasets. Hive uses a SQL-like language called HiveQL and stores its metadata in a relational database called "Derby." Because HBase and Cassandra lack their own versions of SQL, they are sometimes integrated with Hive to take advantage of Hive's version of SQL. Tables in Hive can be either internal or external. Internal tables are managed by Hive in its own warehouse directory. They can be used if the data is entirely created, maintained and deleted within Hive, but Hive also runs on HDFS files, which would be external to Hive. Hive will use MapReduce to process its queries if necessary.
Hive does not provide indexing capability, or the ability to modify records.

Pig is a high-level imperative data query language that uses a number of steps instead of the descriptions of declarative languages such as SQL. Pig can work with any kind of data. It doesn't require a fixed schema. Instead it creates its own schema, based on the modules used to create it, and casts any field to null that doesn't fit into its derived schema, so the data doesn't have to all have the same structure. Pig is often used in ETL (Extraction, Transform and Load) processes.
Mahout is a library with machine-learning algorithms that can be used with Hadoop's MapReduce, which gives it the ability to run on very large datasets. The library includes algorithms for clustering, classification and recommenders.

Sqoop is a set of tools to import or export relational database data into Hadoop through a JDBC connection string. It supports any database that is supported by JDBC. Tools within Sqoop will import a database table into HDFS or export an HDFS directory to a relational database table, etc. Sqoop also works with Hive.

Zookeeper is a centralized service that coordinates the configuration of distributed systems. With distributed transactions there are many possible sources of error. To ensure that a transaction was successful takes some work for the programmer. Zookeeper works at that level to ensure that the jobs complete, or notifies the user when they don't.
```



## Spark



# Data Warehouse



# Python





# Linux



# Git
```shell
git init
git status

# 远程仓库
git remote rm origin
git remote add origin [url]
git remote set-url origin [url]
git remote set-url origin https://github.com/x/x.git

## 查看提交历史记录
git log
git log --color --graph
```



# AI

```
PEAS

Intelligent Agents

Deterministic vs. Nondeterministic

Typical Agent Architectures:
§ Simple reflex agent 
§ Model-based reflex agent
§ Goal-based reflex agent 
§ Utility-based reflex agent

State and Transition Representations




====7, 8=====
---Informed Search---
Hill Climbing Search

A*
admissible: it never overestimates the cost.
is guaranteed to give you the opitmal solution
consistent: its estimate is getting better and better as we get closer to the goal
every consistent heuristics is admisssible heuristics, but not the other way around.
每个一致的启发式都是可接受的启发式，但不是相反






```

![image-20220225054913065](lucid.assets/image-20220225054913065.png)

![image-20220225055035607](lucid.assets/image-20220225055035607.png)

![image-20220225054823100](lucid.assets/image-20220225054823100.png)

```
Propositional Logic: Laws/Theorems 命题逻辑：定律/定理


Interpretation 解释
Sentence: (p V q) ^ (-q V r)
Interpretation i: pi = true, qi = false


Evaluation

Propositional Logic: An Argument

Inference Rules: Modus Ponens

Argument Validity: Truth Table Proof

Logical Entailment 逻辑蕴涵
```



![image-20220225053914758](lucid.assets/image-20220225053914758.png)

![image-20220225053429525](lucid.assets/image-20220225053429525.png)

![image-20220225054518375](lucid.assets/image-20220225054518375.png)

# RACKET



### Lists, Iteration, and Recursion



```python
> (map sqrt (list 1 4 9 16))
'(1 2 3 4)

> (map (lambda (i)
         (string-append i "!"))
       (list "peanuts" "popcorn" "crackerjack"))
'("peanuts!" "popcorn!" "crackerjack!")
```





# Software Engineering

```

== L2 Process Models==
Process Models
The drawback of the waterfall model is the difficulty of accommodating change after the process is underway.

Evolutionary development which is based upon the idea of developing an initial implementation , exposing it to the user and refining it based upon their response. 
Problems:Lack of process visibility; Systems are sometimes poorly structured

Agile development
Example include Scrum and XP




== L3 Software Specification===
The Requirements Engineering Process

Software Design and Implementation

Design Process Activities

The Testing Process
Unit testing
Individual components are tested
Module testing
Related collections of dependent components are tested
Sub-system testing (merges with system testing)
Modules are integrated into sub-systems and tested. The focus here should be on interface testing
System testing
Testing of the system as a whole. Testing of emergent properties
Acceptance testing
Testing with customer data to check that it is acceptable


== L4 Requirements Engineering===
Types of Requirement
User requirements
Statements in natural language plus diagrams of the services the system provides and its operational constraints. Written for customers
System requirements
A structured document setting out detailed descriptions of the system services. Written as a contract between client and contractor
Software specification
A detailed software description which can serve as a basis for a design or implementation. Written for developers


Functional and Non-Functional Requirements



== L7 System Models===
Data processing model - showing how the data is processed at different stages

Composition model - showing how entities are composed of other entities

Architectural model - showing principal sub-systems

Classification model - showing how entities have common characteristics

Stimulus/response model - showing the system’s reaction to events


Data Flow Diagrams
Statechart Diagrams
Finite State Machines

== L8 
Finite State Machines
Moore Machine
Mealy Machine
Petri Net Models

Semantic Data Models
Data Dictionary Entries


The Unified Modeling Language
Use-case diagrams
Class diagrams
Sequence diagrams
Statechart diagrams
Deployment diagrams

== L9 
High-Level Petri Nets

== L11 ormal Specification - Techniques for the Unambiguous Specification of Software
Formal specification
Specification analysis and proof
Transformational development
Program verification


== L12 Behavioural Specification
Algebraic specification can be cumbersome when the object operations are not independent of the object state

Model-based specification exposes the system state and defines the operations in terms of changes to that state
Abstract State Machine Language (AsmL)

== L13 Software Design 
Architectural design: Identify sub-systems.
Abstract specification: Specify sub-systems.
Interface design: Describe sub-system interfaces.
Component design: Decompose sub-systems into components.
Data structure design: Design data structures to hold problem data.
Algorithm design: Design algorithms for problem functions.


== L14 Module Interfaces
coupling, cohesion and interfaces 

== L15 Architectural Design 
Architectural Models


== L16 Distributed Systems
Multiprocessor Architectures
Client-Server Architectures
Layered Application Architecture

== L17 Object-Oriented


== L18 UML

== L19 Class Models

== L20 Aggregation and Composition

== L21 Use Case Diagram Collaboration Diagrams 

== L22 Verification and Validation
Verification should check the program meets its specification as written in the requirements document for example.
This may involve checking that it meets it functional and non-functional requirements.
Validation ensures that the product meets the customers expectations
This goes beyond checking it meets its specification; as we have seen, system specifications don’t always accurately reflect the real needs of users

== L22 Testing

Defect testing
Tests designed to discover system defects.
A successful defect test is one which reveals the presence of defects in a system.

Statistical testing
Tests designed to reflect the frequency of user inputs. Used for reliability estimation.

== L23 The Testing Process

== L24 Cyclomatic Complexity


== L25 Software Project Management

== L26 Software Cost Estimation
Expert Judgement
Estimation by Analogy
Parkinson's Law
Pricing to Win
Top-Down and Bottom-Up Estimation
Experience-Based Estimates
```





