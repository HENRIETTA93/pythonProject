# Index Structures

Consider `SELECT * FROM R WHERE a=10`

An index is a data structure that takes the value of one or more fields (the search key) and finds the records with tuples containing the key

## Index Structure Basics

Storage structures consist of files, similar to the files used by an operating system

For example, a "data file" may store relations (or the tuples of a relation)

A given data file may have more than one index file

Each index file associates values of the search key with pointers to the data file records that contain those values. 

Indexes can be:
- Dense: there's an entry for every record of the data file
- Sparse: only some records are represented, often one per block 

Indexes can be:
- Primary: the index file determines the location for the records in the data file 
- Secondary: the index file does not determine the location 

### Sequential Files

A *sequential file* is created by sorting the tuples of a relation by their primary key. The tuples are stored in order.

It's common to leave space in each block for insertion of new records

### Dense Indexes

If we sort the records, we can build a dense index, which is a sequence of blocks holding only the keys of the records and pointers to the records. 

The index must be maintained in the same order as the tuples themselves

Generally most useful when the whole index will fit into memory

The number of blocks in the index is small compared to the size of the relation (number of data blocks)

Keys are sorted, so lookup is Log N (Log base 2)

### Sparse Indexes

Sparse Indexes have one key-pointer pair for each block of the data file

Much less space is required 

A sparse index can only be used if the data file is sorted on the search key

### Multiple Levels of Index 

Index files may not all fit in main memory and so might require multiple disk I/Os to retrieve a record 

An index on an index reduces this problem 

Generally, we prefer B-Trees

### Secondary Indexes

Secondary Indexes do not determine the placement of the records in the data file 

It tells us the location of records, which may already have been determined by a primary index 

Secondary Indexes are always dense 

Applications of Secondary Indexes:
- Additional indexes on other search keys 
- Some storage structures (heaps)
- Clustered Files

### Clustered Files

Assume some relation R with a many-to-one relationship with another relation S.

Ex: Grades -> Students 

Grades are frequently retrieved with students. Rather than storing the grade tuples separately, we can store them with the related student tuples.

Then we create a secondary index for Grades

### Indirection in Secondary Indexes

If a search key appears n times in the data file, it must also appear n times in the index file.

It could be better to write the value once for all the pointers to records for that value.

We use "buckets" as a level of indirection. Each search key has a pointer to a bucket, and that bucket has pointers to the records for that key.

This approach saves space as long as the search key is larger than a pointer, and the average key appears twice.

There are other advantages: we can use the pointers in the buckets to improve the query before we've retrieved any data.

Example: 

```postgresql
SELECT * 
FROM course 
WHERE semester='F20' 
AND location='Remote'
AND time='TF10-12'
``` 

We can find the pointers that satisfy all conditions before the data is retrieved

### Document Retrieval and Inverted Indexes

Common challenge to retrieve documents that contain a given keyword

Think of a document as a tuple in a relation (Doc). Doc has many attributes, one for each possible word. Each attribute is boolean (either the document contains the word or it does not). 

Build a secondary index on each attribute of Doc. However, we don't store pointers to records where the value is False.

Instead of having separate indexes, we create one large index, called an inverted index. 

We use buckets for space efficiency

We can expand the index to consider other contextual information

This allows more complex queries without actually retrieving any data, as we can again compare sets of pointers. 

 ## B-Trees
 
 B-Trees are a family of data structure used for indexes (we'll limit ourselves to B+ Trees)
 
 B-Trees automatically maintain as many levels of index as is appropriate for the size of the file being indexed
 
 B-Trees manage the space on the blocks they use so that every block is between half used and full. 
 
 B-Trees organize their blocks so that the tree is balanced: all paths from root to leaf have the same length
 - Typically three layers 
 
 There is a parameter n that is associated with a given B-Tree. Each block will have space for n search-key values and n+1 pointers.
 
 We pick n to be as large as possible within the given constraints
 
 Example: Block size of 4096 bytes, Integer search keys (4 bytes), 8-byte pointers 
 
 4n + 8(n+1) <= 4096
 
 n = 340
 
 ### B-Tree Blocks
 
 What's in a B-Tree Block?
 - Keys in leaf nodes are copies of keys from the data file
    - They are distributed among the leaves in sorted order
 - At the root, there are at least two used pointers
    - All pointers point to blocks at the level below
 - At a leaf, the last pointer points to the next leaf block
    - All other used pointers (at least (n+1)/2 of them) point to data records
    - The ith pointer points to a record containing the ith search key value
- At an interior node, all n+1 pointers can be used to point to blocks at the next level
    - At least (n+1)/2 pointers are used
    - If j pointers are used, there will be j-1 keys: k1, k2, ..., k(j-1)
        - The first pointer points to a part of the tree with values less than k1
        - The second pointer points to a part of of the tree with values greater than or equal to k1, and less than k2
        - Etc. 
        - The last pointer points to a part of the tree with values greater than k(j-1) 
- All used pointers and their key appear the beginning of the block, except the (n+1)th pointer in a leaf, which points to the next leaf

### Applications of B-Trees

- Search key of the B-Tree is the primary key for the data file, the index is dense . One key-pointer pair for every record in the data file
- The data file is sorted by its primary key. The B-Tree is a sparse index: one key-pointer pair for every block the data file
- The data file is sorted by an attribute that is not a key, and this attribute is a search key for the B-Tree
    - One key-pointer pair for every value k that appears. The pointer points to the first instance of k. 

Note that we can have B-Trees that allow for multiple instances of a search key. In such cases, the key values in each node might not all be filled.

For the purposes of this class, we'll assume no duplicates. Also assume a dense index: every search key value in the data file also appears at a leaf.

### Operations in B-Trees

**Lookup** is recursive: Find search key k.

Base case: If we're at a leaf node, if the ith key is k, the ith pointer takes us to the correct record

Induction: Interior node with keys k1, k2, ... kn
- If k < k1, follow the 1st pointer
- If k >= k1, and k < k2, follow the second pointer
- If k < ki, follow ith pointer
- Else follow n+1 pointer

**Range Queries**

B-Trees are useful not only for single value, but for range queries as well (between a and b)

Search for a. Whether or not it exists, we end up at the leaf node where it would.

We follow every associated pointer, using the n+1 pointer to jump to the next leaf, until a key larger than b, which point we stop. 

**Insertion** is a recursive process

Find the appropriate leaf, and insert if there's room

If there's no space, split the leaf, and divide the contents equally. Splitting appears as insertion at the next level, so repeat. 

The only exception is if Root is full, in which case we split and create a new root at the next level. 

When we split a node, we need to manage the keys. 

We now have n+1 key values and n+2 pointers.

We create a new node, to the right of the current node

We take the first (n+2)/2 pointers and leave them in the existing node

We take the last (n+2)/2 pointers, and move them to the new node 

The first n/2 keys stay with our original node.

The last n/2 keys move to the new node.

There is always one key leftover. It indicates the smallest key reachable via the first of the new node's children. The key doesn't appear in either the original node or the new node. We insert this key into the parent node.


**Deletion**

We do a search, and delete the key-pointer pair

However, it's possible that the deletion drops the space used below the 50% threshold. If an adjacent node has more than the minimum, we move a key from there. Otherwise, we can combine the two to create a full node.

### Efficiency of B-Trees

B-Trees typically have 3 levels (340 gives ~16 million records)

Lookup requires 3 reads (2 if the root is buffered) 

Most inserts and deletes only require the same 

## Hash Tables

A hash table is a data structure that organizes data using a hash function, which takes input and returns an integer between 0 and B-1, where B is the number buckets in the hashtable. 

A bucket array is an array, indexed from 0 to B-1 that holds the heads of linked lists. 

If a record has search key K, we store it in the bucket list for the bucket numbered H(K)

### Secondary Storage Hash Tables

A hash table may hold too many records to fit in main memory. If the records are kept in secondary storage, we make a few alterations from a "normal" hashtable

The bucket array consists of Blocks rather than Linked Lists

Assume that the location for the first block in any bucket can be determined (maybe a main memory array of pointers to blocks, or the buckets are in fixed, consecutive locations on disk)

Each block holds records and a "nub" with additional information, like pointers to overflow blocks 

#### Insertion

Compute H(k), determine the block, if there's no space in the block, add an overflow block

#### Deletion

Similar to insertion. If we can consolidate overflow blocks, we do

### Choice of Hash Function

The hash function should produce an even distribution of keys over the range of the function 

It should be easy to compute

It's a common choice for integers to use `k % B` 

### Efficiency

Ideally, there are enough buckets that most of them fit on one block. Then lookup takes only 1 I/0. Significantly better than B-Tree

However, as the file grows, we'll end up with multiple overflow blocks, potentially long lists of blocks (many I/Os per lookup). A good reason to try and keep the blocks/bucket low

## Dynamic Hashtables

Dynamic tables can expand as the amount of data grows

Two approachs:
- Extensible Hash Tables
- Linear Hash Tables

### Extensible Hash Tables

4 Major differences between static hash tables and extensible hash tables:
1. A level of indirection for buckets: The array of pointers is to buckets, not blocks themselves
2. The array can grow in length. It's always a power of 2
3. There doesn't have to be a block for each bucket (buckets can share blocks under certain circumstances)
4. The hash function computes a sequence of k bits, for some large value of k (maybe 32)
    - However, only the first i bits are used.
    - The array is of length 2^i

#### Insertion into an extensible Hashtable

1. Compute H(k) for the search key k
2. Consider the first i bits, go to the bucket for that value
3. Arrive at block B
    - If there's space, insert the record, and we're done
    - If there's not space, we have two options, depending on the value of j
        - If j < i: Split B into 2 blocks
            - Distribute the records in B based on the value of their (j+1) bit
            - Put (j+1) in each block's nub
            - Adjust the pointers in the bucket array accordingly 
        - If j = i: Increment i
            - Double the length of the bucket array so it now has 2^(i+1) entries
            - Given some w determined by the first i bits, there are now w0 and w1. Both will point to the same block as w
            - Now j < i, and we can split the block as in the previous case

**Advantages of Extensible Hashtables**:

- Never have to retrieve more than one block 

**Disadvantages**:
- Doubled array may no longer fit in memory, or may crowd out other data we'd want in memory
- If the number of records per block is small, we're likely to see a block that is split far earlier than necessary

### Linear Hashing

It grows the buckets more slowly

Differences/New Elements:
- The number of buckets n is always chosen so that the average number of records per block is a fixed fraction (e.g., 80%)
- Blocks cannot be split, so overflow blocks are permitted
    - The number of overflows per bucket will average < 1
- The number of bits used to determine the entries of the bucket array is Log2(n), where n is the current number of buckets. These bits are always taken from the right hand side (least significant) 
- Suppose i bits are being used to number array entries:
    - a record with key k is intended for bucket a1a2...ai (the last i bits)
    - Treat a1a2...ai as integer m
    - If m < n, the bucket must exist: we insert there 
    - If n <= m < 2^i, the bucket doesn't exist yet, we use the bucket represented by m-2^(i-1)
- Each time we do an insert, we compare r/n to our desired ratio 
    - If it's too high, we add another bucket to the table 
    - Note that the new bucket likely has no relation to the inserted record
- If the number of buckets exceeds 2^i, increment i
    - All buckets now have a leading 0, but it doesn't matter, since we treat them as integers anyway
    

## Multidimensional Indexes

All indexes so far are one-dimensional

They may include multiple attributes but don't function well if an attribute is missing or unknown 

### Applications of Multidimensional Indexes

Often not done in SQL systems

One important application is Geographic Information Systems 
- Obviously used for maps
- Integrated circuit design
- UI layout

Typical Queries we ask of a GIS:
1. Partial Match queries: specify values for a subset of attributes: look for all matches 
2. Range Queries: given ranges for one or more dimensions, find all points within the ranges 
3. Nearest Neighbor: Ask for the closest point to a given point
4. Where Am I? queries: given a point, what shapes contain that point

Conventional indexes will support these to an extent:

Range queries: B-Tree index on each dimension. 
    - Execute the range query for each, and obtain a set of pointers, take the intersection of those sets

Nearest Neighbor: we pick a range in each dimension and execute a query

Failure points:
- No point in range 
- Closer point is actually outside 

We can address the first by gradually expanding the range

Address the second by executing the query again with a slightly larger range to confirm 

## Overview of Multidimensional Structures

Similar to one-dimensional index, structures fall into two categories:
- Hashtable-like structures
- Tree-like Structures

In both cases, we give something up to gain the added dimension:

Hash structures will not answer queries with just one bucket

Tree structures give up at least one of:
- Balance of the tree
- Correspondence between tree nodes and disk blocks 
- Speed of modifications

### Hash Structures

**Grid Files**: in each dimension, the space is partitioned into stripes

The number of grid lines may vary between dimensions, and the spacing between them might not always be equal

The idea is to set the grid lines so that there are an equal number of data points in each space


**Partitioned Hash Function**

Hash functions can take multiple arguments

We can design a hash function so that it's actually a series of hash functions 

For example, we could use 10 bits: 4 bits for the first argument, and 6 bits for the second

This allows us to limit the buckets of the hash table in which we look 

### Tree-like Structures

- Multiple-key indexes
- kd-trees
- quad trees
- R-trees 

**Multiple Key indexes**

Basic idea is to build an index of indexes 

Partial match queries work well if we have the first attribute. Otherwise, we have to search every sub-index. 

Range queries and nearest neighbor queries work reasonably well

**kd-trees**

A kd-tree is a binary tree where interior nodes have an attribute and a value V for that attribute that evenly splits the dataset in two.

The attributes at different levels are different, alternating as needed among the dimensions






# Query Execution

The query processor is the collection of components that turns user queries and data modification commands into a sequence of database operations, and then executes those operations

**Basic Division**

Query compilation:
    - Parsing
    - Rewrite (changing SQL into relational algebra)
    - Physical Plan generation

Last two (rewrite and physical plan generation) are referred to as Query Optimization

It's the hard part of query processing. 

## Physical Query Plan operators

Physical query plans are built from operators

Often are just physical implementations of relational algebra operators

Also include physical tasks not in relational algebra, such as bringing a table from disk into main memory.

Called a table "scan."

### Scanning Tables

Simplest physical query plan involves reading the tuples of some relation R
- Variation involves a predicate, applied to each tuple 

Two approaches for table scans:
- System knows the blocks containing the tuples of R. Blocks are obtained one by one. Called a *table-scan*
- There's an index on R (possibly a sparse index). Use the index to find the right blocks. Called an *index-scan*

Using an index scan makes it easy to apply a predicate, not just obtain all the tuples of R. 

### Sorting while scanning tables

Reasons for wanting to sort the relation:
- Most obvious is an `ORDER BY` clause 
- Other reasons might include relational algebra expressions (grouping)

The operator *sort-scan* takes a relation R and a set of attributes on which to sort, and produces R in sorted order

Several approaches:
- If there's a B-Tree on R for the appropriate attributes, we can use that.
- If R will fit in main memory, we use a table-scan and sort in memory
- Otherwise, use a Multiway Merge Sort

### Cost Model for operations

We again focus on the number of disk I/Os that are needed for the operation. 

Additional assumption: the arguments for any operator are found on disk, but the result of the operation is left in main memory. 

Reason: many operations have their result written to disk. Even when the results are written to disk, their cost is only related to the size of the result. 

#### Other parameters for measuring cost

We need to measure the amount of memory an operation uses

Assume that memory is divided into buffers, which are the same size as disk blocks. 

Let M be the number of buffers available. Often this is the amount of memory on the system, though in practice it will be limited based on what other operations are going on. 

Another assumption that data is accessed one block at a time from disk. 

Three parameter families: B, T, V

B(R) or B, is the number of blocks needed to hold all the tuples of R. 
- If R is clustered (generally assume), B(R) implies that R uses only B blocks 
- Otherwise, the number could be much larger 

T(R) or T, is the number of tuples in R

For some relation R, with attribute a, V(R, a) is the number of distinct values of a appearing in R. 

### I/O Cost for Scan operators

If R is clustered, the number of disk I/Os for a table scan is B. 

If B < M (R fits into memory), a scan-sort also costs B. 

If R is not clustered, the costs are higher, potentially T. 

For an index scan, there is a cost to loading the index, but it's sufficiently smaller than B(R) that we can ignore it.

So an index scan of R costs B, regardless of whether R is clustered or not. 

(Simpler/cheaper still if we ony need part of R and can use the index to avoid loading all the tuples).

#### Iterators

We can implement many physical operators as an iterator, with the usual `open()`, `getNext()`, and `close()` methods. 

Depending on the operation, this can save on memory. 

Table scan for example now only needs one block at a time. But a sort-scan still has to do all of the work in the `open()` method: no tuple may be operated on via the `getNext()` until all the tuples have been read. 

## Algorithms for physical query operators

Three categories:
- Sorting-based methods
- Hash-based methods
- Index-based methods

We can also divide into three "degrees" of difficulty and cost:
- One pass algorithms: Data is read only once. Usually one argument must fit entirely in memory
- Two pass algorithm: we read all the data, do some work, write the result back to disk, read again
- Multipass Algorithms: no practical limit on the size of the data on which they operate

## One-Pass Algorithms

3 types:
- Tuple-at-a-time Unary operations 
- Full relation unary operations
- Full relation binary operations

### Tuple-at-a-time operations

Includes selection or projection, which have obvious algorithms:

We read the blocks of R one at a time into an input buffer, perform the operation, move the result to an output buffer. 

We don't consider the output buffer in terms of required space. 

These algorithms require only M >= 1

Disk I/O requirement depends on how R is provided. 

If R is on disk, the cost is the same as a table or index scan: B if R is clustered, T if R is not clustered.

(A relevent index might improve this). 

### One-pass Unary Full-relation operations

Apply to relations as a whole: duplicate elimination, grouping

#### Duplicate Elimination:

- Read each block of R
- For each tuple, we consider is this the first time we've seen it?
    - If yes: copy to output buffer
    - If no: don't copy 

We need to keep in memory one copy of every tuple.

One memory buffer holds the working block of R. 

The remaining M - 1 buffers may hold copies of previously examined tuples.

We choose an appropriate data structure: usually a hashtable or balanced binary search tree

Memory usage: B (d(R)) <= M 

In general, we can't know if we have sufficient memory without doing the computation. 

#### Grouping 

We have grouping attributes and aggregated attributes

We keep one main memory entry for each group with the values of grouping attributes and:
- Min/Max: we maintain the current min/max, replacing when needed
- Count: maintain the count, increment as needed 
- Sum: accumulated sum, adding as we go 
- Avg: we maintain both the sum and count, until all the tuples have been seen 

We can't produce any output until all the tuples have been seen. 

As with duplicate elimination, hashtable or balanced search tree for holding the groups in memory (using the grouping attributes as the search key)

The number of disk I/Os is B 

Memory usage is not related to B. Typically M < B 

Groups could potentially be longer than the tuples. 

**Note on nonclustered data** We typically assume R is clustered. If it's not the disk I/Os could be T instead of B.

However, if the input is the result of a previous operation, it will always be clustered. 

### One Pass Algorithms for Binary Operations

Set operations, Products, and Joins

For the Set operations, we need to distinguish between the set and bag versions. 

#### Bag Union 

R Union S is simple: make one pass through both R and S.

Disk I/Os is B(R) + B(S)

M = 1

**All the other operations** require reading the smaller of the two (conventionally S) into memory, and building a suitable data structure. 

Approximate min(B(R), B(S)) <= M 

One buffer used for the blocks of the larger relation, the rest of memory is used for the tuples of the smaller

#### Set Union

- Read the smaller relation
    - Build a search structure whose key is the whole tuple 
- All tuples are copied to output
- Read the larger relation
    - For each tuple, if it exists in the search structure, ignore it. 
    - Otherwise, copy it to output

#### Set Intersection

Similar to Set union, except:
- We don't copy any of the tuples of the smaller relation to output
- If any tuple of the larger relation exists in the search structure, copy it to output

#### Set Difference:

Start in the same way: copy S to memory (in a search structure)

R - S: if a tuple of R isn't in the search structure, copy it to output

S - R: if a tuple of R is in the search structure, delete it. At at the end, copy to output the remaining tuples in the search structure

#### Bag Intersection:

We we read S into buffers, we give each unique tuple a count (no need to store multiple copies)

Cost is still B(S) <= M 

For each tuple in R, if it appears in the search structure with a positive count: copy to output, and decrement the count. 

#### Bag difference

Start the same way: read S and count occurences of tuples

S - R: For each tuple of R, decrement the count if it's in the search structure

Output the tuples that remain with a positive count. 

R - S: For each tuple t in R, if t doesn't exist in the search structure, or if the count is 0, output t. Otherwise decrement the count

#### Product

R x S

Read S into M-1 buffers

For each tuple of R, produce a pair with each tuple of s in memory. Copy the formed tuple to output. 

#### Natural Join:

Assume that R(XY) and S(YZ),

Read all tuples of S into memory. Build a main memory search structure using Y as the search key. M-1 blocks of memory 

For each tuple t in R, use the search structure to find the tuples of S that agree with t on Y. Create a joined tuple and copy to outpu.

Also takes B(R) + B(S) Disk I/Os.

Other joins are similar. 

### Nested Loops Joins

"One and a half" passes: one of the relations will be read only once, but the other will be read repeatedly.

Nested loops can be used for relations of any size. 

**Tuple-Based Nested Loop**

Compute R(XY) Join S(YZ)

- For each tuple s in S
    - for each r in R
        - construct tuple t from s and r 
        - if s.y == r.y
            - output t 

Worst case could be T(R)*T(S) Disk I/Os

An index would help if available

Another option is a block-based iterator:
- We organize access to both argument relations by blocks and
- Store as much of S as possible in memory

The first point reduces the number of reads we do for the tuples of R
The second point allows us to join each tuple of R with as much of S as possible, each time it's read.

``` 
open() {
    R.open()
    S.open()
    s := S.getNext()
}

getNext() {
    repeat:
        r := R.getNext()
        if (r == NotFound) {
            R.close()
            s := s.getNext()
            if (s == NotFound)
                Return NotFound 
            
            R.open()
            r := r.getNext()
    until (r and s join)
    return the join of r and s
}

close() {
    R.close()
    S.close()
}
```

We assume that B(S) <= B(R)

Now we assume that B(S) > M

Repeatedly load M-1  blocks of S into memory. Build a search structure with a key of Y (common attributes)

Go through all of R, finding the tuples that join

Simplied:

``` 
For each M-1 chunk of S:
    load into memory
    organize into a search structure
    For each block b of R
        read b into memory
        For each tuple t of b
            find tuples of S in memory that join
            output the join
```

#### Performance of Nested Loop Joins

Number of chunks in the outer loop s B(S)/(M-1)

Each iteration, we read M-1 blocks of S, and B(R)

B(S)*(M-1 + B(R))/(M-1)

Roughly: B(S)*B(R)/M 

Better options are available when both R and S are large.

When one is marginally bigger than memory, the cost isn't much greater than a one-pass join. 

*These are the notes from the Query Execution lecture I gave for this topic last year (Spring 2019)*

## Two Pass Algorithms

Mostly based on sorting or hashing

Multipass can handle larger chunks of data than one-pass algorithms

Can be extended beyond two passes to deal with larger data files

We focus on two-pass algorithms because:
- Two passes are usually enough
- Generalizing to more passes is not hard

### Two-Phase Multiway Merge Sort

Used to sort very large relations

To sort relation R:

**Phase 1:** Repeatedly fill M buffers with tuples of R, and sort, using any in-memory sorting algorithm. Write the result back to disk. 

**Phase 2:** Merge the sublists
- There can be at most M-1 sublists 
- One block/buffer per sorted sublist
- One buffer for output 

Merge as follows:
1. Find the smallest key among the first elements of each of the sorted sublists
    - Done in main memory: even a linear search will do. 
    - Options exist for using a priority queue 
2. Move the smallest element to the first available position of the output buffer
3. If the output buffer is full, write it to disk. 
4. If the block from which the element was taken is exhausted, load the next block of the sublist
    - If no blocks remain, leave that buffer empty. 
    
No more than M-1 sublists. Each sublist has M blocks. 

B(R) <= M (M-1)

B blocks in the first phase

B blocks for output to disk

B blocks are read when all the sublists are read again

3B disk I/Os.

### Duplicate Elimination

Sort the tuples of R into sorted sublists. 

Instead of sorting when we merge the lists, select the first unconsidered tuple t
- Search the other blocks in memory for instances of t and remove the duplicate instances

Write t to output.

Repeat.

Disk I/Os is still 3B 

B <= M^2 

### Grouping and Aggregation

1. Create sublists as before, using the grouping attributes as the sort key. 
2. Load one block per sublist 
3. Repeatedly find the least value for the sort key. This value v becomes the next group:
    - Prepare to compute the aggregates for the group, using the same approach as with the one-pass algorithm.
    - Examine each tuple with the sort key v, accumulate aggregates 
    - If a buffer becomes empty, replace it with the next block in the sublist from disk.
    - When there are no more tuples with sort key v, output a tuple for the group. 

3B Disk I/Os

B <= M^2

### Sort-based Union Algorithm

For bag union, the one-pass algorithm is always sufficient. 

R Union S

1. Create sorted sublists for both R and S
2. Allocate one memory buffer for each sublist 
3. Repeatedly find the first remaining tuple t among the buffers
    - Copy t to output
    - Remove all remaining copies of t

Cost is 3(B(R) + B(S))

B(R) + B(S) <= M^2

The sort-based algorithms for intersection and difference are similar. 

### Sort-based Join Algorithm

One concern for joins is that the number of tuples that share a common value for the join attribute may exceed memory. 

If so, there's no choice other than a nested-loop algorithm

We can design our algorithm to use less memory to make this less likely. 

Given R(XY) and S(YZ)

Compute R Join S

- Sort R and S using 2PMMS using Y as the sort key. 
- Merge the sorted R and S using two buffers: one for R, one for S
    - Find the least value y, currently at the front of R and S
    - If y does not apear in the other relation, remove the tuples with y 
    - Otherwise, identify all tuples with y from both relations
        - (Up to M buffers are available for this)
    - Output all possible joined tuples involving y
    - If either relation has no more unconsidered tuples in memory, reload from disk

5 (B(R) + B(S)) Disk I/Os

B(R) <= M^2 and B(S) <= M^2

Tuples with a common join value must all fit in memory

### More Efficient Sort-based Join

(We can use this if we don't have many tuples for any y value)

- Create sorted sublists for R and S using Y as the sort key
- Bring the first block of each sublist into memory 
- Repeatedly find the value y that's the least among the first available tuples of all the sublists
    - Identify all tuples with y as their sort key
    - Output all possible joined tuples involving y

3(B(R) + B(S)) Disk I/Os

B(R) + B(S) <= M^2

## Two-Pass Algorithms based on Hashing

The basic idea is that if the data is too big to store in main memory, hash it in such a way that all the tuples that need to be considered together end up in the same bucket. 

### Hash-Based Duplicate Elimination

First Pass: Hash R into i buckets

Second Pass: use a one-pass algorithm to eliminate duplicates from each Ri (each bucket)

Each Ri = B(R)/(M-1)

So if B(R) <= M(M-1) the algorithm works

3B(R) Disk I/Os

### Grouping and Aggregation

Similar to duplicate elimination, but we choose a hash function that works on the grouping attributes.

Once we partition R into buckets, we can process each bucket in turn, as long as B(R) <= M^2

However, because we only need to one record/tuple per group, if the groups are large, limit is conservative. 

### Union/Intersection/Difference

Similar approach. We have to make sure we use the same hash function to hash the tuples of both arguments. 

### Join

Also similar, but we use just the join attributes (Y) as the key for the hash function. 






