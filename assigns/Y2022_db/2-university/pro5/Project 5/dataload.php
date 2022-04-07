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


    $insert_band="insert into band(name, genre, date_of_formation)
    values(:name, :genre,:date_of_formation)";

    $insert_song="insert into song(	name,lyrics,duration,style)
    values(:name, :lyrics,:duration,:style)";

    $insert_concert="insert into concert(date,st_addr,city,state,country,capacity)
    values(:date,:st_addr,:city,:state,:country,:capacity)";

    $insert_setlist="insert into set_list(band_name,conc_ID,song_name)
    values(:band_name,:conc_ID,:song_name)";

    $statement=$connection->prepare($insert_band);

    $alljson=json_decode($alldata,true);
    print($alljson);

    print("<br>");
    echo "-----";
    echo count($alljson);

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
          $statement=$connection->prepare($insert_song);
          $statement->bindParam(':date', $_date,PDO::PARAM_STR);
          $statement->bindParam(':st_addr', $_st_addr,PDO::PARAM_STR);
          $statement->bindParam(':city', $_city,PDO::PARAM_STR);
          $statement->bindParam(':state', $_state,PDO::PARAM_STR);
          $statement->bindParam(':country', $_country,PDO::PARAM_STR);
          $statement->bindParam(':capacity', $_capacity,PDO::PARAM_STR);
          $statement->execute();

    }

     for($i=0;$i<count($concerts); $i++){
        $_band_name=$concerts[$i]["band_name"];
        $_conc_ID=$concerts[$i]["conc_ID"];
        $_song_name=$concerts[$i]["song_name"];

          $statement=$connection->prepare($insert_song);
          $statement->bindParam(':band_name', $_band_name,PDO::PARAM_STR);
          $statement->bindParam(':conc_ID', $_conc_ID,PDO::PARAM_STR);
          $statement->bindParam(':song_name', $_song_name,PDO::PARAM_STR);

          $statement->execute();

    }
}catch(PDOException $error){
    echo  "<br>" . $error->getMessage();
}

?>
</pre>