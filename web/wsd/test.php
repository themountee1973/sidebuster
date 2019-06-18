<?php

	$phpDO = new PDO('pgsql:host=ec2-54-235-178-189.compute-1.amazonaws.com;dbname=d2tjlsr5ea65g5','mtqrkzgnzjhfxr','f4adc99bc1db2b58a27003eee48a59c4bce55a2668bccb50cd7402b5db17eee4');
	
	if($phpDO != null) {
		$result = $phpDO->query('SELECT * FROM getMeetsByConference(\'CONF_GOLDRUSH\')');
		
		while($row = $result->fetch(PDO::FETCH_BOTH)) {
			print($row ['visitor'] . ' (' . $row['vscore'] . ') @ ' . $row['home'] . '(' . $row['hscore'] . ')  ' . $row['day'] . '<br/>');
		}
		
		
	}else {
		print('FAIL!');
	}

?>