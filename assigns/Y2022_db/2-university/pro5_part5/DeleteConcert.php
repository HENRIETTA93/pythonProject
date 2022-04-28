<!doctype html>
<html>
<head>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
<h1>Delete Concert</h1>
<?php
//create mysql connection
require("connection.php");
$connection=new PDO($dsn, $username, $password, $options);
    echo"<br>";

    echo "<br>";
?>
<span style="display: inline-block; width:50%">
<form class="form-horizontal" action="concertDelete.php" method="post">
    <div>
      concert ID:<input class="form-control" type="text" name="ID" pattern="[0-9]+" required> <!-- pattern regex to force to be at least two characters. 'required' to require entry. -->

     <input class="btn btn-primary" type="submit">
   </div>
  </form>

<span>

</body>
</html>
