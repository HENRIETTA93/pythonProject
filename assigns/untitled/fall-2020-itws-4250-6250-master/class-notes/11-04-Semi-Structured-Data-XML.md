# Semi-Structured Data

So far, we've focused on the Relational Data Model

The "semi-structured data model" is different. 

The schema is implied by the data, rather than being declared separately. 

Semi-structured data generally plays two roles in database systems:
- Useful as a model for the integration of two systems that contain similar data but with different schema. 
- It's the model underlying formats like XML and JSON that are used to share information on the web

## Motivation for semi-structured Data

Previous models (relational, E/R, etc) start with a schema. The schema provides a rigid framework in which data is placed. 

Rigidity has advantages. It allows for query optimization, as the query optimizer knows the structure of the data. It also makes data more reliable. 

Semi-structured is motivated primarily by its flexibility. 

Sometimes referred to as "schemaless." More accurately, the data is self-describing. 

The structure can vary over time, or even within the same database. 

Flexibility is an advantage. Being able to add attributes to just a few elements for example, or creating relationships between a few elements without worrying about the rest. 

## Representation

We can represent semi-structured data as a collection of *nodes*. Nodes are either a *leaf* or *interior*. 

Leaf nodes have associated data.

Interior nodes have one or more arcs/edges out

Arcs are labeled to show how the head relates to the tail. 

One interior node has no incoming arcs. This is the *root*, and it represents the whole database. 

Every node must be reachable from the root. A tree structure is not required. 

# XML eXtensible Markup Language

A tag-based notation, originally designed for "marking" documents (like HTML). 

Unlike HTML, XML's tags are intended to represent the meaning of the data. 

Tags are represented with angle brackets `< >`

There are usually opening and closing tags. The closing tag has `</ >`

We can also have a single tag `<  />`

```xml 
<course-data>
    <courses>
        <course>
            Database Systems
            <students>...</students>
        </course>
    </courses>
</course-data>
```

XML is designed to be used in two different modes:
- Well-formed XML. We can use whatever tags we need or want. The tags must be properly nested.
- Valid XML: uses a Document Type Definition (DTD) that specifies what tags are allowed where. Intermediate between truly semi-structured data and a more strict-schema model. 

### Well-Formed XML

Must begin with a declaration that it's XML

`<?xml version="1.0"?>`

We can optionally specify the encoding `encoding="UTF-8"`

We can optionally indicate `standalone="yes"`

We must also have a single root element that is the entire body of the text

### Attributes

An XML element can have attributes (name-value pairs) within its opening tag. It's an alternative way to represent leaf nodes.

It's also a way to represent relationships that don't fit neatly into a tree structure.

### Namespaces

There are situations where tags may come from multiple different sources and have conflicting names. 

Namespaces allow for resolutions

Apply a namespace to a tag to distinguish it from other tags with the same name. 

We use `xmlns:name="URI"`

Often we have the attribute on the root element, as we can use the namespace where it encloses. We can define the namespace on other elements as well if needed.

## Storing XML

We can store XML in a traditional database. However we need to maintain efficiency

There are two general approaches:
- Store the XML in parsed form and provide a set of tools to query it. Two common tools:
    - Simple API for XML (SAX)
    - Document Object Model (DOM)
- Represent the documents and their elements as relations and use a relational DBMS

Postgres defines an XML datatype and provides functions for querying/validating the data. 






## Defining XML Structure

### Document Type Definitions

A DTD is basically a schema for XML documents. 

We lose the flexibility to use whatever tags we want.

We gain agreement on the structure of the data.

The idea is that a company or community will publish their DTD, establishing a shared view of the semantics of the elements. 

#### Basic Structure

The opening root-tag and its closing tag surround a document that conforms to the rules set forth in the given DTD.

Element declarations give a tag and a set of components, which may or must appear within it. 

Two special cases of components:
- `#PCDATA` Parsed Character data means that the element has text content but no elements nested within it
- `EMPTY` no closing tag

The components of an element are generally other elements. Several operators control how often these elements occur

#### Attributes

We can also specify what attributes an element can have

Example DTD

```dtd
<!DOCTYPE course-data [
    <!ELEMENT courses (course*)>
    <!ELEMENT course (time, location?)>
    <!ELEMENT time (#PCDATA)>
    <!ELEMENT location (#PCDATA)>
    <!ATTLIST course
                name CDATA #REQUIRED
                semester CDATA >
]
```


### Using a DTD

Either include it as a preamble to the document, or refer to it in the opening line:

```xml
<?xml version="1.0" standalone="no"?>
<!DOCTYPE course-data [
    <!ELEMENT courses (course*)>
    <!ELEMENT course (time, location?)>
    <!ELEMENT time (#PCDATA)>
    <!ELEMENT location (#PCDATA)>
    <!ATTLIST course
                name CDATA #REQUIRED
                semester CDATA >
]
<course-data>

</course-data>

```

```xml
<?xml version="1.0" standalone="no"?>
<!DOCTYPE course-data SYSTEM "dtd_file.dtd">
<course-data>

</course-data>

```

### XML Schema

An alternative way to describe the structure of a document

Has some additional capabilities beyond DTD

An XML schema is an XML document

It has a namespace: http://www.w3.org/2001/XMLSchema

#### Elements

`<xs:element name="" type="xs:string"/>`

Plus other information and constraints

Type is either simple or complex. 

Simple: xs:string, xs:integer, xs:boolean

Complex Types have several forms. Most common is the xs:sequence

Others include xs:all (all of the elements are required), and xs:choice (exactly one)

#### Attributes

A complex type can have attributes

`<xs:attribute name="" type="" other info/>` (other info is default value, required, etc.)

#### Restricted Simple Types

We can limit the values that can appear in a simple type






# Programming Languages for XML

3 Basic Languages:
- XPath: simple language for describing sets of paths
- Xquery: an extension of XPath, providing some SQL-like capabilities
- XSLT: Extensible Stylesheet Language for Transformation
    - Allows creation of templates/stylesheets that define how to process an XML document
    - Turing complete
    - Declarative, not procedural 

## XPath

XPath is a data model

In the relational model, everything is a bag of tuples 

In XPath, everything is a sequence of items

An item is either:
1. A value of primitive type (integer, float, boolean, string, etc.)
2. A node. Many types of nodes; we'll focus on three:
    - Documents: files containing XML (local path/URL)
    - Elements: XML elements, including opening and closing tags, and everything in between
    - Attributes: found inside XML tags for elements
    
Items of a sequence do not all need to be of the same type (often are)

### Document Nodes

Every XPath query refers to a document

We sometimes use the expression `doc(location)`, where the location is a filesystem path or URL. 

### XPath Expressions

Expressions typically start at the document root and give a sequence of tags and slashes:

`T1/T2/T3`

`/course-data/courses/course/time`

We process the expression in order from left to right, each step working with the output of the previous step (similar to relational algebra)

To process Ti:
1. start with the sequence of items that was the result of Ti-1
2. Examine each item in order
3. Accept all items whose tag matches Ti

Special case: `/T1` will give the single root element. This is distinct form a single document node. 

**Relative Paths** XPath expressions can be relative to the current node (or a sequence of nodes). Relative expressions don't start with a slash

`courses/course/time`

**Attributes** in XPath expressions are denoted by `@`: `/T1/T2.../Tn/@A`

#### Axes

So far, we've only navigated from a node to its child or attribute. 

XPath provides a number of axes for travel, two of which are child and attribute

`/child::T1/child::T2/.../child::Tn/attribute::A`

Other axes:
- Child (default)
- attribute (@)
- parent (..)
- ancestor 
- descendant
- next-sibling
- previous-sibling
- self
- self-or-descendant (//)

`//course/time`

#### Conditions in XPath Expressions

We can follow a tag with square brackets enclosing a condition (a boolean expression). That limits the XPath to only tags that meet the condition

Operators: =, !=, <, >, <=, >=, OR, AND

Other useful conditions: [i] is the ith child of its parent 

A tag [T] by itself is true only for elements that have one or more sub-elements of type T

`//course[@semester]`

Attribute by itself [@A] is similar

There are also functions like `last()` `position(n)`





## XQuery

XQuery is a functional language that's an extension of XPath

Consists of FLWR statements: For, Let, While, Return 

``` 
let $courses := doc('courses.xml')
for $course in $courses
where $course/@semester = 'S20'
return $course/@name 
```

## XSLT

eXtensible Stylesheet Language for Transformations

Declarative language (turing complete)

``` 
<xsl:template match="XPath Expression">
    Some output
    <xsl:valueOf select="XPath Expressions"/>
</xsl:template>

<xsl:template match="/course-data/courses/course">
    Name: <xsl:valueOf select="@name"/>
</xsl:template>
```