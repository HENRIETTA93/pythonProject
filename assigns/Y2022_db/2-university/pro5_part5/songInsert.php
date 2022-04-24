
<?php
//create mysql connection
require("connection.php");
$connection=new PDO($dsn, $username, $password, $options);
    echo"<br>";
    echo "create a connection to database success!";
    echo "<br>";
if($_POST['composer']){
  //code to insert song
  echo "You want to insert song's name is". $_POST['name']. ", musician is" . $_POST['composer'] .",    lyrics is". $_POST['lyrics'] . ", duration is".  $_POST['duration'] ."and style is". $_POST['Style'] ;
    $insert_song="insert into song(	name, composer,lyrics,duration,style)
    values(:name, :composer,:lyrics,:duration,:style)";
    try{
          $statement=$connection->prepare($insert_song);
          $statement->bindParam(':name', $_POST['name'],PDO::PARAM_STR);
          $statement->bindParam(':composer', $_POST['composer'],PDO::PARAM_STR);
          $statement->bindParam(':lyrics', $_POST['lyrics'],PDO::PARAM_STR);
          $statement->bindParam(':duration', $_POST['duration'],PDO::PARAM_STR);
          $statement->bindParam(':style', $_POST['Style'],PDO::PARAM_STR);
          $statement->execute();
    }catch(PDOException $error) {
          //if connection failed, close the select tag, print error, and end HTML page gracefully;
          echo "</select>";
          echo "Error: " . $error->getMessage() . "<BR>";
          echo "</div></form></span></body></html>";
    }
    echo "<BR>";
  echo 'Message that song was inserted successfully.<br><br><br>';

   try{

      $countStmt =$connection->prepare("select count(*) from song;");
      $countStmt->execute();

      $result = $countStmt->fetchAll(PDO::FETCH_ASSOC);

    /* iterates through table results
     and assigns the column name to $column
     and the column data to $value */
    foreach ($result as $row) {
     foreach ($row as $colkey => $colval) {
         echo "After insert the song :" . $colkey . ": " . $colval . "<BR>";
       }
       echo "<BR>";

    }
   }catch(PDOException $error) {
          //if connection failed, close the select tag, print error, and end HTML page gracefully;
          echo "</select>";
          echo "Error: " . $error->getMessage() . "<BR>";
          echo "</div></form></span></body></html>";
    }
}
?>