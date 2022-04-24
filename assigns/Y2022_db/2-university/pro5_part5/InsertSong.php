<!doctype html>
<html>
<head>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
<h1>Insert Song</h1>
<?php
//create mysql connection
require("connection.php");
$connection=new PDO($dsn, $username, $password, $options);
    echo"<br>";
    echo "create a connection to database success!";
    echo "<br>";
?>

<span style="display: inline-block; width:50%">
  <form class="form-horizontal" action="songInsert.php" method="post">
    <div>
      Song Name:<input class="form-control" type="text" name="name" pattern="..+" required> <!-- pattern regex to force to be at least two characters. 'required' to require entry. -->
      <br>
      Musician:
      <select name="composer" class="form-control form-control-sm">
        <!-- First option is a prompt. "selected ensures it will be selected by default"-->
        <option selected>Select Composer</option>
        <?php //PHP will populate the contents of the select menu
        try{

          $musicianListStmt = $connection->prepare("SELECT id, f_name, l_name FROM musician;");
          $musicianListStmt->execute(); //execute the statement with no arguments (prepare statement has no ? or :param attributes)

          //get all results into an array
          //only gets associative keys
          $musicianResults = $musicianListStmt->fetchAll(PDO::FETCH_ASSOC);
          foreach($musicianResults as $row){
                 print("hello world");
            print("<option value=\"".$row['id']."\">".$row['f_name']." ".$row['l_name']." (id ".$row['id'].")</option>\n");
          }


          $countStmt =$connection->prepare("select count(*) from musician;");
          $countStmt->execute();

              $result = $countStmt->fetchAll(PDO::FETCH_ASSOC);

    /* iterates through table results
     and assigns the column name to $column
     and the column data to $value */
    foreach ($result as $row) {
     foreach ($row as $colkey => $colval) {
         echo "musicitian:" . $colkey . ": " . $colval . "<BR>";
       }
       echo "<BR>";
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
     Lyrics:<textarea class="form-control" name="lyrics" pattern="..+" required></textarea><br>
     Duration:<input class="form-control" type="text" name="duration" pattern="[0-9]+" required><br>
     Style:<input class="form-control" type="text" name="Style" pattern="..+" required><br>
     <input class="btn btn-primary" type="submit">
   </div>
  </form>
</span>
</body>
</html>
