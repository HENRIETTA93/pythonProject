<html>
<body>
<pre>
<?php
// require Faker code
require_once 'composer/vendor/autoload.php';

// use the factory to create a Faker\Generator instance
$faker = Faker\Factory::create();

// Generate 300 bands. Output success or failure result to the screen.
$band_names = $faker->unique()->words(300);
$genres=$faker->words(30);
$dates=array();
for($i=0;$i<50;$i++){
    $dates[$i]=$faker->date();
}
for ($i = 0; $i < 300; $i++){
    $band[$i]["name"]=$band_names[$i];
    $band[$i]["genre"]=$genres[$i%30];
    $band[$i]["date_of_formation"]=$dates[$i%50];
}
print_r($band);

// Generate 2,000 songs. Output success or failure result to the screen.

$song_names = $faker->unique()->words(2000);
$style=$faker->words(100);
for ($i=0; $i<2000; $i++){
    $song[$i]["name"]=$song_names[$i];
    $song[$i]["composer"]=$faker->numberBetween(1, 300);
    $song[$i]["lyrics"]= $faker->realText(50,5);
    $song[$i]["duration"]=$faker->numberBetween(120, 200);
    $song[$i]["style"]=$style[$i%100];
}

// Generate 1,000 concerts. Output success or failure result to the screen.
$addrs=array();
$cities=array();
$states=array();
$countries=array();
for($i=0;$i<10;$i++){
    $countries[$i]=$faker->country();
}

for($i=0;$i<50;$i++){
    $states[$i]=$faker->state();
}
for($i=0;$i<100;$i++){
    $cities[$i]=$faker->city();
}
for($i=0;$i<200;$i++){
    $addrs[$i]=$faker->address();
}
for($i=0;$i<1000;$i++){
    $concert[$i]["date"]=$faker->date();
    $concert[$i]["st_addr"]=$addrs[$i%200];
    $concert[$i]["city"]=$cities[$i%100];
    $concert[$i]["state"]=$states[$i%50];
    $concert[$i]["country"]=$countries[$i%10];
    $concert[$i]["capacity"]=$faker -> numberBetween(100, 300);
}

// Generate 10,000 set_list entries. Output success or failure result to the screen.

for($i=0;$i<10000; $i++){
    $set_list[$i]["band_name"]=$band_names[$i%300];
    $set_list[$i]["conc_ID"]= $faker->numberBetween(1, 1000);
    $set_list[$i]["song_name"]= $song_names[$i%2000];
    $set_list[$i]["composer"]=$faker->numberBetween(1, 1000);
}

echo "===Generate 300 bands. Output success or failure result to the screen.=============================\n";
print_r($band);

echo "\n";
echo "\n";

echo "===Generate 2,000 songs. Output success or failure result to the screen.============================\n";
print_r($song);

echo "\n";
echo "\n";

echo "===Generate 1,000 concerts. Output success or failure result to the screen.=========================\n";
print_r($concert);
echo "\n";
echo "\n";

echo "===Generate 10,000 set_list entries. Output success or failure result to the screen.================\n";
print_r($set_list);

echo "\n";
echo "\n";

// print a new line
echo "\n";

$allData = array(
    "band" => $band,

    "song" => $song,
    "concert" => $concert,
    "set_list" => $set_list
);
// create new json file (it will overrite if it already exists)
$fp = fopen("datas.json","w");

if(!$fp)
    die("Couldn't open file");

//write the json encoded data to the file
fwrite($fp, json_encode($allData));

//close the file
fclose($fp);

print_r($allData);

?>
</pre>
<body>
</html>