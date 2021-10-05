# Homework 6

In this homework, you will write XPath queries to answer various questions about an XML document. The document is an export of a set of pages from the [Petrucci Music Library](https://imslp.org/), an online repository of sheet music that's in the public domain. It's based on the [MediaWiki](https://www.mediawiki.org/wiki/MediaWiki) framework, so its contents can be exported into XML.

## What's in the application

The directory contains the following files:

- `readme.md`: This document
- `short-data.xml`: an export containing just three pages. This is there to help you understand the structure of the XML. It is not exhaustive.
- `long-data.xml`: an export containing a much larger number of pages. The unit tests will run your queries against this document
- `practice.py`: a simple python script that makes it easy to run a single XPath query against `long-data.xml` (It could also be easily modified to run against `short-data.xml`). That should allow you to try your queries as you work.
- `requirements.txt`: defines the single dependency needed. Run `pip install -r requirements.txt` to install the dependency.
- `homework_6.py`: contains a single class with method stubs where you should put your queries. You need to replace the `"//*"` in each of the eight methods with an appropriate XPath query.
- `query_tool_test.py`: contains the unit tests used to grade your implementation of the `ComposerPageQueryTool` class found in `homework_6.py`.

## Setup

Apart from installing the `lxml` dependency described in `requirements.txt`, no additional setup is needed.

Run `pip install -r requirements.txt` to install. `lxml` does rely on the libxml2 library however, so there's a chance that you'll need to install that as well. Please refer to its [documentation](https://lxml.de/installation.html).

## Running

As with homework 5, this makes use of the python `unittest` module. You can run the tests by running `python -m unittest query_tool_test.py` from the `homework-6` directory. 

## Assignment

There are eight queries that need to be implemented, one for each method. What they should return is specified in the comment string that precedes each method.

## Grading

There are eight methods, each of which have a single unit test. Each passed unit test is worth 5 points.

**Total 40 points**

## Deliverables

You should upload to Submitty a single file: `homework_6.py`. It should contain your fully implemented code.

The due date for this assignment is **11:59pm (23:59) on Friday November 13**.