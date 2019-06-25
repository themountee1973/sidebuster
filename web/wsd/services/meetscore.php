<?php

	header('Content-type: application/json');
	include_once 'in.php';

	$response = array();
	$records = array();

	if( isset($_GET) ) {
		
		$team1 = $_GET['team1'];
		$team2 = $_GET['team2'];
		$day = $_GET['day'];

		$query = 'SELECT * FROM getMeetScore(' . $team1 . ',' . $team2 . ',\'' . $day . '\');';

		$res = pg_query($pdo, $query);

		while( $row = pg_fetch_assoc($res) ) {

			array_push($records, $row);

		}

		$response['success'] = 1;

		$response['records'] = $records;

//		pg_close($pdo);

	} else {

		$response['success'] = 0;
	
	}
		
	echo json_encode($response);

?>