<?php

	header('Content-type: application/json');

	include_once './in.php';

	$response = array();
	$records = array();

	$query;

	$param = $_GET['conf'];

	if( !isset($param) ) {
	
		$query = 'SELECT * FROM getTeams();';
		
	} else {
		
		$query = 'SELECT * FROM getTeamsByConference(\'' . $param . '\');';

	}

//	$resultSet = $pdo->query($query);
	$resultSet = pg_query($pdo, $query);
	
//	while($row = $resultSet->fetch(PDO::FETCH_BOTH)) {
	while($row = pg_fetch_assoc($resultSet)) {
		array_push($records, $row);
	}

	$response['success'] = 1;
	$response['records'] = $records;

	echo json_encode($response);
?>