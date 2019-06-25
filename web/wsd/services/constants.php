<?php

	header('Content-type: application/json');

	include_once './in.php';

	$response = array();
	$records = array();

	$query;

	$discriminator = $_GET['type'];
	$param = $_GET['param'];

	if( !is_null($discriminator) ) {
	
		switch($discriminator) {
			case 'type':
				$query = 'SELECT * FROM getConstantsByType(\'' . $param . '\');';
				break;
			case 'value':
				$query = 'SELECT * FROM getConstantFromValue(\'' . $param . '\');';
				break;
			default:
				break;
		}
		
	} else {
		
		$query = 'SELECT * from getConstants();';

	}

//	$resultSet = $pdo->query($query);
	$resultSet = pg_query($pdo, $query);
	
//	while($row = $resultSet->fetch(PDO::FETCH_BOTH)) {
	while($row = pg_fetch_assoc($resultSet) {
		array_push($records, $row);
	}

	$response['success'] = 1;
	$response['records'] = $records;

	echo json_encode($response);
?>