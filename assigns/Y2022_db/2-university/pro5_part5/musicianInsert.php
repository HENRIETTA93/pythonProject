<?php
//create mysql connection
require("connection.php");
$connection=new PDO($dsn, $username, $password, $options);
    echo"<br>";
    echo "create a connection to database success!";
    echo "<br>";
if($_POST['band']){
  //code to insert song
  echo "You want to insert musician's name is ". $_POST['band']. ", first name is " . $_POST['f_name'] .", last name is ". $_POST['l_name'] . ", nationality is ".  $_POST['nationality'] ."and years_exp is ". $_POST['years_exp'] ;
  $insert_musician="insert into musician(band, f_name, m_initial, l_name, dob, nationality, years_exp)
  values(:band, :f_name, :m_initial, :l_name, :dob, :nationality, :years_exp)";

    try{
          $statement=$connection->prepare($insert_musician);
          $statement->bindParam(':band', $_POST['name'],PDO::PARAM_INT);
          $statement->bindParam(':f_name', $_POST['f_name'],PDO::PARAM_STR);
          $statement->bindParam(':m_initial', $_POST['m_initial'],PDO::PARAM_STR);
          $statement->bindParam(':l_name', $_POST['l_name'],PDO::PARAM_STR);
          $statement->bindParam(':dob', $_POST['dob'],PDO::PARAM_STR);
          $statement->bindParam(':nationality',$_POST['nationality'],PDO::PARAM_STR);
          $statement->bindParam(':years_exp', $_POST['years_exp'],PDO::PARAM_INT);
          $statement->execute();
    }catch(PDOException $error) {
          //if connection failed, close the select tag, print error, and end HTML page gracefully;
          echo "</select>";
          echo "Error: " . $error->getMessage() . "<BR>";
          echo "</div></form></span></body></html>";
    }
    echo "<BR>";
  echo 'Message that musician was inserted successfully.<br><br><br>';

 try{

      $countStmt =$connection->prepare("select count(*) from musician;");
      $countStmt->execute();

      $result = $countStmt->fetchAll(PDO::FETCH_ASSOC);

    /* iterates through table results
     and assigns the column name to $column
     and the column data to $value */
    foreach ($result as $row) {
     foreach ($row as $colkey => $colval) {
         echo "After insert the musician :" . $colkey . ": " . $colval . "<BR>";
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