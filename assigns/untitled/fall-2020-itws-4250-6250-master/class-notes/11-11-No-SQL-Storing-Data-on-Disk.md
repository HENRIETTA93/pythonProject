# Secondary Storage Management

Database systems always involve secondary storage to store large amounts of data over time 

## Memory Hierarchy

Multiple components for data storage
- Amount of data stored varies over 7 (or more) orders of magnitude
- Cost per byte varies over 3 (or more) orders of magnitude
- Speed of access varies over 7 orders of magnitude

### Levels

#### Cache

on-board cache of memory (on the chip itself)

- Sometimes there's a level-2 cache on another chip

#### Main Memory

RAM 

All of the operations we consider a computer doing (in this class) work on information at this level

Transfer to cache takes 10-100 nanoseconds 

#### Secondary Storage

Disk 

Often (still) a spinning magnetic disk (increasingly is a solid state drive)

Time to transfer to memory is around 10 msec. 

Large amounts of data can be transferred at a time, so speed of transfer is complex

#### Tertiary Storage

Magnetic tape, Optical drives

Large retrieval times

Much longer persistence, and lower cost per byte. 

### Transfer between levels

Data moves between adjacent levels

Data on disk is organized into *blocks*. Blocks generally 4-64 kb.

Entire blocks are transferred at once, to or from a contiguous section of memory called a *buffer*. 

An implication is that we can improve performance if data that is accessed is on the same block other data that is needed at the same time. 

### Volatile vs Non-volatile storage

Volatile storage "forgets" what is stored when the power is shut off.

Much of the complexity of a DBMS comes from the fact that a change can't be considered final until it's written to non-volatile storage. 

### Virtual Memory

A system to increase the size of memory address space beyond what's physically available in RAM 

It's a feature of operating systems and is not typically applicable to a DBMS

## Disks

For the purposes of this class, we'll focus on spinning magnetic disks, not solid state drives.

Magnetic disks are still used for databases, though it's becoming less common. 

Some of the principles surrounding the organization of data on magnetic disks may apply at a more macro level to databases that are more broadly distributed

A magnetic disk consists of a *disk assembly* and a *head assembly*.

The disk assembly consists of one or more circular platters that rotate around a central spindle. 

Upper and lower surfaces of each platter are covered in a magnetic material on which bits are stored. 

The disk is organized into *tracks*, which are concentric circles of a platter

The tracks at a given distance from the center, across all the surfaces form a *cylinder*. Density of data is greater along a track than radially. 

Tracks are separated into *sectors* by gaps in the magnetic material. A sector is an indivisible unit, as far as reading and writing are concerned. 

Blocks are logical units of data and are stored on one or more sectors. 

The head assembly holds the disk heads, one head for each surface.

The head reads (or writes) the data as the disk spins beneath it.

The head assembly moves as a single unit. 

#### Disk Controller

Disk drives are controlled by a disk controller, a small processor capable of:
1. Controlling the activator to move the head assembly
2. Selecting a sector from all those in a given cylinder. 
3. Transferring bits between the desired sector and main memory
4. Buffering a track or more, in local memory, anticipating its use 

### Disk Access Characteristics

Accessing a disk block requires 3 steps, each with an associated delay:
1. Disk controller moves the head to the right cylinder: seek time
2. Controller waits until the right sector moves under the head: rotational latency
3. All sectors (and gaps) pass under the head: transfer time

The sum of seek time, rotational latency, and transfer time equal the latency of the drive 

Seek time is usually between 0 and 10 msec

Rotational Latency is between 0 and 10 msec (average around 5msec)

Transfer times are usually sub-msec range

Typical latency averages around 10 msec.

Disk latency isn't the only delay

If there's more than one disk, requests may have to wait, and *scheduling latency* becomes an issue 

In the worst case, requests arrive faster than they can be filled, and scheduling latency becomes infinite

There are things we can do to improve throughput (the number of disk accesses per second)
- Place blocks that are accessed together on the same cylinder, reducing seek time 
- Divide data among multiple smaller disks instead of one large one
- "Mirror" a disk, so we can access multiple blocks simultaneously
- Use disk scheduling algorithm to adjust the order in which requests are filled 
- Pre-fetch blocks into main memory 

### I/O Model of Computation

We assume one processor, one disk controller, and one disk, and the database is too large to fit in main memory

The time taken to perform a disk access is much larger than the time spent manipulating data in main memory. The number of block accesses is a good approximation of the time needed by an algorithm

**Organizing data into cylinders**:

Seek time represents about half of disk latency

We can store data likely to be accessed togteher, we can ignore seek time for all but the first block 

If blocks are stored on consecutive sectors, rotational latency can also be ignored. 

#### Using multiple disks**

We can improve performance by replacing one large disk with multiple smaller disks: it gives us multiple independent heads.

Note that there's no change in access time for a single request 

**Striping** can speed up access to objects that occupy a large number of blocks. 

```
Disk 1  Disk 2  Disk 3  Disk 4
-------------------------------
1       2       3       4
5       6       7       8
9       10

```

**Mirroring** disks involves making identical copies of the data and spreading them over multiple disks.

Helps with resiliency (always have a backup)

For n disks, read time improves by a factor on n 

Write time is not improved (as we still have to write to each disk)

#### Disk Scheduling

We don't have to fill requests in the order in which they are received

Elevator algorithms: If a disk head is passing cylinders it knows contain data that must be read, it can do the read then 

#### Pre-fetching/Buffering

(Sometimes called double-buffering)

Some applications allow us to anticipate what data will needed next. We can pre-fetch that data, allowing for better scheduling. 

## Disk Failures

Forms of Disk Failures:
- Intermittent failure
    - An attempt to read or write a sector is unsuccessful, but subsequent attempts succeed
- Media Decay
    - It becomes impossible to read or write a sector, regardless of how many attempts are made 
- Write failure
    - an attempt to write fails, but the previous data can't be retrieved. 
    - often caused by a loss of power 
- Disk crash
    - Entire becomes unusuable, suddenly and permanently 


### Checksums

An approach used to detect failure

Each sector has some bits that are set depending on the value of the other bits in the sector

It's not perfect, but if we use enough bits for the checksum, the probability of missing a failure is low enough 

The simplest form of checksum is the *parity bit*.

If there are an odd number of 1's in a sector, we say that it has odd parity, and add a 1 parity bit.

If there are an even number of 1's in a sector, we say that it has even parity, and add a 0 parity bit

The number of 1's in a sector and its parity bit is always even

Examples:
``` 
Sector  Parity
--------------
1010    0
1011    1
0010    1
0011    0

```

A parity bit only detects 1 bit failures. 

Multiple bit failures, there's a 50% chance it goes undetected. 

We can use multiple parity bits for a sector

Example: 8 parity bits:
- First parity bit for the first bit in each byte of the sector
- Second parity bit for the second bit in each byte of the sector
- and so on

``` 
Data    0101
        0101
        1011
        1010

Parity  0001

```

A massive failure will likely be detected:

The chance it's missed is 1/2 for each bit (1/256 for 8 parity bits)

In general: 1 / 2^n for n parity bits

## Recovery from Disk Crashes

We use multiple disks to reduce the risk of data loss. The name for this kind of approach RAID: Redundant Arrays of Independent Disks

The idea is that some disks hold data (data disks). Others hold information determined by the data (redundant disks).

Because disks typically don't fail at the same time, we can use the redundant disks to re-create the data on a failed disk.

### RAID Level 1

The simplest is mirroring. It uses a completely redundant disk.

No data loss unless there's a second failure while the first failure is being repaired. 

RAID 1 is expensive (lots of redundant disks).

### RAID Level 4

RAID 4 uses only 1 redundant disk, regardless of how many data disks are used. 

Assume identical disks.

1 disk holds the parity bits for all the others

``` 

Disk1   Disk2   Disk3   Disk4
0101    1101    0101    1101
0110    1101    1011    0000
0011    0100    1000    1111

```

Reading data is the same as without RAID. 

Writing is more complicated, as the parity bits need to be updated as well. 

Naive approach would be to do the write, and then recalculate the parity

``` 

Disk1   Disk2   Disk3   Disk4
0101    1101    0101    1101
0110    1011    1011    0010
0011    0100    1000    1111

Update Disk 2.2
New Data 1011
```

Better approach is to take the modulo 2 sum of the old and new data, and change the parity bits where the sum is 1

``` 

Disk1   Disk2   Disk3   Disk4
0101    1101    0101    1101
0110    1100    1011    0001
0011    0100    1000    1111


Update Disk 2.2
New Data 1100
Old Data 0110
M2 Sum   1010
```

### RAID Level 5

RAID 4 is limited because every write requires an update to the redundant disk

RAID Level 5 spreads the parity blocks out over all the disks

``` 
Disk1   Disk2   Disk3   Disk4
xxxx    0101    1101    0101
0110    xxxx    0110    1011
0011    0100    xxxx    1000
0110    0101    1111    xxxx
xxxx    0101    0111    1011

```

### RAID Level 6

Using error correcting codes called Hamming Codes, we can build systems that can recover from multiple disk failures.

Basics:
``` 
Disk    1   2   3   4 | 5   6   7
        --------------+----------
        1   1   1   0 | 1   0   0
        1   1   0   1 | 0   1   0
        1   0   1   1 | 0   0   1

```

## Arranging Data on Disk 

A data element like a tuple is represented by a record, which is stored in consecutive bytes on disk. 

Collections such as relations are usually stored by placing the records representing their data in one or more blocks. 

Generally a block holds only tuples from one relation (though there are exceptions)

### Fixed-Length Records

Simplest record consists of fixed-length fields, one for each attribute of the represented tuple

In many cases, the system allows more efficient reads/writes when the data begins at an address that's a multiple of 4 or 8. Space not used by a previous field is wasted.

Each record often begins with a header, which might include:
- A pointer to the schema 
- The length of the record
- Timestamps about the last access or update
- Pointers to the fields (this can be a substitute for the schema)

![1]()

Records are stored in Blocks.

There's also a block header:
- Links to one more more other blocks (as it would for an index structure)
- Information about the role played by the block 
- Information about the relation to which the block's tuples/records belong
- A "directory" giving the offset of each record in the block 
- Timestamp data

### Representing Block and Record Addresses

In memory, a block's address is the memory address of its first byte; a record's address is the address of its first byte

It's different on disk. An address might include Disk ID, cylinder number, etc. A record's address is the block address plus some offset

### Client-server system addresses

We'll think of Main Memory as a "client" system (in practice, there could be many "client" processes accessing the underlying "server" data). 

The server system manages secondary storage 

Approaches to Server record addresses:
- Physical address (host, disk, cylinder, track, etc.)
- Logical address: arbitrary string of bytes 
    - System maintains a map table between logical and physical addresses. 

Note that physical addresses may be long 

Indirection allows flexibility. As we move records around, we only update their physical location in one place. 

We can also use an *offset table* for each block. Records are stored starting at the end of the block. (Good for variable-length records)

### Pointer Swizzling

Often, pointers are part of records. It's not common for records representing tuples. Very common for objects, usually necessary for index structures

When records are in secondary storage, we use its "database address" (the logical address known by the secondary storage system).

When the record is in main memory, we have the option to use either the memory address or the database address.
- Generally more efficient to use the memory address when possible, because we can just follow the pointer. When we use a database address, it must be translated to a memory address.

We try to avoid the cost of repeatedly translating database addresses by using *pointer swizzling*

Basic idea: when we move a block from secondary storage to main memory, its pointers may be "swizzled" (translated to memory addresses) 

Strategies for Swizzling:
- Automatic: done when the block is brought into memory
- On-demand: leave pointers unswizzled intially. If we end up following a pointer, we swizzle it then. 
- No swizzling
- Programmer Control: there may be cases where an application developer may know in advance if the pointers are likely to be followed. 

When we return blocks to disk, we need to unswizzle its pointers. 

A block in memory may be "pinned" if it can't be safely written back to disk at a given time. 

Pointer Swizzling is one reason blocks may become pinned. Assume Block B1 contains a swizzled pointer to B2. We can't move B2 back before we unswizzle the pointer in B1. 

### Variable-Length Records

Variable-length data tends to fall into 4 categories:
- Data items of variable size (how do we handle `VARCHAR(255)`?)
- Repeating fields 
    - To represent a many-to-many relationship in a record representing an object, we store a variable number of object references
- Variable-format records (e.g., a record representing xml data, with few constraints)
- Enormous fields (e.g., mpeg data)

#### Variable-length fields

A record needs to contain enough information to find all the fields in the record

We can put all the fixed-length fields in front.

Then we have a record-header that contains:
- The length of the record
- Pointers to (or offsets of) the beginnings of all the variable-length fields

Note that this approach can be helpful as well with fields that can be null. If a tuple has a null value, we use a null pointer, even if the field is fixed-length.

#### Records with Repeating Fields

We can use a similar approach. If we have a field F with repeating values, we group all the values of F together, and then have a pointer to the first occurence. 

Another option is to keep all fixed-length data with the record, store variable-length and repeating data elsewhere (i.e., on another block) and maintain pointers (which are fixed-length) to those other data elements in the original record. For repeating values, we store a pointer to the first one, and either the number of repetitions, or a pointer to the last one.
- Advantages: 
    - Searches of records are more efficient. 
    - Moving records among blocks is more efficient
- Disadvantages:
    - Larger number of I/Os to examine all the components in a record

We can compromise between the two by setting aside some space in the fixed-length record, and using space on other blocks as needed.

#### Variable-Format Records

We use *tagged fields*, each of which consists of the value of the field preceded by information about the role of the field. For example:
- The attribute or field name
- The type of the field
- The length of the field

#### Records that do not fit in a block

We can use a technique called *spanned records*.

Note that this is also useful when a whole record does fit into a single block, as it can reduce wasted space (consider a record that's just larger than half a block).

The portion of a record that appears in one block is called a *record fragment*

A record with two or more fragments is called *spanned* (records that don't cross a block boundary are *unspanned*)

For every record and record fragment, we add some additional header information:
- A bit indicating whether this is a record or record fragment
- If a fragment, we have bits indicating if it's first or last
- If there are next/previous fragments, we have pointers to those fragments

### BLOBs

Binary Large Objects

Often used for audio or video (or similar) data

Generally stored on a sequence of blocks. We often prefer them to be allocated consecutively on a cylinder of a disk.

Sometimes necessary to *stripe* the BLOB across several disks for faster retrieval.

### Column Stores

We have the option to store data records that contain the values in columns of a relation, rather than tuples. 

For example:

```
R(X, Y)
  a  b
  c  d
  e  f
```

One record might contain (a, c, e) and another (b, d, f).

This allows us to take advantage of the fact that all the values are of the same (known) type. For example, if the type is `CHAR(1)`, each is only a single byte but would take up four bytes if the tuples were stored in records rather than columns.

Typically, this is only an advantage if we typically need retrieve large numbers of the values in a given column at once.



# NoSQL

Relational Databases have been around a long time, have lots of advantages, especially Query Performance

As computing has changed, we've moved from monolithic applications towards very distributed applications. 

Rigidity of SQL can be a disadvantage

NoSQL is the umbrella term for a growing number of alternatives to the traditional relational database

## Types of NoSQL

4 basic types of NoSQL
- Document databases: key-value pairs, whose values are a complex type
- Graph Stores (Neo4J, Giraph)
- Key-value stores: (simplest NoSQL) Redis, BerkelyDB 
- Wide-Column Stores: databases that are optimized for very large datasets
    - Columns are stored together, rather than the rows
    - Cassandra, HBase


## Benefits of NoSQL

- Often more scalable
- Can have a higher performance (for certain operations)
- Data model handles things the relational model won't
    - Large volumes of rapidly changing unstructured data
    - Agile development with quick release cycle and frequent schema changes
- Geographically distributed databases
- Dynamic Schema
    - Schema doesn't have to be defined before you start adding data
        - Good for agile development, because you can modify the schema as development proceeds
        - With large relational databases, schema changes can involve downtime or complex upgrade/update procedures

## Differences

With NoSQL, the validation is often done by the application

### Sharding

Relational databases scale vertically: a single server hosts all the data to allow for joins, transactions, etc. 

Sharding involves splitting the data over a number of servers by splitting the data "horizontally," by moving some of the rows to a different database instance

Considerable performance gains are possible

Disadvantages:
- Heavier reliance on the interconnection between servers
    - Increased latency when querying
    - Data is only sharded on one axis
        - Some queries become slow or impossible
- Hard to reason about or guarantee the consistency of the data

NoSQL DBMS often support "auto-sharding" taking some of the complexity out. 

Distributed approach also makes replication of the data easier than many relational databases

## Disadvantages of NoSQL

- Transaction support is minimal 
- Data consistency is often not guaranteed
- Data must often be validated by the application 

## Document Model

Relational model is effectively based on tables. There usually isn't a good mapping between the data structures used by an application and the structure of the data in a relational database. 

Called object-relational impedence mismatch
- Can be addressed by ORM (object-relational mapping)
    - Adds complexity, additional code which must be either learned/written and managed. 

Document Storage DBMS are based on a single data structure: documents. 

Related data is embedded in sub-documents. 

In MongoDB, documents are JSON objects (essentially). This has many of the advantages of semi-structured data that we discussed last week. The data is self-described (lower barriers to entry for new developers).

```json
{
  "name": "my string",
  "other field": 16,
  "my array": [
    "value one", "value 2", 3
  ],
  "sub-element": {
    "name": "foo"
  }
}
```

Technically, MongoDB stores JSON documents as BSON (Binary JSON). This allows for encoding of other data types, like floats, longs, decimal128 (lossless decimal format).

Other advantages of using Documents:
- Documents correspond to objects in many programming languages
- Embedded documents often reduce the need for expensive joins
- Dynamic schema supports polymorphism

```json
{
  "name": "Database Applications and Systems",
  "semester": "F20",
  "schedule": {
    "day": "Wednesday",
    "startTime": "16:45",
    "endTime": "19:35"
  },
  "capacity": 30,
  "students": [
    {"name": "alice"},
    {"name": "bob"}
  ]
}
```


BSON documents are stored in *collections*

Collections are stored in *Databases*. 

``` 
use example;

db.myCollection.insertOne({})
db.myCollection.find({})
```

By default, a collection doesn't require its documents to have a schema. You can define document validation rules. 

You can modify a document's schema simply by modifying the document

You can create read-only views of a collection. 

Fundamentally, a document is a set of key-value pairs (like a JSON object).

Field names have the following restrictions:
- `_id` is reserved for use as the primary key
    - must be unique across the collection
    - is immutable
    - can't be an array
- Field names can't contain null
- Top-level field names can't start with `$`

Technically, field names don't have to be unique. You do need a data structure in your application that supports duplicated field names (and an appropriate driver).

You can also use the dot notation: `location.room`. Can be used for array elements as well: `students.0.name == "alice"`

Maximum document size is 16mb. Larger documents can be stored using the GridFS API. 

### Mongo Shell

MongoDB provides a shell, similar to psql.

Based on JavaScript

`db.collection.find()` returns a cursor.
- Can be assigned to a variable
- Otherwise, the shell prints the first 20 results

`db.collection.find().pretty()` prints results in a formatted way.

Within the shell, you can have multi-line statements. An un-closed `(`, `{`, or `[` will allow you to continue to the next line.

`quit()` (or ctrl-c) exits

### CRUD (Create, Read, Update, Delete) Operations

**Create**: `db.collection.insertOne({...})` or `.insertMany([...])`

**Read**: `db.collection.find()` (similar to `SELECT * FROM collection`)

We can use filter objects to do selection.

```
{
    fieldName: value,
    otherField: {
        operator: value
    }
}
```

Some operators:
- `$in` (checks if the value is in a list)
- `$lt, $lte, $gt, $gte, $ne, $eq, $nin`
- `$and, $or, $not, $nor`
- `$exists` checks for the existence
- `$type` checks if the field of the specified type

Lots more.

```
{
    fieldName: value,
    otherField: {
        $and: [
            {$lt: 5},
            {$gt: 0}
        ]
    }
}
```

**Updates** `db.collection.updateOne()`, `.updateMany()`, `.replaceOne()`

Takes the form: `db.collection.updateOne(filter, update, options)`

The `filter` object is the same as for reads

The `update` object:

``` 
{
    updateOperator: {
        field: value,
        field2: value
    },
    updateOperator2: {
    ...
    }
}
```

Update Operators:
- `$set`
- `$inc, $currentDate` 
- `$min, $max` (reset to the min or max of the current value and given value)
- `$rename, $unset`

More

**Deletes** `db.collection.deleteOne({})` also `.deleteMany({})`

## Graph Databases

Graph databases fall somewhere between the relational model and the document/key-value store.

Fundamentally they store nodes and edges.

Nodes are similar to documents in a document-storage database.

Edges describe relationships between nodes

One well-known graph database is Neo4J

Uses a query language called "Cypher"

`CREATE (var:Label {properties})`

Labels are strings, optionally applied to a node. A node may have zero or more labels.

Find nodes with `MATCH (var:Label) WHERE var.name="alice" return var;`

We can create edges:

`(node)-[var:Label]->(other-node)`

Pattern matching:

`MATCH (ee:Person)-[:Knows]-(friends) RETURN friends`

Patterns can have wildcards too

`MATCH (ee:Person)-[:knows]-()-[:knows]-(friendOfFriend) return friendOfFriends`

## Object Storage Databases

- Beyond simple key-value stores (like redis)
- Intended as a way to store massive amounts of data for fast retrieval
- Intended for static data, long-term storage

Best known implementation is Amazon's S3

Another implementation is OpenStack Swift (open source)

Uses distributed architecture, no central point of control

Objects are written to multiple hardware devices in a *cluster*. Swift provides consistency and replication.

### Notable characteristics

- "unlimited" storage: "flat" namespace (no hierarchy for the data)
- No RAID necessary
- Objects stored can have metadata like: access control, expiration, etc.

All objects stored are given a URL.

Developers interact with the system through a RESTful API. (Client libraries exist for most programming languages).

Object data may be located anywhere in the cluster.

#### Basic Architecture

Components:
- *Proxy Servers* handle incoming requests to the API
- *Rings* map logical names of data to locations on particular physical storage nodes
- *Zones* isolate data from other zones.
    - Data replicated across, so that a failure in one zone doesn't impact the next
- *Accounts* and *Containers* are individual databases distributed across the cluster. Account database lists the containers on that account. A container database lists the objects stored in that container
- *Objects*: the data itself
- *Partitions* store objects, containers, accounts, and manage their locations within the cluster

**Proxy Servers**

The public face for the Object Store.

Handle incoming API requests

Given a request, they determine the object's storage node, coordinate responses and timestamps.

Use a shared-nothing architecture, and can be scaled as needed.

**Rings**

A ring represents a mapping between the names of the entities stored in the cluster, and their physical location on disk.

There are separate rings for accounts, containers, and objects. They maintain the mapping using zones, devices, partitions, replicators.

Each partition is replicated 3 times by default.

The ring is responsible for determining which device is used as a handoff device during failure.

Data can be isolated into zones. We try to put different zones in different partitions. Zones may represent a drive, server, cabinet, switch, even a whole data center.

Partitions of a ring are distributed among all the devices of an installation.

When moving partitions, the ring makes sure a minimum of partitions are moved, and only one replica is moved at a time. 

**Zones**

We configure zones to isolate failure boundaries.

If possible, each data replica resides in a different zone.

A zone could be as small as a single drive. 

The goal of zones is to allow the cluster to tolerate failure without a loss of data.

**Accounts and Containers**

*Accounts* are the top-level organization. Accounts provide a namespace for containers.

*Containers* are namespaces for objects. An account may have unlimited containers. Containers are used for access control.

Each account and containers has its own SQLite database that is distributed across the cluster.

**Partitions**

A partition is a collection of stored data. 

Includes account and container databases and objects.

Partitions are at the core of the replication system. (It's easier to operate on a partition than a bunch of smaller things.)

A partition is conceptually simple: it's just a directory sitting on a disk with a corresponding hash table of what it contains.

**Replicators**

Replicators ensure that there are three copies of each partition. It continuously updates each partition:

For each local partition, it's compared against the copies in other zones. (This is done by comparing the hashes of the contents of the partitions).

This works because partitions are the unit of what's copied and transferred. The number of partitions remains constant as the system scales, meaning comparison and transfer can be done.

Data consistency is eventual. Older copies of the data may be served from partitions that haven't been updated. All partitions will converge around the latest data eventually.