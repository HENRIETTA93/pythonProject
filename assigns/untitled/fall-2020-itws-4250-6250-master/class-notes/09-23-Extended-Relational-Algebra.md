# More Relational Algebra

Start by applying relational algebra to *bags*, not just sets

Bags (multisets) are similar to sets but allow duplicates

Why bags?

Most commercial DBMS implement relations as bags rather than sets.

Some relational operators are considerably more efficient using the bag model (e.g., Union or Projection)

There are also some situations where a correct answer cannot be obtained using sets (e.g., average of a column)

## Operations on Bags

### Set operations

Suppose R and S are relations where tuple t appears n times in R, and m times in S

In bag union, t appears n+m times

In bag intersection, t appears min(n, m) times

In bag difference (R - S), t appears max(0, n-m) times.

### Projection of Bags

Project each tuple. Duplicates are allowed, so nothing else needs to be done

### Selection of Bags

Apply the selection criteria to each tuple independently. Duplicates are allowed, so nothing else needs to be done. (No difference from relations as sets)

### Joins of Bags

R ⨝ S

No surprises. We compare each tuple of R to each tuple of S, and if they join, we add them to the result. Duplicate tuples will each join

``` 
R(a, b)
1   2
1   3
1   3
2   3

S(b, c)
2   5
2   6
3   1

R ⨝ S
(a, b, c)
(1, 2, 5)
(1, 2, 6)
(1, 3, 1)
(1, 3, 1)
(2, 3, 1)

```

## Extended operators of Relational Algebra

Some additional operators, applicable to bags, commonly implemented by SQL

**Duplicate Elimination*  


### Aggregation Operators

Operators that apply to sets/bags of numbers or strings. Used to "aggregate" the values in one column of a relation
- SUM
- AVG
- MIN
- MAX
- COUNT

Count isn't the number of distinct values, it's the number of elements 

### Grouping

We don't always want to aggregate an entire column. We need to consider a relation in groups, and then aggregate within the groups.

Grouping operator g L (R)


L is a list of elements, each of which is either:
- An attribute of R
    - Called a grouping operator
- An aggregation operator, applied to an attribute of R
    - Includes a new name for the result
    - Called an aggregated attribute

To construct g L (R):
1. Partition R into groups, where each group consists of tuples that agree on all of the grouping attributes
2. For each group, produce a single tuple that has:
    - The shared grouping attribute values for the group
    - Aggregrations, over the group, for the aggregated attributes

Note that duplicate elimination is a special case of grouping 

### Extended Projection operator

Previously π L (R), where L was a list of attributes

We extend it so that L can contain:
- Individual attributes of R
- Expressions X -> Y, where X and Y are names for attributes
- Expressions E -> Z, where 
    - E is an expression involving:
        - Attributes of R,
        - Constants
        - Arithmetic operators
        - String operators
    - Z is a name for the result of E

We compute the result by considering each tuple in turn.

Each tuple of R will produce one tuple in the result.

Duplicates in R are considered multiple times

The result can have duplicates even if R does not


### Sorting operator 

We sort over a list of attributes A1, A2, ..., An

Sort by A1, ties are broken by A2, and so on 

### Joins

Outer Joins: it's possible for tuples to be "dangling" (they didn't join with anything)

As dangling tuples aren't included in the result, the join may not have complete information

R Outer Join S starts with R ⨝ S, and adds all tuples that didn't join. Dangling tuples will be padded with NULL. 

```
R(a, b)
1   2
1   3
1   3
2   3
1   4

S(b, c)
2   5
2   6
3   1
5   7

R Outer Join S
a, b, c
(1, 2, 5)
(1, 2, 6)
(1, 3, 1)
(1, 3, 1)
(2, 3, 1)
(1, 4, N)
(N, 5, 7)


```

There are also Left and Right Joins. Similar, but include dangling tuples from only one or the other relation

```
R(a, b)
1   2
1   3
1   3
2   3
1   4

S(b, c)
2   5
2   6
3   1
5   7

R Left Join S
a, b, c
(1, 2, 5)
(1, 2, 6)
(1, 3, 1)
(1, 3, 1)
(2, 3, 1)
(1, 4, N)

R Right Join S
a, b, c
(1, 2, 5)
(1, 2, 6)
(1, 3, 1)
(1, 3, 1)
(2, 3, 1)
(N, 5, 7)

```


All outer joins have a theta join equivalent.

Start with the , add tuples that didn't join