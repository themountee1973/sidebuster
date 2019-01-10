<?php
	
	header('Content-type: application/json');

	$results = array();

	$stat = $_POST['functionname'];
	$param = $_POST['parameter'];

	$db = new mysqli('localhost','root','F3$73r_@','bball');
		
	$query = 'call decrementCount(\'' . $param . '\', \'' . $stat . '\')';
	$res = $db->query($query);

	$returnQuery = 'call getStatsLine(\'' . $param . '\');';

	$returnRes = $db->query($returnQuery);

	$db->close();

	$results['success'] = 1;
	$results['update'] = mysqli_fetch_array($returnRes);

	echo json_encode($results);

?>