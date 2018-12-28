<?php
	print('ONE.PHP<br/>');
	$db = parse_url(getenv("DATABASE_URL"));

	$path = ltrim($db["path"],"/");
	print("PATH:  " . $path);
	print("<br/>");
	print("USER:  " . $db["user"]);

	print("<br/>");
	print("HOST:  " . $db["host"]);

	print("<br/>");
	print("PORT:  " . $db["port"]);

?>
