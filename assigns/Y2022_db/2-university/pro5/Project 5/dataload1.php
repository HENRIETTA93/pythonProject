<pre>
<?php
try {
    require "config.php";
    $connection=new PDO($dsn, $username, $password, $options);
    echo"<br>";
    echo "create a connection to database success!";
    echo "<br>";


    // create new json file (it will overrite if it already exists)
    $fp = fopen("datas.json","r");

    if(!$fp)
        die("Couldn't open file");

    //write the json encoded data to the file
    $alldata=fread($fp,filesize("datas.json"));
//     print_r(json_decode($alldata));

    //close the file
    fclose($fp);

    $delete_band="delete from band";
    $statement=$connection->prepare($delete_band);
    $statement->execute();

    $alter_band="alter table band auto_increment=1";
    $statement=$connection->prepare($alter_band);
    $statement->execute();

    $delete_song="delete from song";
    $statement=$connection->prepare($delete_song);
    $statement->execute();

    $alter_song="alter table song auto_increment=1";
    $statement=$connection->prepare($alter_song);
    $statement->execute();

     $delete_concert="delete from concert";
    $statement=$connection->prepare($delete_concert);
    $statement->execute();

     $alter_concert="alter table concert auto_increment=1";
    $statement=$connection->prepare($alter_concert);
    $statement->execute();

     $delete_setlist="delete from set_list";
    $statement=$connection->prepare($delete_setlist);
    $statement->execute();

     $alter_setlist="alter table set_list auto_increment=1";
    $statement=$connection->prepare($alter_setlist);
    $statement->execute();

    $insert_band="insert into band(name, genre, date_of_formation)
    values(:name, :genre,:date_of_formation)";

    $insert_song="insert into song(	name,lyrics,duration,style)
    values(:name, :lyrics,:duration,:style)";

    $insert_concert="insert into concert(date,st_addr,city,state,country,capacity)
    values(:date,:st_addr,:city,:state,:country,:capacity)";

    $insert_setlist="insert into set_list(band,conc_ID,song)
    values(:band,:conc_ID,:song)";


    echo "-- before load data into tables-- ";
    echo "<BR>";
        $sql="select count(*) from band";
    $statement = $connection->prepare($sql);
    //execute statement
    $statement->execute();

    //get all results into an array
    //only gets associative keys
    $result = $statement->fetchAll(PDO::FETCH_ASSOC);

    /* iterates through table results
     and assigns the column name to $column
     and the column data to $value */
    foreach ($result as $row) {
     foreach ($row as $colkey => $colval) {
         echo "bands:" . $colkey . ": " . $colval . "<BR>";
       }
       echo "<BR>";
    }


        $sql="select count(*) from song";
    $statement = $connection->prepare($sql);
    //execute statement
    $statement->execute();

    //get all results into an array
    //only gets associative keys
    $result = $statement->fetchAll(PDO::FETCH_ASSOC);

    /* iterates through table results
     and assigns the column name to $column
     and the column data to $value */
    foreach ($result as $row) {
     foreach ($row as $colkey => $colval) {
         echo "songs:" . $colkey . ": " . $colval . "<BR>";
       }
       echo "<BR>";
    }

            $sql="select count(*) from concert";
    $statement = $connection->prepare($sql);
    //execute statement
    $statement->execute();

    //get all results into an array
    //only gets associative keys
    $result = $statement->fetchAll(PDO::FETCH_ASSOC);

    /* iterates through table results
     and assigns the column name to $column
     and the column data to $value */
    foreach ($result as $row) {
     foreach ($row as $colkey => $colval) {
         echo "concerts:" . $colkey . ": " . $colval . "<BR>";
       }
       echo "<BR>";
    }


      $sql="select count(*) from set_list";
    $statement = $connection->prepare($sql);
    //execute statement
    $statement->execute();

    //get all results into an array
    //only gets associative keys
    $result = $statement->fetchAll(PDO::FETCH_ASSOC);

    /* iterates through table results
     and assigns the column name to $column
     and the column data to $value */
    foreach ($result as $row) {
     foreach ($row as $colkey => $colval) {
         echo "set_list:" . $colkey . ": " . $colval . "<BR>";
       }
       echo "<BR>";
    }

    $alljson=json_decode($alldata,true);
//     print($alljson);

    print("<br>");
//     echo "-----";
//     echo count($alljson);

    $bands=$alljson["band"];

    $songs=$alljson["song"];

    $concerts=$alljson["concert"];

    $setlists=$alljson["set_list"];

    for($i=0;$i<count($bands); $i++){
//         print_r($bands[$i]);
        $_name=$bands[$i]["name"];
        $_genre=$bands[$i]["genre"];
        $_date_of_formation=$bands[$i]["date_of_formation"];
//         echo $_name . $_genre . $_date_of_formation;

          $statement=$connection->prepare($insert_band);
          $statement->bindParam(':name', $_name,PDO::PARAM_STR);
          $statement->bindParam(':genre', $_genre,PDO::PARAM_STR);
          $statement->bindParam(':date_of_formation', $_date_of_formation,PDO::PARAM_STR);
          $statement->execute();

    }

     for($i=0;$i<count($songs); $i++){
        $_name=$songs[$i]["name"];
        $_lyrics=$songs[$i]["lyrics"];
        $_duration=$songs[$i]["duration"];
        $_style=$songs[$i]["style"];

          $statement=$connection->prepare($insert_song);
          $statement->bindParam(':name', $_name,PDO::PARAM_STR);
          $statement->bindParam(':lyrics', $_lyrics,PDO::PARAM_STR);
          $statement->bindParam(':duration', $_duration,PDO::PARAM_STR);
          $statement->bindParam(':style', $_style,PDO::PARAM_STR);
          $statement->execute();
    }


     for($i=0;$i<count($concerts); $i++){
        $_date=$concerts[$i]["date"];
        $_st_addr=$concerts[$i]["st_addr"];
        $_city=$concerts[$i]["city"];
        $_state=$concerts[$i]["state"];
        $_country=$concerts[$i]["country"];
        $_capacity=$concerts[$i]["capacity"];
          $statement=$connection->prepare($insert_concert);
          $statement->bindParam(':date', $_date,PDO::PARAM_STR);
          $statement->bindParam(':st_addr', $_st_addr,PDO::PARAM_STR);
          $statement->bindParam(':city', $_city,PDO::PARAM_STR);
          $statement->bindParam(':state', $_state,PDO::PARAM_STR);
          $statement->bindParam(':country', $_country,PDO::PARAM_STR);
          $statement->bindParam(':capacity', $_capacity,PDO::PARAM_STR);
          $statement->execute();

    }

     for($i=0;$i<count($setlists); $i++){
        $_band=$setlists[$i]["band"];
        $_conc_ID=$setlists[$i]["conc_ID"];
        $_song=$setlists[$i]["song"];

          $statement=$connection->prepare($insert_setlist);
          $statement->bindParam(':band', $_band,PDO::PARAM_STR);
          $statement->bindParam(':conc_ID', $_conc_ID,PDO::PARAM_STR);
          $statement->bindParam(':song', $_song,PDO::PARAM_STR);

          $statement->execute();

    }

  echo "-- after load data into tables-- ";
   echo "<BR>";
    $sql="select count(*) from band";
    $statement = $connection->prepare($sql);
    //execute statement
    $statement->execute();

    //get all results into an array
    //only gets associative keys
    $result = $statement->fetchAll(PDO::FETCH_ASSOC);

    /* iterates through table results
     and assigns the column name to $column
     and the column data to $value */
    foreach ($result as $row) {
     foreach ($row as $colkey => $colval) {
         echo "bands:" . $colkey . ": " . $colval . "<BR>";
       }
       echo "<BR>";
    }


        $sql="select count(*) from song";
    $statement = $connection->prepare($sql);
    //execute statement
    $statement->execute();

    //get all results into an array
    //only gets associative keys
    $result = $statement->fetchAll(PDO::FETCH_ASSOC);

    /* iterates through table results
     and assigns the column name to $column
     and the column data to $value */
    foreach ($result as $row) {
     foreach ($row as $colkey => $colval) {
         echo "songs:" . $colkey . ": " . $colval . "<BR>";
       }
       echo "<BR>";
    }

            $sql="select count(*) from concert";
    $statement = $connection->prepare($sql);
    //execute statement
    $statement->execute();

    //get all results into an array
    //only gets associative keys
    $result = $statement->fetchAll(PDO::FETCH_ASSOC);

    /* iterates through table results
     and assigns the column name to $column
     and the column data to $value */
    foreach ($result as $row) {
     foreach ($row as $colkey => $colval) {
         echo "concerts:" . $colkey . ": " . $colval . "<BR>";
       }
       echo "<BR>";
    }


      $sql="select count(*) from set_list";
    $statement = $connection->prepare($sql);
    //execute statement
    $statement->execute();

    //get all results into an array
    //only gets associative keys
    $result = $statement->fetchAll(PDO::FETCH_ASSOC);

    /* iterates through table results
     and assigns the column name to $column
     and the column data to $value */
    foreach ($result as $row) {
     foreach ($row as $colkey => $colval) {
         echo "set_list:" . $colkey . ": " . $colval . "<BR>";
       }
       echo "<BR>";
    }
}catch(PDOException $error){
    echo  "<br>" . $error->getMessage();
}

?>
</pre>