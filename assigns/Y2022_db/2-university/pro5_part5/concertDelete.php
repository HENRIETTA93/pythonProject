<html>
<?php
//create mysql connection
require("connection.php");
$connection=new PDO($dsn, $username, $password, $options);
    echo"<br>";

    echo "<br>";
?>
<body>
<table border="1">
        <?php //PHP will populate the contents of the select menu
        try{

//         $songListStmt = $connection->prepare("SELECT * FROM song where ID=:ID");
//          $songListStmt->bindParam(':ID', $_POST['ID'],PDO::PARAM_STR);
        $sql="delete from concert where ID=:ID";

        $songListStmt=$connection->prepare($sql);
        if($_POST['ID']){
       $songListStmt->bindParam(':ID', $_POST['ID'],PDO::PARAM_STR);
        }

        $songListStmt->execute();

          echo "delete the concert id=". $_POST['ID'];

        }catch(PDOException $error) {
          //if connection failed, close the select tag, print error, and end HTML page gracefully;
          echo "</select>";
          echo "Error: " . $error->getMessage() . "<BR>";
          echo "</div></form></span></body></html>";
        }
      ?>
</table>
</body>
</html>