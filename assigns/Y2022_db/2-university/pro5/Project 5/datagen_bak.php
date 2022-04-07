<html>
<body>
<pre>
<?php
// require Faker code
require_once 'composer/vendor/autoload.php';

// use the factory to create a Faker\Generator instance
$faker = Faker\Factory::create();


// Generate 300 bands. Output success or failure result to the screen.
$bands=array();
for ($i = 0; $i < 300; $i++){
    $bands[$i] =array($faker->name(), $faker->ean8(),$faker->date());
}


// Generate 2,000 songs. Output success or failure result to the screen.
$songs=array();
for ($i=0; $i<2000; $i++){
    $songs[$i]=array($faker->name(),
    $faker->numberBetween(1, 300),
    $faker->realText(50,5),
    $faker->numberBetween(120, 200),
    $faker->ean8());
}
// Generate 1,000 concerts. Output success or failure result to the screen.
$concerts=array();
for($i=0;$i<1000; $i++){
    $concerts[$i]= array(
    $faker-> date(),
    $faker ->address(),
    $faker ->city(),
    $faker ->city(),
    $faker ->country(),
    $faker -> numberBetween(100, 300)
    );
}
// Generate 10,000 set_list entries. Output success or failure result to the screen.
$set_list=array();
for($i=0;$i<10000; $i++){
    $set_list[$i]=array(
    $faker->name(),
    $faker->numberBetween(1, 1000),
    $faker->name(),
    $faker->numberBetween(1, 300)
    );
}

echo "===Generate 300 bands. Output success or failure result to the screen.=============================\n";
print_r($bands);

echo "\n";
echo "\n";

echo "===Generate 2,000 songs. Output success or failure result to the screen.============================\n";
print_r($songs);

echo "\n";
echo "\n";

echo "===Generate 1,000 concerts. Output success or failure result to the screen.=========================\n";
print_r($concerts);
echo "\n";
echo "\n";

echo "===Generate 10,000 set_list entries. Output success or failure result to the screen.================\n";
print_r($set_list);

echo "\n";
echo "\n";

// print a new line
echo "\n";


// generate the JSON format
$json_bands = json_encode($bands);
// output bands
file_put_contents('bands.json', $json_bands);

// generate the JSON format
$json_songs = json_encode($songs);
// output
file_put_contents('songs.json', $json_songs);

// generate the JSON format
$json_concerts = json_encode($concerts);
// output
file_put_contents('concerts.json', $json_concerts);

// generate the JSON format
$json_set_list = json_encode($set_list);
// output
file_put_contents('set_list.json', $json_set_list);

?>
</pre>
<body>
</html>