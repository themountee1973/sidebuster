<?php
	
	header('Content-type: application/json');

	$results = array();

	$fn = $_POST['functionname'];
	$param = $_POST['parameter'];
	$q = '';

	switch($fn) {

		case 'board':
			$q = 'defBoard';	
			break;
		case 'passDefended':
			$q = 'defended';
			break;
		case 'assist':
			$q = 'dime';
			break;
		case 'charge':
			$q = 'drawCharge';
			break;
		case 'freethrowmake':
			$q = 'madeFreeThrow';
			break;
		case 'fieldgoalmake':
			$q = 'madeShot';
			break;
		case 'threepointmake':
			$q = 'madeTre';
			break;
		case 'freethrowmiss':
			$q = 'missedFreeThrow';
			break;
		case 'fieldgoalmiss':
			$q = 'missedShot';
			break;
		case 'threepointmiss':
			$q = 'missedTre';
			break;
		case 'turnover':
			$q = 'noNo';
			break;
		case 'offensiveboard':
			$q = 'offBoard';
			break;
		case 'steal':
			$q = 'pick';
			break;
		case 'block':
			$q = 'swat';
			break;
		default:
			break;
	}
	$db = new mysqli('localhost','root','F3$73r_@','bball');
		
	$query = 'call ' . $q . '(\'' . $param . '\')';
	$res = $db->query($query);

	$returnQuery = 'call getStatsLine(\'' . $param . '\');';

	$returnRes = $db->query($returnQuery);

	$db->close();

	$results['success'] = 1;
	$results['update'] = mysqli_fetch_array($returnRes);

	echo json_encode($results);

?>