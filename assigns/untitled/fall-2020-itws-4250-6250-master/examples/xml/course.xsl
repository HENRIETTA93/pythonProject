<?xml version="1.0" encoding="UTF-8" ?>
<stylesheet xmlns="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <output method="text"/>
    <template match="/">
        # Courses

        There are <value-of select="count(/course-data/courses/course)"/> courses:
        <apply-templates select="/course-data/courses/course"/>
    </template>
    <template match="/course-data/courses/course">
        - <value-of select="@semester"/><text>&#x9;</text><value-of select="@name"/>
    </template>

</stylesheet>