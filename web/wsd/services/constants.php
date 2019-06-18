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
				$query = 'CALL getConstantsByType(\'' . $param . '\');';
				break;
			case 'value':
				$query = 'CALL getConstantFromValue(\'' . $param . '\');';
				break;
			default:
				$query = 'CALL getConstants();';
				break;
		}
		
		if( null != $pdo ) {

			$resultSet = $pdo->query($query);
			
			while($row = $resultSet->fetch(PDO::FETCH_BOTH)) {
				array_push($records, $row);
			}

			$response['success'] = 1;
		}
	}

	echo json_encode($response);
?>