<!DOCTYPE html>
<head>
    <title>Postgres Results</title>
</head>
<body>
Results
<?php

$conn = pg_connect("host=localhost dbname=example_db user=example_user password=password") or die("Could not connect " . pg_last_error());

$query = "SELECT * FROM course WHERE name ilike '%data%'";
$query1 = "SELECT * FROM course WHERE semester=$1 AND location ilike $2";


$result = pg_query($query) or die("Could not query " . pg_last_error());
$result1 = pg_query_params($conn, $query1, array('F20', '%'));

?>

<table>
    <?php
    while ($line = pg_fetch_array($result1, null, PGSQL_ASSOC)) {
        ?>
        <tr>
            <?php
            foreach ($line as $col_value) {
                echo "\t\t<td>$col_value</td>\n";
            }
            ?>
        </tr>
    <?php } ?>
</table>

<?php

// Free resultset
//pg_free_result($result);
pg_free_result($result1);

// Closing connection
pg_close($conn);

?>

</body>
