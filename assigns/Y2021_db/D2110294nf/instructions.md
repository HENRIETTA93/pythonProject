# Data Normalization and Entity-Relationship Diagramming

The following table, representing students' grades in courses at a university, is already in [first normal form](https://knowledge.kitchen/A_Simple_Guide_to_Five_Normal_Forms_in_Relational_Database_Theory#FIRST_NORMAL_FORM) (1NF) - all records have the same number of fields, and there is only one value per field.

| assignment_id | student_id | due_date | professor | assignment_topic                | classroom | grade | relevant_reading    | professor_email   |
| :------------ | :--------- | :------- | :-------- | :------------------------------ | :-------- | :---- | :------------------ | :---------------- |
| 1             | 1          | 23.02.21 | Melvin    | Data normalization              | WWH 101   | 80    | Deumlich Chapter 3  | l.melvin@foo.edu  |
| 2             | 7          | 18.11.21 | Logston   | Single table queries            | 60FA 314  | 25    | Dümmlers Chapter 11 | e.logston@foo.edu |
| 1             | 4          | 23.02.21 | Melvin    | Data normalization              | WWH 101   | 75    | Deumlich Chapter 3  | l.melvin@foo.edu  |
| 5             | 2          | 05.05.21 | Logston   | Python and pandas               | 60FA 314  | 92    | Dümmlers Chapter 14 | e.logston@foo.edu |
| 4             | 2          | 04.07.21 | Nevarez   | Spreadsheet aggregate functions | WWH 201   | 65    | Zehnder Page 87     | i.nevarez@foo.edu |
| ...           | ...        | ...      | ...       | ...                             | ...       | ...   | ...                 | ...               |

## Assumptions

This data represents information about students' grades in courses at a university. The dependencies reflect the reality of how courses work in most universities.

- each course can be taught by multiple professors in different sections
- each professor might teach multiple sections of the same course
- each section meets in a specific classroom with a specific professor
- professors give assignments, with specific due dates
- a professor might give the same assignment to different sections of the same course, but with different due dates
- professors give readings to help with the assignments
- students complete assignments and receive a grade

Further assumptions:

- Assume there are many rows of data following this structure... only 5 sample rows have been showed for brevity. The number of rows is not important to this assignment.
- Assume the `relevant_reading` is relevant to a given assignment.

## Requirements

### Convert to 4NF

Convert this table to the [fourth normal form](https://knowledge.kitchen/A_Simple_Guide_to_Five_Normal_Forms_in_Relational_Database_Theory#Fourth_Normal_Form) (4NF) using the techniques we have learned in this class.

Notes:

- There is no indication of which field is the primary key.
- Use your own judgment as to which fields might be good candidate key(s).
- Feel free to add any additional "surrogate key" fields you believe are necessary to make this data 4NF-compliant.

### Draw an Entity-Relationship Diagram

Draw an Entity-Relationship Diagram(s) of your 4NF-compliant data tables. Use the tool, [draw.io](https://draw.io) (also known as diagrams.net) to create these diagrams. A [sample .drawio file](./images/example-er-diagrams.drawio) has been included in this repository for example.

- export the diagram(s) in SVG format into the directory named `images`.
- publish the diagram(s) to your report, as described below.

### Write a report

Write a wonderfully-formatted Markdown report in the file named `README.md`. Make sure your document renders nicely as a web page, with clear headings, sub-headings, and text. Include a full description of your solution explaining what about the original data set was not 4NF compliant and what changes you made to make it 4NF-compliant. Be specific, and include at a minimum:

- a table containing the original data set (research how to write tables in Markdown or simply see the example table in this document's source code)
- your description of what makes this data set not compliant with 4NF
- tables containing the 4NF-compliant version of the data set
- the ER diagram(s) you created of your 4NF-compliant version of the data set (this diagram must be visible on the `README.md` document, not simply linked from there - research how to publish images to your pages in Markdown or simply see the example image in this document's source code)
- your description of what changes you made and how these changes make the data 4NF-compliant

## Submit your work

Each student must submit this assignment individually. Use Visual Studio Code to perform git `stage`, `commit` and `push` actions to submit. These actions are all available as menu items in Visual Studio Code's Source Control panel.

1. Type a short note about what you have done to the files in the `Message` area, and then type `Command-Enter` (Mac) or `Control-Enter` (Windows) to perform git `stage` and `commit` actions.
1. Click the `...` icon next to the words, "Source Control" and select "Push" to perform the git `push` action. This will upload your work to your repository on GitHub.com.

![Pushing work in Visual Studio Code](./images/vscode_stage_commit_push.png)
