xquery version "1.0";
doc("books.xml")
doc("books.xml")/bookstore/book/title
doc("books.xml")/bookstore/book[price<30]
doc("books.xml")/bookstore/book[price>30]/title


for $x in doc("books.xml")/bookstore/book
where $x/price>30
return $x/title
/*
<title lang="en">XQuery Kick Start</title><title lang="en">Learning XML</title>
*/

for $x in doc("books.xml")/bookstore/book
where $x/price>30
order by $x/title
return $x/title

/*
<title lang="en">Learning XML</title><title lang="en">XQuery Kick Start</title>
*/


for $x in doc("books.xml")/bookstore/book
order by $x/@category, $x/title
return $x/title