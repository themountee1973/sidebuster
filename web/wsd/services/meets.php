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

	} else if( isset($param) ) {
	
		$query = 'SELECT * FROM getMeetsByConference(\'' . $param . '\');';
		
	} else if ( isset($all) && isset($param) ) {

		$query = 'SELECT * FROM wholeConfEnchillada(\'' . $param . '\');';

	} else {
			
		$query = 'SELECT * FROM wholeEnchillada();';

	}

//	$resultSet = $pdo->query($query);
	$resultSet = pg_query($pdo, $query);
	
//	while($row = $resultSet->fetch(PDO::FETCH_BOTH)) {
	while( $row = pg_fetch_assoc($resultSet) ) {
		array_push($records, $row);
	}

	$response['success'] = 1;
	$response['records'] = $records;

	echo json_encode($response);

?>