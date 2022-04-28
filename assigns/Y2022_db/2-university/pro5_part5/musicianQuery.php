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

        $musician="select * from musician where 1=1  ";
       if($_POST['band']){
         $musician=$musician . " and band=:band";
       }
       if($_POST['l_name']){
        $musician=$musician . " and l_name=:l_name";
       }
//
//        if($_POST['f_name']){
//         $musicianStmt=$musicianStmt . " and f_name=:f_name";
//        }

        $musicianStmt=$connection->prepare($musician);
       if($_POST['band']){
         $musicianStmt->bindParam(':band', $_POST['band'],PDO::PARAM_INT);
       }
       if($_POST['l_name']){
        $musicianStmt->bindParam(':l_name', $_POST['l_name'],PDO::PARAM_STR);
       }
//
//        if($_POST['f_name']){
//         $musicianStmt->bindParam(':f_name', $_POST['f_name'],PDO::PARAM_STR);
//        }



//          $musicianStmt->bindParam(':f_name', $_POST['f_name'],PDO::PARAM_STR);
         $musicianStmt->execute();

        $musicianResults =  $musicianStmt->fetchAll(PDO::FETCH_ASSOC);
                 print("<tr>");
            print("<th>ID</th>");
            print("<th>band</th>");
            print("<th>f_name</th>");
             print("<th>m_initial</th>");
              print("<th>l_name</th>");
               print("<th>nationality</th>");
               print("<th>years_exp</th>");
            print("</tr>");
          foreach($musicianResults as $row){
            print("<tr>");
            print("<th>".$row['ID']."</th>");
            print("<th>".$row['band']."</th>");
            print("<th>".$row['f_name']."</th>");
             print("<th>".$row['m_initial']."</th>");
              print("<th>".$row['l_name']."</th>");
               print("<th>".$row['nationality']."</th>");
               print("<th>".$row['years_exp']."</th>");
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