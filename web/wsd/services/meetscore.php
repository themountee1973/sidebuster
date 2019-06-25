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
//		$res = $pdo->query($query);

		while( $row = pg_fetch_assoc($res) ) {
//		while( $row = $res->fetch(PDO::FETCH_BOTH) ) {

			array_push($records, $row);
			$response['recordId'] = $row['id'];
		}

		$response['success'] = 1;

		$response['records'] = $records;

//		pg_close($pdo);
//		$pdo->close();

	} else {

		$response['success'] = 0;
	
	}
		
	echo json_encode($response);

?>