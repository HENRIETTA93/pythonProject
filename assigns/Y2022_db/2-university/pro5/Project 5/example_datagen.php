<pre>
<?php
/*
  This example will generate data for two database tables:
  student and deparment. It will store all data in a single
  json file which will be then read into the database.

*/

// require Faker code
require_once 'composer/vendor/autoload.php';

// use the factory to create a Faker\Generator instance
$faker = Faker\Factory::create();

/* We'll generate 50 random words as department names,
   25 random words as buildings, and
   Budgets ranging from 50,000 to 200,000 in whole tens of thousands */

// generate 25 random words for department buildings
$buildings = $faker->words(25);

for ($i = 0; $i < 50; $i++){
    //generate a random word for a department name
    $department[$i]["dept_name"] = $faker->word();

    //assign each building to two departments
    $department[$i]["building"] = $buildings[$i%25];

    $department[$i]["budget"] = $faker->numberBetween("5","20")."0,000";
} // we now have 50 random departments in the $department array

// declare a student array for clarity
$student = array();

// generate 2,000 students
for ($i = 0; $i < 2000; $i++){
    //generate a sequential ID starting at 1
    //(this might be skipped if we have auto_increment)
    $student[$i]["ID"] = $i+1;

    //assign a random name to each student
    $student[$i]["name"] = $faker->firstName()." ".$faker->lastName();

    //assign a random existing department to each student
    $student[$i]["dept_name"] = $department[rand(0,49)]["dept_name"];


    $student[$i]["tot_cred"] = $faker->numberBetween(0,150);
} // we now have 2000 random students in the $student array

// now, we add everything to the $alldata array
// careful to add data in order to ensure referential
// contraints integrity
$allData = array(
    "department" => $department,

    "student" => $student
);


// create new json file (it will overrite if it already exists)
$fp = fopen("datadump.json","w");

if(!$fp)
    die("Couldn't open file");

//write the json encoded data to the file
fwrite($fp, json_encode($allData));

//close the file
fclose($fp);

print_r($allData);

?>
</pre>