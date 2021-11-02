# Exam #1 - Social Network Data Harvesting

An exam covering:

- Plain text data formats (CSV, JSON, XML)
- Data munging in Python
- Spreadsheet data analysis
- SQL programming using SQLite databases
- Data normalization
- Entity-relationship diagrams

## Instructions

There two parts to this exam. Please follow the instructions for each:

1. A companion Google Form must be completed and submitted. The link to this will be supplied separately.
1. The instructions below for work to be done within this repository.

## File and directory structure

This repository contains a specific directory/folder structure and specific rules for naming files. Both must be adhered to.

### Directory structure

The purpose of each directory in this repository:

- `data` - must hold all data files. This includes any plain text data files, any spreadsheet files, and any database files.
- `images` - must hold any images file displayed in the documents you will write. Your documents will display these images by using standard Markdown syntax.
- `instructions` - contains instructions for this exam.
- `tests` - contains system files we will use to monitor your work. Do not touch this directory!

### File names

Rules about file names:

- Do not change the names of any existing files.
- The instructions include specific files to create which must be named exactly as indicated.
- Be accurate with capitalization and file extensions.
- File must be placed in the directories indicated. You are not allowed to move any existing files into different directories.

## The data

You are given a data set in the file named [users.csv](../data/users.csv), which contains information a about social network's users.

You are also given a data set in the file named [affinity_categories.csv](../data/affinity_categories.csv), which contains information about the rates charged by the social network for advertisers interested in showing advertisements to users of various affinities.

An **affinity** is a preference the visitor has shown for content of a particular type. Users express this preference by repeatedly clicking on content of that type, sharing content of that type with friends, and by spending more time viewing content of that type of content than other types. Affinities are measured from 0 to 1, representing no interest and absolute interest, respectively. Each user's behavior has been analyzed by the social network, and they have been assigned into several affinity categories based on their level of interest in each of the measured affinities. Affinity categories are quantized (meaning rounded) to the nearest 0.25.

### users.csv

The data in `users.csv` follows the structure indicated in the first few sample lines below, where the first line holds the field headers. See the full data in the file itself.

```csv
id,handle,first_name,last_name,email,street,city,state,state_animal,real_food_affinity_category_id,luxury_brand_affinity_category_id,tech_gadget_affinity_category_id,travel_affinity_category_id
1,vwykey0,Valerye,Wykey,vwykey0@ezinearticles.com,6 Surrey Avenue,Dallas,Texas,Giant anteater,1,7,9,14
2,lbrundale1,Lucienne,Brundale,lbrundale1@bloomberg.com,993 New Castle Court,Tacoma,Washington,Caracara (unidentified),3,5,10,16
3,dbarthot2,Derrik,Barthot,dbarthot2@go.com,87 Grayhawk Road,Washington,District of Columbia,"Squirrel, grey-footed",4,8,11,16
4,shemphrey3,Sigfrid,Hemphrey,shemphrey3@yale.edu,14639 Elka Pass,Sacramento,California,"Goose, egyptian",1,6,9,14
5,nzoephel4,Norrie,Zoephel,nzoephel4@imgur.com,9315 Marcy Road,Van Nuys,California,"Turtle, eastern box",4,7,9,16
```

A few important fields in this data:

- `id` - a unique integer, e.g. 1, 2, 3, etc.
- `handle` - the user's username/handle
- `first_name` - the user's first name
- `last_name` - the user's last name
- `email` - the user's email address
- `street` - the user's street address
- `city` - the user's city of residence
- `state` - the user's state of residence
- `state_animal` - the official animal of the state (Note: this is mock data, so you may see different animals mentioned as the same state's official animal - ignore these inconsistencies.)
- `real_food_affinity_category_id` - a reference to this user's affinity category for real food. See the `affinity_categories` table for details.
- `luxury_brand_affinity_category_id` - a reference to this user's affinity category for luxury brands. See the `affinity_categories` table for details.
- `tech_gadget_affinity_category_id` - a reference to this user's affinity category for tech gadgets. See the `affinity_categories` table for details.
- `travel_affinity_category_id` - a reference to this user's affinity category for travel. See the `affinity_categories` table for details.

### affinity_categories.csv

The data in `affinity_categories.csv` follows the structure indicated in the first few sample lines below, where the first line holds the field headers. See the full data in the file itself.

```csv
id,type,affinity,cost_per_impression,cost_per_thousand
1,real_food_affinity,0,0.01,9.00
2,real_food_affinity,0.25,0.02,18.00
3,real_food_affinity,0.5,0.03,27.00
4,real_food_affinity,0.75,0.04,36.00
5,luxury_brand_affinity,0,0.01,9.00
6,luxury_brand_affinity,0.25,0.02,18.00
```

A few important fields in this data:

- `id` - a unique id for each affinity category
- `affinity_type` - the type of affinity for which prices are given
- `affinity` - the amount of affinity users in each category have for the type of content the record represents, measured from 0 to 1.
- `cost_per_impression` - the price for showing one advertisement to a user who has been assigned this affinity category.
- `cost_per_thousand` - the price for showing one advertisement to one thousand users who have been assigned this affinity category.

## Data munging

Write a Python program into the file named [solution.py](../solution.py) to open the `users.csv` data file, munge the data according to the instructions below, and save the CSV data to a file named `users_clean.csv` within the `data` directory.

### Munging requirements

In the file named `solution.py`, you will find several function definitions that lack implementations. Complete each of the function definitions according to the comments within the file. At the end, if done correctly, this program will be able to:

1. open the file named [users.csv](../data/users.csv) within the `data` directory.
1. modify the data in the file, such that...
   - any records with any fields set to `NULL` are removed. (Just the string `'NULL'`, not `null` or `nil`.)
   - any records with invalid handles are removed. Invalid handles are non-alphanumeric handles, they contain atleast one character that is not an alphabet or a number (handles with special characters such as `*`, `^`, `&` etc. are not allowed).
   - any records with a `tech_gadget_affinity` more than 10 are removed
   - any `email` address ending with `@dmoz.org` has this domain name replaced with `@dmoz.com` instead.
1. save the modified data to a file named [users_clean.csv](../data/users_clean.csv), also within the `data` directory.
1. output the average and median `tech_gadget_affinity_category_id` value of all the records in the cleaned data.

Rules and regulations:

- You **must** write the code of this Python program according to the instructions written as comments within the program file.
- You **must** use the `csv` module's `DictReader` feature to parse this data.
- You **must** convert the data in this `DictReader` to a regular Python list (in this case the list will contain a Dictionary for every row in the file)
- You **must not** use `pandas` or any other data parsing or analysis module.
- You **must not** modify the original data file - save the changes into the new data file.

## Spreadsheets

In the file named [users.xlsx](../data/users.xlsx) within the `data` directory, you will find the original data (not the cleaned version) has been imported for you into a spreadsheet file. Complete the tasks below within this file in the designated cells.

**Note**: All major spreadsheet applications can import and export in Microsoft Excel's `.xlsx` file format. You are welcome to use any spreadsheet application of your choice. but your work must be saved in the `users.xlsx` file within the `data` directory in Microsoft Excel format with the formulas used to calculate results intact and working.

### Spreadsheet analysis requirements

Perform the following calculations using **singular formulas** within the spreadsheet in the clearly labeled cells given to you **at the top-right of the spreadsheet worksheet**, to the right of all the columns with the raw data in them.

![Spreadsheet organization](../images/spreadsheet_organization.png)

Each formula **must also be entered into the [README.md](../README.md) file** in the designated space.

1. Total number of users of the social network
1. Number of users in each of the states in the Pacific sub-region, which includes Alaska, California, Hawaii, Oregon and Washington. (You are forbidden from hard-coding the names of the states into the formula you use. Rather, the formula should refer to the neighboring cells where the state names are written.)
1. Number of users in each of the given 5 cities of the USA: Nashville, Tennessee; San Diego, California; New York City, New York; Dallas, Texas; and Seattle, Washington. Note that there may be cities in ohter states with the same names. (You are forbidden from hard-coding the cities or states into the formula you use. Rather, the formula should refer to the neighboring cells where that information is written.)
1. The average affinity category ID of all users in New York for each of the content types (e.g. real food, luxury brands, etc.). (You are forbidden from hard-coding the state name or any sum, count, or average values into the formula you use. Rather, these should be dynamically calculated within the formula using functions.)

Be sure to save your work.

## SQL

### Setup

You have been given an empty SQLite database named `data.db` within the `data` directory. Store all your data in that file.

### SQL requirements

Write singular SQL commands that perform the following tasks.

Each SQL command **must also be entered into the [README.md](../README.md) file** in the designated space.

1. Write two SQL commands to create two tables named `users` and `affinity_categories` within the given database file that can accommodate the data in the `users.csv` and `affinity_categories.csv` CSV data files, respectively. Use data types and primary key fields that make sense for the data.
1. Import the data in the `users.csv` and `affinity_categories.csv` CSV files into these two tables. (You may use more than one command to achieve each of these imports, if necessary.)
1. Display the state name and the number of users in that state for each of the states for which we have users.
1. Display the state name, the number of users in that state, and the average `travel_affinity_category_id` for each of the states for which we have users.
1. Display only the handles and last names of all users residing in Pittsburgh, Pennsylvania.
1. Display the email addresses of all users residing in Pittsburgh, Pennsylvania, along with the price the social network would charge an advertiser to show one advertisement to each of them, based on their `travel_affinity` level.
1. Display the amount the social network would charge an advertiser to show two advertisement to three thousand users with a `real_food_affinity` level of `0.75`.
1. Show all the users for whom the `tech_gadget_affinity_category_id` field contains an invalid foreign key.
1. Write an additional SQL query of your choice using SQL with this table; then describe the results
   - e.g. "This query identifies all of the users with the first name Valerye in Idaho who have a strong affinity for both luxury brands and real food."

## Data normalization & entity-relationship diagramming

Answer the following questions, and enter your responses into the `README.md` file in the designated spots.

1. Is the data in `users.csv` in fourth normal form? Answer based only on those fields described in the [discussion of the data](#the-data) above. Ignore any others.
1. Explain why or why not the `users.csv` data meets 4NF.
1. Is the data in `affinity_categories.csv` in fourth normal form? Again, answer based only on those fields described in the discussion of the data above. Ignore the others.
1. Explain why or why not the `affinity_categories.csv` data meets 4NF.
1. Use [draw.io](https://draw.io) to draw an Entity-Relationship Diagram showing a 4NF-compliant form of this data, including primary key field(s), relationship(s), and cardinality. Again, focus on and diagram only the attributes described in the discussion of data above. Ignore the others. Export the diagram as an `.svg` file into the `images` directory.

## Entering respones into the README file

The instructions ask you to enter some responses to specific questions into the [README.md](../README.md) file.

- A placeholder **code block** is given for each question where you must enter your responses, e.g.
  ![Rendered Markdown code block](../images/markdown_code_block_rendered.png)

- In the raw Markdown code, this code block looks something like this:

![Raw Markdown code block](../images/markdown_code_block_raw.png)

- You _must_ enter your response within the code block.
  ![Raw Markdown code block](../images/markdown_code_block_filled.png)

- Do not modify anything outside of the code blocks.
