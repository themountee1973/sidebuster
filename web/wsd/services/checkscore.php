<?php

	header('Content-type: application/json');
	include_once 'in.php';

	$response = array();
	$records = array();

	if( isset($_GET) ) {
		
		$team1 = $_GET['team1'];
		$team2 = $_GET['team2'];
		$day = $_GET['day'];
		
		$query = 'SELECT checkScoreExists(' . $team1 . ',' . $team2 . ',\'' . $day . '\') AS ANSWER;';

//		$res = pg_query($pdo, $query);
		$res = $pdo->query($query);

//		$response['answer'] = pg_fetch_assoc($res)['answer'];
		$response['answer'] = $res->fetch(PDO::FETCH_BOTH)['answer'];

		$response['success'] = 1;

		$pdo->close();

	} else {

		$response['success'] = 0;
	
	}
		
	echo json_encode($response);

?>