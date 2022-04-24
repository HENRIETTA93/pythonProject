<!doctype html>
<html>
<head>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
<h1>Insert Musician</h1>
<?php
//create mysql connection
require("connection.php");
$connection=new PDO($dsn, $username, $password, $options);
    echo"<br>";
    echo "create a connection to database success!";
    echo "<br>";

?>

<span style="display: inline-block; width:50%">
  <form class="form-horizontal" action="musicianInsert.php" method="post">
    <div>
      Band:
      <select name="band" class="form-control form-control-sm">
        <!-- First option is a prompt. "selected ensures it will be selected by default"-->
        <option selected>Select band</option>
        <?php //PHP will populate the contents of the select menu
        try{
          $bandListStmt = $connection->prepare("SELECT id, name, genre FROM band;");
          $bandListStmt->execute(); //execute the statement with no arguments (prepare statement has no ? or :param attributes)

          //get all results into an array
          //only gets associative keys
          $bandResults = $bandListStmt->fetchAll(PDO::FETCH_ASSOC);
          foreach($bandResults as $row){
            print("<option value=\"".$row['id']."\">".$row['name']." ".$row['genre']." (id ".$row['id'].")</option>\n");
          }
        } catch(PDOException $error) {
          //if connection failed, close the select tag, print error, and end HTML page gracefully;
          echo "</select>";
          echo "Error: " . $error->getMessage() . "<BR>";
          echo "</div></form></span></body></html>";
        }
      ?>
     </select>
     <br>
     FirstName: <input class="form-control" type="text" name="f_name" pattern="..+" required><br>
     M_Initial: <input class="form-control" type="text" name="m_initial" pattern="." required><br>
     LastName: <input class="form-control" type="text" name="l_name" pattern="..+" required><br>
     Nationality: <input class="form-control" type="text" name="nationality" pattern="..+" required><br>
     Years:<input class="form-control" type="text" name="years_exp" pattern="[0-9]+" required><br>
     <input class="btn btn-primary" type="submit">
   </div>
  </form>
</span>

</body>
</html>