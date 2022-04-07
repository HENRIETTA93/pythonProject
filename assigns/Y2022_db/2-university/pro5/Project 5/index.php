<html>
<body>


<?php
// 生成一个PHP数组
$data = array();
$data[0] = array('1','吴者然','onestopweb.cn');
$data[1] = array('2','何开','iteye.com');
// 把PHP数组转成JSON字符串
$json_string = json_encode($data);
// 写入文件
file_put_contents('test.json', $json_string);
?>
<?php
// 从文件中读取数据到PHP变量
$json_string = file_get_contents('test.json');
// 把JSON字符串转成PHP数组
$data = json_decode($json_string, true);
// 显示出来看看
var_dump($data);
echo '<br><br>';
print_r($data);
echo '<br><br>';
echo '编号：'.$data[0][0].' 姓名：'.$data[0][1].' 网址：'.$data[0][2];
echo '<br>';
echo '编号：'.$data[1][0].' 姓名：'.$data[1][1].' 网址：'.$data[1][2];
?>





<?php
// require Faker code
require_once 'composer/vendor/autoload.php';

// use the factory to create a Faker\Generator instance
$faker = Faker\Factory::create();

// generate a single email and print it
echo $faker->email();

// print a new line
echo "\n";

// generate a lot of data by calling methods
for ($i = 0; $i < 10000; $i++){
    $names[$i] = $faker->name();
}

//recursively print $names vector
print_r($names);
?>

<body>
</html>