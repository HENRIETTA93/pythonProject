
<?php
//create mysql connection
require("connection.php");
$connection=new PDO($dsn, $username, $password, $options);
    echo"<br>";
    echo "create a connection to database success!";
    echo "<br>";
if($_POST['composer']){
  //code to insert song
  echo "You want to insert setlist's band is". $_POST['band']. ", concert is " . $_POST['conc_ID'] .",    song is ". $_POST['song'] ;
    $insert_setlist="insert into set_list(	band, conc_ID, song)
    values(:band, :conc_ID, :song)";
    try{
          $statement=$connection->prepare($insert_song);
          $statement->bindParam(':band', $_POST['band'],PDO::PARAM_INT);
            $statement->bindParam(':conc_ID', $_POST['conc_ID'],PDO::PARAM_INT);
            $statement->bindParam(':song', $_POST['song'],PDO::PARAM_INT);
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

      $countStmt =$connection->prepare("select count(*) from set_list;");
      $countStmt->execute();

      $result = $countStmt->fetchAll(PDO::FETCH_ASSOC);

    /* iterates through table results
     and assigns the column name to $column
     and the column data to $value */
    foreach ($result as $row) {
     foreach ($row as $colkey => $colval) {
         echo "After insert the setlist :" . $colkey . ": " . $colval . "<BR>";
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