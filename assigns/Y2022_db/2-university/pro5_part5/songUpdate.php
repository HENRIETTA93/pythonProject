
<?php
//create mysql connection
require("connection.php");
$connection=new PDO($dsn, $username, $password, $options);
    echo"<br>";
    echo "create a connection to database success!";
    echo "<br>";
if($_POST['composer']){
  //code to insert song
  echo "You want to update song's id is ". $_POST['ID'] ;

          <?php //PHP will populate the contents of the select menu
        try{

          $musicianListStmt = $connection->prepare("SELECT * from song where ID=:ID");
         $musicianListStmt ->bindParam(':ID', $_POST['ID'],PDO::PARAM_STR);
          $musicianListStmt->execute(); //execute the statement with no arguments (prepare statement has no ? or :param attributes)

          //get all results into an array
          //only gets associative keys
          $musicianResults = $musicianListStmt->fetchAll(PDO::FETCH_ASSOC);
          foreach($musicianResults as $row){

            print("  Song Name:<input class=\"form-control\" type=\"text\" name=\"name\" pattern=\"..+\" required>".$row['name']. "</input>");
          }

        } catch(PDOException $error) {
          //if connection failed, close the select tag, print error, and end HTML page gracefully;
          echo "</select>";
          echo "Error: " . $error->getMessage() . "<BR>";
          echo "</div></form></span></body></html>";
        }
      ?>

    $insert_song="update song set name=:name where ID=:ID";
    try{
          $statement=$connection->prepare($insert_song);
          $statement->bindParam(':name', $_POST['name'],PDO::PARAM_STR);

          $statement->execute();
    }catch(PDOException $error) {
          //if connection failed, close the select tag, print error, and end HTML page gracefully;
          echo "</select>";
          echo "Error: " . $error->getMessage() . "<BR>";
          echo "</div></form></span></body></html>";
    }
    echo "<BR>";
  echo 'Message that song was updated successfully.<br><br><br>';

}
?>