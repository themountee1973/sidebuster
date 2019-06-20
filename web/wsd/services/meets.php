<?php

	header('Content-type: application/json');

	include_once './in.php';

	$response = array();
	$records = array();

	$query;

	$param = $_GET['conf'];
	$all = $_GET['all'];
	$team = $_GET['team'];

	if ( isset($team) ) {

		$query = 'SELECT * FROM getMeetsByTeam(\'' . $team . '\');';

	} else if( !isset($param) ) {
	
		$query = 'SELECT * FROM wholeEnchillada();';
		
	} else if ( !isset($all) ) {

		$query = 'SELECT * FROM wholeConfEnchillada(\'' . $param . '\');';

	} else {
			
		$query = 'SELECT * FROM getMeetsByConference(\'' . $param . '\');';

	}

	$resultSet = $pdo->query($query);
	
	while($row = $resultSet->fetch(PDO::FETCH_BOTH)) {
		array_push($records, $row);
	}

	$response['success'] = 1;
	$response['records'] = $records;

	echo json_encode($response);

?>