<html>
	<head>
	</head>
	<body>
	<form action="welcome.php" method="get">
		Name:<input type="text" name="fname">
		Age:<input type="text" name="age">
		<input type="submit">
	</form>
	</body>
</html>


<html>
<body>
Welcome <?php echo $_GET("fname"); ?>.<br/>
You are <?php echo $_GET["age"]; ?>.<br/>
</body>
</html>