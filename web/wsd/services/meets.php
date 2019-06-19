<?php

	header('Content-type: application/json');

	include_once './in.php';

	$response = array();
	$records = array();

	$query;

	$param = $_GET['conf'];

	if( !isset($param) ) {
	
		$query = 'SELECT * FROM wholeEnchillada();';
		
	} else {
		
		$query = 'SELECT * FROM wholeConfEnchillada(\'' . $param . '\');';

	}

	$resultSet = $pdo->query($query);
	
	while($row = $resultSet->fetch(PDO::FETCH_BOTH)) {
		array_push($records, $row);
	}

	$response['success'] = 1;
	$response['records'] = $records;

	echo json_encode($response);

?>