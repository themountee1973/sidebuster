<?php
	
	$db = parse_url(getenv("DATABASE_URL"));

	try {
		$pdo = new PDO("pgsql:host=" . $db["host"] . ';dbname=' . ltrim($db["path"], "/"), $db["user"], $db["pass"]);
	} catch (Exception $e) {
		print_r('Exception:  ' . $e);
	}
	
?>