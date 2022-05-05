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
        $sql="select * from concert where 1=1";
        if($_POST['ID']){
        $sql=$sql . " and  ID=:ID";
        }
        $songListStmt=$connection->prepare($sql);
        if($_POST['ID']){
       $songListStmt->bindParam(':ID', $_POST['ID'],PDO::PARAM_STR);
        }

        $songListStmt->execute();

        $songResults = $songListStmt->fetchAll(PDO::FETCH_ASSOC);
                 print("<tr>");
            print("<th>ID</th>");
            print("<th>st_addr</th>");
            print("<th>city</th>");
            print("<th>state</th>");
             print("<th>country</th>");
              print("<th>capacity</th>");
            print("</tr>");
          foreach($songResults as $row){
            print("<tr>");
            print("<th>".$row['ID']."</th>");
            print("<th>".$row['st_addr']."</th>");
            print("<th>".$row['city']."</th>");
            print("<th>".$row['state']."</th>");
             print("<th>".$row['country']."</th>");
               print("<th>".$row['capacity']."</th>");
            print("</tr>");
          }

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