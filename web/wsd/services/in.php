<?php
	
	$db = parse_url(getenv("DATABASE_URL"));

	$pdoDsn = 'host=ec2-54-235-178-189.compute-1.amazonaws.com;dbname=d2tjlsr5ea65g5';

	$pdo = new PDO("pgsql:" . sprintf(
		$pdoDsn, 
		$db["host"], 
		$db["port"], 
		$db["user"], 
		$db["pass"], 
		ltrim($db["path"], "/")
	));

?>