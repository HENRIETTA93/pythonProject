# Query Compilation and Optimization

3 broad steps:
- Query is parsed: SQL is converted to a parse tree
- Parse tree is transformed into an expression tree of relational algebra (called a *logical query plan*)
- Logical query plan is convered into physical query plan.
    - Includes not only operations, but the order in which they're performed, and the way in which the stored data is obtained and passed from one operation to the next
    
## Syntax Analysis and Parse Trees

The parser converts SQL into a *parse tree*, whose nodes are:
- *Atoms*: 
    - Lexical elements such as keywords 
    - Names of attributes/relations
    - Constants
    - Parentheses, operators, etc.
    - Other schema elements
- Syntactic Categories: names for families of query subparts
    - <subquery>
    - <condition>
    
Atom nodes have no children

The children of the syntactic families are described by the grammar for the language 


Note that more complicated queries will all have multiple representations that accomplish the same thing.

## The pre-processor

Has several functions including:
- Replacing views with the expression that describes it. 
- Semantic checking:
    - Check relation uses: every relation mentioned in a FROM clause must be either a relation or view
    - Check and resolve attributes: Every attribute mentioned in a SELECT or WHERE clause must be an attribute of some relation currently in scope 
    - Check types: Attributes must be appropriate types to their uses 

## Algebraic Laws for Improving Query Plans

There are processes for converting a parse tree into an expression tree. We won't go into them in this course.

We will look at rules for transforming one expression tree into another. 

### Commutative and Associative Laws

Commutative Law (order doesn't matter) e.g., A + B = B + A

Associative Law (we can group however) e.g. X + (Y + Z) = (X + Y) + Z

When an operator is both commutative and associative, any number of operands connected by the operator may be grouped or ordered arbitrarily. 

R x S = S x R

R x (S x T) = (R x S) x T

R Join S = S Join R

R Join (S Join T) = (R Join S) Join T

R Union S = S Union R

R Union (S Union T) = (R Union S) Union T

R Intersect S = S Intersect R

R Intersect (S Intersect T) = (R Intersect S) Intersect T

All hold for both sets and bags

Example tree:
```
SELECT name, semester, student_email
FROM course, enroll
WHERE semester = 'F20'
AND course.semester = enroll.semester AND course.name = enroll.course_name
```

### Laws involving Selection 

Selection tends to reduce the size of a relation, so we want to push selection down the expression tree 

When the selection condition is composite, we can break it into its constituent parts

Select c1 AND c2 (R) = Select c1 ( Select c2 (R))

Select c1 OR c2 (R) = (Select c1 (R)) Union set (Select c2 (R)) 

(Only works if R is a set)

Note that ordering is flexible. 

#### Pushing Selection through binary operators

1. For Union, the selection must be pushed to both arguments
2. For a difference, the selection must be pushed to the first (optionally the second)
3. For other operations, it's only required to push to one argument

It might not always make sense to apply to the first argument, as it might not contain any attributes of the condition

It's sometimes necessary to push a selection up a tree, and then back down all possible branches. 

### Laws involving Projection

Like selection, projection can be pushed down. But the projection might also remain in place. In other words, projection may be copied down the tree.

Projection doesn't reduce relation size as much as selection (can even make it bigger).

In general, we may introduce a projection anywhere in a tree, as long as it eliminates only attributes that are neither used by an operator above nor are in the result of the entire expression.

### Laws about Products and Joins

Mostly already covered in commutative and associative laws.

Remember back to basic relational algrebra:

R Join c S = Selection c (R Times S)

R Join S = Project L (Select c (R Times S)) where c is the condition that equates each pair of attributes from R and S with the same name, and L is a list that includes one attribute from each equated pair and all the other attributes of R and S.

We generally want to apply these rules from right to left. We identify a product followed by a selection as a join of some kind. 

Why? Algorithms for joins are generally faster that algorithms to compute a selection on the result of a product.

### Laws about Duplicate Elimination

Generally we can push duplicate elimination down the tree. It can be removed altogether if it can be shown that a relation has no duplicates:
- A stored relation with a primary key
- The result of a grouping operation
- The result of a set union, intersection, or difference

We can push duplicate elimination:

d (R Times S) = d(R) Times d(S)

d(R Join S) = d(R) Join d(S)

d(R Join c S) = d(R) Join c d(S)

d(Select c (R)) = Select c (d (R))

We can also move it to either or both sides of an intersection.

Generally can't be pushed through bag union or difference, or through projection

### Laws involving Grouping and Aggregation

Hard to come up with general rules, as it's very dependent on the specific grouping and aggregated attributes.



# Coping with System Failures

*Resilience* is the integrity of the data when the system fails in some way

Principle technique supporting resilience is the log

3 different styles of logging (that we'll discuss):
- Undo
- Redo
- Undo/Redo

## Failures

4 Main failure modes

**Erroneous data entry**

Some are impossible to detect (wrong phone number) 

But generally are avoided using Checks/Constraints

**Media Failures**

Local failures are handled by checksums

Disk failure handled by 
- RAID
- Maintain an archive (periodically updated, stored a safe distance away)
- Redundant copies kept online 

**Catastrophic Failure**

Floods, fires, vandalism

RAID doesn't usually help here 

Other techniques for Media Failures usually are 

**System Failures**

Causes the transaction state to be lost

Typically caused by power failures or software errors

## Transactions

The transaction is the unit of execution of database operations.

It can be ad-hoc (just issuing commands)

Or explicit (`BEGIN`/`ROLLBACK`/`COMMIT`)

A transaction must execute atomically: all or nothing, as if it were done in a moment of time

### Correctness

What does it mean for a transaction to execute correctly?

Assume a database is composed of elements:
- Relations
- Disk Blocks
- Individual Tuples (or objects)

It's helpful to assume Disk Blocks. Elements are moved to and from Main Memory as single units. 

A database also has *state*, a value for each of its elements

*Consistent* states satisfy all constraints of the database schema

Fundamental assumption for transactions:

If a transaction executes, in the absence of other transactions or system errors, and it starts with the database in a consistent state, then it will be in a consistent state when it ends.

### Operators

Primitive operators of transactions

3 address spaces to consider:
- Space of disk blocks holding DB element
- Main memory, managed by the buffer manager
- Local address space of the Transaction 

For a transaction to read an element, it must first be brought to main memory, if it's not already there. Then it can be read into the Transaction address space. 

An element may or may not be written to disk immediately. 

We'll define transaction operators:
- Input(X): copy the disk block with X to main memory
- Read(X, t): read X from main memory into transaction variable t
- Write(X, t): writes the value from transaction variable t to X in main memory
- Output(X): writes the memory buffer containing X to disk

Example:

``` 
a := a * 2
b := b * 2

Action      t       MemA    MemB    DiskA   DiskB
--------------------------------------------------
                                    5       8
Input(a)            5               5       8
Input(b)            5       8       5       8
Read(a, t)  5       5       8       5       8
t=t*2       10      5       8       5       8
Write(a, t) 10      10      8       5       8
Read(b, t)  8       10      8       5       8
t=t*2       16      10      8       5       8
Write(b, t) 16      10      16      5       8
Output(a)   16      10      16      10      8
Output(b)   16      10      16      10      16

```

## Logging

A log is a file of log records

Imagine a log as a file opened for append only

As the transaction executes, the Log Manager will record important events 

Log records have several forms:

- Start T: transaction T started
- Commit T: transaction T was committed and will make no further changes to the database (however, we can't enforce this)
- Abort T: transaction T could not complete successfully.
    - It's the job of the transaction manager to make sure the changes of T never appear on disk
- Update<T, X, v>: Transaction T changed X for value v

## Undo Logging

Undo logging repairs database damage by rolling back transactions that didn't complete before the crash. 

Rules:
- If transaction T modifies X, the log record <T, X, v> must be written to disk *before* the new value is written to disk 
- If a transaction commits, then its COMMIT record must be written to disk only *after* all its changes have been written to disk

The value v should reflect the *old* value for X.

Add an additional Transaction operator: FLUSH LOG

``` 
a := a * 2
b := b * 2

Action      t       MemA    MemB    DiskA   DiskB   Log
-------------------------------------------------------
                                    5       8       Start T
Input(a)            5               5       8
Input(b)            5       8       5       8
Read(a, t)  5       5       8       5       8
t=t*2       10      5       8       5       8
Write(a,t)  10      10      8       5       8       <T, A, 5>
Read(b, t)  8       10      8       5       8
t=t*2       16      10      8       5       8
Write(b,t)  16      10      16      5       8       <T, B, 8>
Flush Log
Output(a)   16      10      16      10      8
Output(b)   16      10      16      10      16
                                                    Commit T
Flush Log

```

### Recovery

Start at the beginning of the log

Ignore all committed transactions

From the end of the log, for every update statement that's part of an uncommitted transaction, replace X with v (the old value)

We add Abort T statement to the log for every uncommitted transaction.


## Checkpointing

Checkpointing keeps the log from growing too big

- Wait for all current transactions to finish
- Stop new transactions from starting
- Flush Log
- Write CHECKPOINT to the log
- Flush Log 
- Resume new Transactions


A drawback to checkpointing is that you have to stop new transactions

*Nonquiescent checkpointing* doesn't require a shutdown of the database.

- Write Start CKPT(Tx1, 2, 3, ... Txk) for all active transactions 
- Wait until every transaction in the list completes 
- End CKPT

### Recovery

- Work backwards, undoing as we go 
- If we encounter END CKPT, we only go back to the previous START CKPT.
- Otherwise, we only go back until we find the start of the earliest transaction in the list.

## Redo Logging

Undo logging has the problem that we can't commit any transaction until all the changes are written to disk.

We may save I/Os if changes are allowed to remain in memory for a while.

Redo logging addresses that problem

Main differences from Undo Logging:
- Redo logging repeats the effects of committed transactions, rather than undoing the not-committed transactions
- Redo Logging requires the `COMMIT` record be written to disk before any data changes are written to disk
- Update records record the new value, instead of the old.

**Redo Logging Rule**: Before writing any change to disk, both the update record and the `COMMIT` record must be written to disk.

``` 
a := a * 2
b := b * 2

Action      t       MemA    MemB    DiskA   DiskB   Log
-------------------------------------------------------
                                    5       8       Start T
Input(a)            5               5       8
Input(b)            5       8       5       8
Read(a, t)  5       5       8       5       8
t=t*2       10      5       8       5       8
Write(a,t)  10      10      8       5       8       <T, A, 10>
Read(b, t)  8       10      8       5       8
t=t*2       16      10      8       5       8
Write(b,t)  16      10      16      5       8       <T, B, 16>
                                                    Commit T
Flush Log
Output(a)   16      10      16      10      8
Output(b)   16      10      16      10      16
```

### Recovery

- Ignore incomplete transactions
- Identify committed transactions
- Start at the beginning of the log, and replay the Committed Transactions
- Write `ABORT T` record for each uncommitted transaction

### Checkpointing 

A little more complicated than undo logging: we have to keep track of which buffers in memory are *dirty*

But we can checkpoint without waiting for active transactions to finish, since they can't write anyway.

1. Write START CKPT(T1, T2, ... Tk) (where the Ts are the active transactions)
    - Flush Log
2. Write to disk all the dirty buffers for the completed transactions
3. Write END CKPT record
    - Flush Log

#### Recovery

Two cases, depending on if the last record is START CKPT or END CKPT

- END CKPT: everything prior to the preceding START CKPT was written to disk:
    - Any Transaction listed in that START CKPT record, or after, may have unwritten changes 
    - We can ignore everything before the earliest START Ti record 
- START CKPT: We can't be sure that the transactions committed prior to the checkpoint had their buffers written to disk.
    - We have to search back to the previous END CKPT record, as in the preceding case 

## Undo/Redo Logging

Drawbacks of Undo and Redo logging:
- Undo: data must written to disk immediately, potentially increasing I/Os 
- Redo: must keep all modified blocks in memory until the end of the transaction, increasing memory requirements 
- Both: put contradictory requirements on the buffer manager during checkpointing

**Undo/Redo Logging Rule**: Before modifying any X on disk, the update record <T, X, v, w> must appear on disk

*Note* We have to log both the old and new value in the log

``` 
a := a * 2
b := b * 2

Action      t       MemA    MemB    DiskA   DiskB   Log
-------------------------------------------------------
                                    5       8       Start T
Input(a)            5               5       8
Input(b)            5       8       5       8
Read(a, t)  5       5       8       5       8
t=t*2       10      5       8       5       8
Write(a,t)  10      10      8       5       8       <T, A, 5, 10>
Read(b, t)  8       10      8       5       8
t=t*2       16      10      8       5       8
Write(b,t)  16      10      16      5       8       <T, B, 8, 16>
Flush Log
Output(a)   16      10      16      10      8
Output(b)   16      10      16      10      16
                                                    Commit T
Flush Log (optional)
```

### Recovery 

- Redo all the committed transactions, earliest first (start at the beginning of the log)
- Undo all the uncommitted transactions, latest first (from the end of the log)

**Side effect** of the delayed commit: it can lead to wasted work if the transaction was finished but the commit record wasn't flushed to the log. Then the transaction is unnecessarily undone.

Possible solution: **second undo/redo logging rule**: always flush the log immediately after writing the `COMMIT` record

### Checkpointing

- Write START CKPT(T1, T2, ... Tk)
    - Flush Log
- Write *all* dirty buffers to disk
- Write END CKPT






# Parallelism in Databases

Databases can generally benefit from parallelism

A parallel machine is basically a collection of processors
- Assume each processor also has a local memory cache

For databases, there are also a large number of disks
- Sometimes one per processor
- Sometimes disks may be accessible by all processors

Parallel systems also have some way of passing data between processors 

3 Broad Categories of system architectures
- Shared Memory
- Shared Disk
- Shared Nothing

## Shared Memory

Each processor has access to the memory of all the others. 

Single physical address space across the entire machine

## Shared Disk

Every processor has its own memory, but they still have access to all the disks

Disk controllers manage competing requests 

Two basic forms:
- Network Attached Storage (NAS): store and transfer files 
- Storage Area Network (SAN): store and transfer blocks

## Shared Nothing

Processors have their own memory and disks

All communication is done via a network, processor to processor. 

Shared nothing is the most common architecture

Relatively inexpensive to build

Algorithms must account for the cost of transferring data
- Typically there's a large fixed-cost for the message, and a small per-byte variable cost
- Try to send large amounts of data at once

## Map/Reduce Parallelism Framework

High-level framework that allows database processes to be written simply

User (developer) writes two functions: map, and reduce

A master controller divides the input data into chunks and assigns processors to run the map function on each chunk.

Other processors (maybe the same ones) perform the reduce function on pieces of the output of the map function

### Storage Model

Assume a massively parallel machine (shared nothing)

Data is stored in files
- Files are typically large (e.g. all the tuples for a relation)

Files are divided into chunks, possibly complete cylinders of a disk, typically many megabytes

Chunks are replicated for resiliency 

### Map/Reduce Functions

Key-value pairs -> map() -> key-value pairs -> sort by key -> reduce() -> output lists per intermediate key

**Map** function takes one key-value pair as input, and it produces a list of key-value pairs as output
- Types of outputs don't have to match the types of inputs
- "Keys" that are output aren't keys in a database sense. Many instances of the same key value can exist
- The map function often doesn't `return` a value in the normal sense. There's often an `emit()` function that's called multiple times

**Reduce** function takes a single intermediate key value, and a list of values associated with that key
- Duplicates are not eliminated 
- Output a single value for that key

Reduce function is often associative and commutative 
- Can be started before the map process is finished 

Example: Word count

```
map(docId, document) {
    for word in document:
        emit(word, 1)
}

reduce(word, list<count>) {
    insert (word, sum(list<count>)) into the index


```

Example: Inverted index for words in documents 

``` 
map(docId, document) {
    for word in document:
        emit(word, docId)
}

reduce(word, list<docId>) {
    remove duplicates from list
    insert (word, list<docId>) into the index
}
```

Example (in MongoDB) Find the population of each state: 

``` 
{
	"_id" : "01034",
	"city" : "TOLLAND",
	"loc" : [
		-72.908793,
		42.070234
	],
	"pop" : 1652,
	"state" : "MA"
}

//map
function() {
    emit(this.state, this.pop);
}

//reduce
function(key, values) {
    return Array.sum(values);
}

db.zips.mapReduce(function() {
                      emit(this.state, this.pop);
                  }, function(key, values) {
                         return Array.sum(values);
                     },
                    {"out": "state_population"}
);


```

 Example (in MongoDB): Count the number of zipcodes in each state
 
```
//map
var mapState = function() {
    emit(this.state, 1);
}

//reduce
var reduceState = function(key, values) {
    return Array.sum(values)
}

db.zips.mapReduce(mapState, reduceState, {"out": "state_zipcode_count"});
```




## Distributed Databases

Different than parallel systems, in that the cost of communication is higher. A parallel system usually has processors on the same rack in the same data center; distributed databases are more geographically spread out.

Advantages:
- Same opportunity to parallelize the work
- Geographic distribution creates resiliency

Disadvantages:
- Cost of communication dominates the cost of in-memory operations. Algorithms need to account for that. 

### Distribution of Data

One reason to distribute data is because the data itself is already distributed. 
- Banks might have branches, the customers of a given branch have their data stored locally.
- Chain of stores might keep inventory data locally
- Digital library might keep copies of their own catalog

That means the data may be partitioned

`Courses(name, semester, location, time)`

The relation doesn't exist physically. It's the union of the relations from each campus, each with the same schema.

Local relations are called *fragments*. The partitioning of the data into the physical fragments is called *horizontal decomposition*. 

We can also partition a relation *vertically* by decomposing the relation into multiple relations, each with a subset of attributes. 

### Distributed Transactions

A transaction may now involve data at several sites, so the model of a transaction needs to change. 

A transaction now consists multiple *transaction components*.

2 Issues that need to be addressed:
- How do we manage abort/commit? What if one transaction component wants to abort, but the rest are fine? (Two-phased commit)
- How do we assure serializability of transactions? (Lock tables)

### Data Replication

An big advantage of distributed databases is easy replication of data.

It's good for both resiliency and speed of queries. 

Problems that must be faced:
- How do we keep the copies identical? An update to replicated data becomes a transaction that updates all copies. 
- How do we decide where and how many copies to make?
- What happens when there's a communication failure in the network?

### Distributed Commits

Given the database for a sales system at a store. We want to query the number of toothbrushes at each store, and issue shipping instructions to balance the inventory.

1. T0 created
2. T0 sends messages to start Ti transaction components
3. Each Ti executes a query and reports to T0
4. T0 accepts the responses and issues update instructions
5. Stores receive instructions and update

### Two-Phased commit:

Basic principle behind distributed transactions: either all of the transaction components execute, or none of them do.

Each component guarantees its own local atomicity

- Assume each site logs local actions, but there's global log
- One site is the *coordinator* and decides whether or not the transaction can commit
- Two-phase commit involves sending messages between the coordinator and the sites. Messages are logged at the sites to aid recovery.

We can describe the phases based on the messages sent. 

#### Phase 1

The coordinator decides when to attempt the commit.

1. The coordinator places `<Prepare T>` in its own log
2. The coordinator sends `Prepare T` message to each site
3. Each site receiving the message decides whether to commit or abort. The site may delay, but eventually it must send a response.
4. If a site wants to commit, it must enter the *precommitted* state. Once it's in that state, it cannot abort without a message from the coordinator.
    - Perform all the steps needed to ensure that T will not have abort, even if there's a system failure. 
    - Place `<Prepare T>` in its log
    - Send `Ready T` message to the coordinator
    - The commit is not done at this time
5. If the site wants to abort, it logs `<Don't commit T>` and sends `Don't Commit T` to the coordinator

#### Phase 2

Begins when Ready or Don't Commit responses are received.

A suitable timeout period is used, after which the coordinator assumes `Don't Commit`.

1. If the coordinator receives Ready responses from all sites, it decides to commit.
    - It logs `<Commit T>`
    - It sends `Commit T` to all sites
2. If one or more site responds with `Don't Commit`
    - The coordinator logs `Abort T`
    - Sends `Abort T` to all sites
3. If a site receives `Commit T`, it logs and commits
4. If a site receives `Abort T`, it logs and aborts