# Relational Algebra

Relational Algebra is a special algebra that defines operators that construct new relations from existing relations

Not used directly by commercial DBMS (SQL is used instead)

SQL is built around relational algebra and provides some "syntactic sugar" on top of it. 

Why relational algebra? It's useful because it's less powerful than C or Java. The limits allow for ease of use and better optimization.

## What is an Algebra?

An algebra in general, consists of operators and atomic operands (generally use parentheses for grouping)

Relational Algebra's atomic operands are:
- Variables that stand for relations (like R and S)
- Constants that are finite relations 

Operators fall into 4 broad categories:
- Set Operations (Union, Intersection, and Difference), applied to relations
- Operators that remove part of a relation
    - Selection removes some tuples
    - Projection removes some columns
- Operators that combine tuples of two relations
    - Cartesian Product (all possible pairs)
    - Various Joins (selectively pair tuples)
- Renaming

We'll refer to expressions of relational algebra as *queries*.

## Set Operations:

Union, Intersection, Difference

R ∪ S

Some restrictions that apply when applied to relations:
- R and S must have identical schemas: both names and types of all attributes must match
- Before we do the computation, we re-order the columns so that the attributes are in the same order


``` 
R(a, b)
(1, 2)
(2, 2)
(2, 3)

S(a, b)
(1, 2)
(3, 3)
(2, 3)

R ∪ S
(a, b)
(1, 2)
(2, 2)
(2, 3)
(3, 3)

R ∩ S
(1, 2)
(2, 3)


R − S
(2, 2)


```

## Removal Operators

*Projection* produces from R a new relation that has only some of the columns of R

𝜋 a (R)

*Selection* produces from R a new relation that has only some of the tuples of R

𝜎 c (R)

``` 
R(a, b)
(1, 2)
(2, 2)
(2, 3)

𝜋 a (R)
(1)
(2)

𝜎 a=2 (R)
(2, 2)
(2, 3)

```

## Combinations:

*Cartesian Product* (Cross-Product or just Product)

R ⨯ S is the set of pairs rs that can be formed by choosing r to be any element of R and s to be any element of S

When applied to relations, we end up with a set of longer tuples whose schema is the schema for R plus the schema for S

By convention, the first relation's attributes are first.

If there are duplicate names, we disambiguate by pre-pending the relation name: R.a

```
R(a, b)
(1, 2)
(2, 2)

S(b, d)
(1, 2)
(3, 3)
(2, 3)

R ⨯ S
(a,R.b,S.b,d)
(1, 2, 1, 2)
(2, 2, 1, 2)
(1, 2, 3, 3)
(2, 2, 3, 3)
(1, 2, 2, 3)
(2, 2, 2, 3)


```

*Joins* allow us to pair only those tuples that match in some way

*Natural Join* is the simplest.

R ⨝ S

We pair only those tuples that agree on all values of whatever attributes R and S have in common

We end up with a relation whose schema is the union of the schemas of R and S

It's possible for any given tuple to pair with more than one tuple of the other relation

A tuple that pairs is called a *joined* tuple

A tuple that does not pair is called a *dangling* tuple

``` 
R(a, b)
(1, 2)
(2, 3)

S(b, d)
(1, 2)
(3, 3)
(2, 3)

R ⨝ S
(a, b, d)
(1, 2, 3)
(2, 3, 3)
```

*Theta Joins* pair tuples using a specific join condition

Theta join produces a schema like that produced by the Cartesian product: the overlapping attributes are disambiguated, not merged

``` 
R(a, b)
(1, 2)
(2, 3)

S(b, d)
(1, 2)
(3, 3)
(2, 3)

R ⨝ (d=3) S
(a,R.b,S.b,d)
(1, 2, 3, 3)
(2, 2, 3, 3)
(1, 2, 2, 3)
(2, 2, 2, 3)

```

## Renaming

Specifies a new schema for R

𝜌 a (R)

## Combining Operations to form Queries

Like other algebras, we can form expressions of arbitrary complexity by applying additional operators to the results of previous operations. 

Example: Find an expression of relational algebra that produces a relation representing all of the classes in Fall 2020 that take place in classrooms with space for 15 or more students

Assumptions:

Course(course_name, semester, time, location, capacity)
Student(student_name, email, major)
Enroll(email, course_name, semester)
Classroom(location, seats, av_capable)

``` 
(course.location, classroom.location, course. course_name, enroll.course_name, student.email, enroll.email)

select course where capacity > 15 && semester == fall
```

There might be multiple ways of achieving the same result. The query optimizer has to find the optimal one. 

There can be equivalences between operators. 

## Constraints on Relations

Two ways to express constraints in relational algebra.

1. If R is an expression, then R = ∅ is a constraint that says that the value of R must be empty, or there are no tuples in R.
2. If R and S are expressions, then R ⊆ S is a constraint that says every tuple in R must also be in S. 

Ultimately both express the same concept:

R ⊆ S is the same as R − S = ∅
R = ∅ is the same as R ⊆ ∅

### Referential Integrity Constaints

A referential integrity constraint asserts that a value appearing in one context must also appear in another related context. 

In general, we can express this as 

```
𝜋 x R subset of 𝜋 x S

or 𝜋 x S - 𝜋 x R = empty set
```

Note that this is often called a "Foreign Key Constraint."

We can use more than one attribute in our constraints. 

### Key Constraints

Key constraints can also be expressed this way. 

(name, semester) is the key for the Course relation

Therefore, if two tuples agree on both name and semester, they also agree on location. 

### Additional Constraints

We can use this approach to express other constraints as well

Example: no course may be held in a classroom with insufficient space for the capacity of the course

# Design Theory for Relational Databases

There are lots of approaches to designing a schema for a relational database in an application. 

It's common for the initial attempt to have room for improvement, especially by eliminating redundancy. Problems are often caused by trying to fit too much into one relation. 

There's a well-developed theory for relational databases, "dependencies" their implications for what makes a good relational database schema, and what can be done about potential flaws. 

## Functional Dependencies

We start by looking at the constraints that apply to a relation. The most common is the "functional dependency," which generalizes the idea of a key for a relation. 

A Functional Dependency is a statement of the form that:
- If two tuples of R agree on some set attributes a1, a2, ..., an, then they must also agree on some other set of attributes b1, b2, ..., bm

We write this as a1, a2, ..., an -> b1, b2, ..., bm

We say that the As *functionally determine* the Bs.

The As and Bs may appear anywhere in the schema: there's no requirement that the As appear first. 

If we can be sure that every instance of R will be one where the FD is true, then we say that R *satisfies* the FD.

Remember that we are asserting a constraint on R, not just making a descriptive observation. 

It's common, though not a requirement, for the right hand side of a FD to be a single attribute

a1, a2, ..., an -> b1

a1, a2, ..., an -> b2

a1, a2, ..., an -> bm

Example:

Course(name, semester, location, time, capacity, student_name, major, professor, textbook)

What are some Functional Dependencies?
- student_name -> major
- location -> capacity
- name, semester -> professor
- name -> textbook
- name, semester, location, time -> professor, textbook
- name, semester, student_name -> location, time, capacity, major, professor, textbook

## Keys of Relations

We say that a set of attributes X is a *key* for a relation R if:
1. The set of attributes functionally determine all other attributes 
2. No proper subset functionally determines all other attributes (the key must be minimal)

Example: Keys for the above Course relation:
- name, semester, student_name
- location, time, semester, student
- others?

A relation may have more than one key. It's common to designate one "primary key," but it has no meaning in relational theory. 

A set of attributes that contains a key is called a *superkey*. 

Every key is a superkey, but not every superkey is a key (it might not minimal).

Other texts may refer to a key as a *candidate key* and a superkey as just *key*

## Rules about Functional Dependencies

We can reason about FDs.

Assume R(a, b, c) and a -> b, and b -> c.

Does R satisfy a -> c ?

We need to show that two tuples that agree in a also agree in c

Assume the existence of two tuples (a1, b1, c1) and (a1, b2, c2)

Since they agree on a, they also agree on b, therefore b1 = b2

(a1, b1, c1) and (a1, b1, c2)

Since we now know that they agree on b, they must also agree on c, therefore c1 = c2

Therefore R satisfies a -> c.

FDs can be presented in a variety of different ways without changing the set of legal instances of the relation

- Two sets of FDs S and T are *equivalent* if the set of relation instances satisfying S is exactly the same as the set satisfying T
- A set of FDs S *follows* from a set T if every instance that satisfies T also satisfies S
- Two sets of FDs S and T are equivalent if S follows from T and T follows from S

### Splitting/Combining Rule

a1, a2, ..., an -> b1, b2, ..., bm

is the same as

a1, a2, ..., an -> b1

a1, a2, ..., an -> b2

a1, a2, ..., an -> ...

a1, a2, ..., an -> bm

We can split the attributes of the right hand side.

We can do the reverse as well, combining FDs that have the same left side. 

a1, a2, ..., an -> b1

a1, a2, ..., an -> b2

can be combined:

a1, a2, ..., an -> b1, b2

No splitting left side

### Trivial FDs

A constraint of any kind is said to be *trivial* if it holds true for every instance the relation, regardless of what other constraints are assumed.

It's easy to determine for FDs:

a1, a2, ..., an -> b1, b2, ..., bm is trivial when
{b1, b2, ..., bm} ⊆ {a1, a2, ..., an}

A trivial FD has a right side that is is a subset of its left side

ab -> a

#### Trivial Dependency Rule

The FD a1, a2, ..., an -> b1, b2, ..., bm is equivalent of

a1, a2, ..., an -> c1, c2, ..., ck where the c's are all those b's that are not also a's.

Example:

abcdef -> bcghi is equivalent to abcdef -> ghi

### Computing the closure of attributes

Suppose {a1, a2, ..., an} is a set of attributes and S is a set of FDs.

The *closure* of {a1, a2, ..., an} under S is the set of attributes B such that every relation that satisfies all the FDs in S also satisifies {a1, a2, ..., an} -> B

We compute the closure by starting with the set of attributes and "pushing out" by adding the right hand side of FDs in S as soon as we've added their left hand side.

We denote this as {a1, a2, ..., an}+

**Algorithm**: Closure of a set of attributes

Input: a set of attributes A and FDs S

Output the closure of A+

1. If necessary, split the FDs in S so that each has a single attribute on its right hand side
2. Let X be the set of attributes that will eventually become the closure.
    - Initialize X to be A 
3. Repeatedly search for some FD B -> C, such that B ⊆ X, but C is not. 
    - Add C to X, and repeat
    - When nothing more can be added to X, stop

Example: 

R(abcde), ab->c, bc->ad (bc -> a, bc->d), d->e

Compute {ab}+

X = {abcde}

Example 2:

R(abcdefg), cd->e, c->f, g->abc (g->a, g->b, g->c), b->c

Compute {fg}+

X = {fgabc}

By computing the closure of a set of attributes, we can determine whether any given FD A->B follows from S

Compute A+. If B is in A+, then A->B follows from S.

R(abcdefg), S = { cd->e, c->f, g->abc (g->a, g->b, g->c), b->c }

Does fg->d follow from S? No (d is not in the closure of {fg}), but

fg->c ? Yes (c is in the closure of {fg})

#### Closures and Keys

If A+ contains all of the attributes for a relation, then A is a superkey for that relation

We can test if A is a key by first checking that A+ contains all attributes of the relation, and then checking that no subset of A has a closure that contains all attributes of a relation.

### Closing sets of Functional Dependencies

For a given set of FDs S, any set of FDs that's equivalent to S is called a *basis*.

A *minimal basis* for a relation is a basis B that satisfies three conditions:
1. All the FDs in B have a singleton right side
2. If any FD is removed from B, the result is not longer a basis
3. If for any FD in B we remove one or more elements from its left side, the result is no longer a basis

*No trivial FD can be part of a minimal basis, as it would be removed by (2)*

*Armstrong's Axioms* are used to derive any FD that follows from a given set of FDs

- Reflexivity: if B ⊆ A, then A -> B (trivial dependencies)
- Augmentation: if A -> B, then AC -> BC, for any set of attributes C. 
    - Since some C's may be A's or B's, we should remove duplicates
- Transitivity: If A->B, and B->C, then A->C

We can compute the closure of a set of functional dependencies by repeated applications of Armstrong's Axioms'

## Projecting Functional Dependencies

We also need to be able to answer the following:
- Given a relation R with FDs S, if we project R: R1 = π L (R) for some list of attributes L, What functional dependencies hold in R1?

We compute the Projection of Functional Dependencies, which is the set of FDs:
- follow from S
- contain only attributes of R1

We can simply S first by removing redundancies. But in general the complexity of the process is exponential based on the number of attributes in R1. 

**Algorithm: Projecting Functional Dependencies**

Input: 
- Relations R and R1 = π L (R)
- Set of FDs S that hold in R

Output:
- Set of FDs that hold in R1

1. Let T = {}, the eventual output
2. For each set of attributes X that is a subset of the attributes of R1, compute X+ with respect to S
    - Add to T all nontrivial FDs X -> A, such that A is in both X+ and R1
3. Now T is a basis for the FDs in R1, but it may not be minimal
    - If there is a FD F in T that follows from the other FDs in T, remove F from T
    - Let Y -> B be a FD in T with at least two attributes in Y, let Z -> B be Y -> B with one attribute removed
        - If Z->B follows from the FDs in T, remove Y->B and replace it with Z->B
    - Repeat until no further changes can be made

Example:

R(a, b, c, d), a->b, b->c, c->d

R1 = π acd (R)

T = {a->c, c->d}

{} (ignore)
a+ = abcd
c+ = cd
d+ = d
ac (ignore)
ad (ignore)
cd+ = cd
acd (ignore)

a->d gets removed because it follows from the other two
