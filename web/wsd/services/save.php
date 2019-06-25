<?php

	include_once 'in.php';

	if(!is_null($_POST)) {

		$recId = $_POST['hiddenID'];
		$day = $_POST['day'];
		$team1 = $_POST['team1'];
		$team2 = $_POST['team2'];

		$max = 83;

		$first = '-1st';
		$second = '-2nd';
		$third = '-3rd';
		$fourth = '-4th';

		$comma = ', ';
		$closeQuery = ') as ID;';

		$queryCreateRecord = 'SELECT createNewMeetRecord(\'' . $day . '\',' . $team1 . ',' . $team2 . ') as ID;';

		print_r($queryCreateRecord);

		if ( is_null($recId) || $recId == 0 || $recId == '' ) {

			$idRes = $pdo->query($queryCreateRecord);

			while( $row = $idRes->fetch(PDO::FETCH_BOTH) ) {
				$recId = $row['ID'];
			}
			
		}

		$queryMedleyRelay = 'SELECT updateMedleyRelay(\'' . $recId . '\',';
		$queryIndividualMedley = 'SELECT updateIndividualMedley(\'' . $recId . '\',';
		$queryShortFreestyle = 'SELECT updateShortFreestyle(\'' . $recId . '\',';
		$queryBackstroke = 'SELECT updateBackstroke(\'' . $recId . '\',';
		$queryLongFreestyle = 'SELECT updateLongFreestyle(\'' . $recId . '\',';
		$queryBreaststroke = 'SELECT updateBreaststroke(\'' . $recId . '\',';
		$queryButterfly = 'SELECT updateButterfly(\'' . $recId . '\',';
		$queryFreestyleRelay = 'SELECT updateFreestyleRelay(\'' . $recId . '\',';


		for($i = 0; $i < $max; $i++) {

			if( ($i >= 0) && ($i <= 10) ) {
				$medleyRelay = ($i+1) . $first;

				$res = $_POST[$medleyRelay];
				
				if( $res == 0 ) {
					$res = '0';
				}

				$qEnd = ( $i < 10 ) ? $comma : $closeQuery;

				$queryMedleyRelay .= $res . $qEnd;

			} elseif ( ($i >= 11) && ($i <= 72) ) {

				$indEvent1 = ($i+1) . $first;
				$indEvent2 = ($i+1) . $second;
				$indEvent3 = ($i+1) . $third;
				$indEvent4 = ($i+1) . $fourth;

				$res1 = $_POST[$indEvent1];
				$res2 = $_POST[$indEvent2];
				$res3 = $_POST[$indEvent3];
				$res4 = $_POST[$indEvent4];

				if ( $res1 == 0 ) { $res1 = '0'; }
				if ( $res2 == 0 ) { $res2 = '0'; }
				if ( $res3 == 0 ) { $res3 = '0'; }
				if ( $res4 == 0 ) { $res4 = '0'; }

				if ( $i >= 11 && $i <= 18 ) {
					$qEnd = ( $i < 18 ) ? $comma : $closeQuery;
					$queryIndividualMedley .= $res1 . $comma . $res2 . $comma . $res3 . $comma . $res4 . $qEnd;
				} elseif ( $i >= 19 && $i <= 30 ) {
					$qEnd = ( $i < 30 ) ? $comma : $closeQuery;
					$queryShortFreestyle .= $res1 . $comma . $res2 . $comma . $res3 . $comma . $res4 . $qEnd;
				} elseif ( $i >= 31 && $i <= 42 ) {
					$qEnd = ( $i < 42 ) ? $comma : $closeQuery;
					$queryBackstroke .= $res1 . $comma . $res2 . $comma . $res3 . $comma . $res4 . $qEnd;
				} elseif ( $i >= 43 && $i <= 52 ) {
					$qEnd = ( $i < 52 ) ? $comma : $closeQuery;
					$queryLongFreestyle .= $res1 . $comma . $res2 . $comma . $res3 . $comma . $res4 . $qEnd;
				} elseif ( $i >= 53 && $i <= 62 ) {
					$qEnd = ( $i < 62 ) ? $comma : $closeQuery;
					$queryBreaststroke .= $res1 . $comma . $res2 . $comma . $res3 . $comma . $res4 . $qEnd;
				} elseif ( $i >= 63 && $i <= 72 ) {
					$qEnd = ( $i < 72 ) ? $comma : $closeQuery;
					$queryButterfly .= $res1 . $comma . $res2 . $comma . $res3 . $comma . $res4 . $qEnd;
				}

			} elseif ( ($i >= 73 ) && ($i < $max) ) {
				$freeRelay = ($i+1) . $first;

				$resF = $_POST[$freeRelay];

				if ( $resF == 0 ) {
					$resF = '0';
				}

				if (($i+1) < $max) {
					$query .= $resF . $comma;
				} else {
					$query .= $resF;
				}

				$qEnd = ( $i < 82 ) ? $comma : $closeQuery;
				$queryFreestyleRelay .= $resF . $qEnd;
			}

		}

		
		//print_r($queryMedleyRelay); echo '<br/>';
		//print_r($queryIndividualMedley); echo '<br/>';
		//print_r($queryShortFreestyle); echo '<br/>';
		//print_r($queryBackstroke); echo '<br/>';
		//print_r($queryLongFreestyle); echo '<br/>';
		//print_r($queryBreaststroke); echo '<br/>';
		//print_r($queryButterfly); echo '<br/>';
		//print_r($queryFreestyleRelay); echo '<br/>';

		try {

			$mrRes = $pdo->query($queryMedleyRelay);
			$mrId = ($mrRes->fetch(PDO::BOTH))['id'];
				//echo 'EXECUTE RESULT:  ' . $mrId . '<br/>';
			$imRes = $pdo->query($queryIndividualMedley);
			$imId = ($imRes->fetch(PDO::BOTH))['id'];
				//echo 'EXECUTE RESULT:  ' . $imId . '<br/>';
			$sfRes = $pdo->query($queryShortFreestyle);
			$sfId = ($sfRes->fetch(PDO::BOTH))['id'];
				//echo 'EXECUTE RESULT:  ' . $sfId . '<br/>';
			$bkRes = $pdo->query($queryBackstroke);
			$bkId = ($bkRes->fetch(PDO::BOTH))['id'];
				//echo 'EXECUTE RESULT:  ' . $bkId . '<br/>';
			$lfRes = $pdo->query($queryLongFreestyle);
			$lfId = ($lfRes->fetch(PDO::BOTH))['id'];
			$brRes =$pdo->query($queryBreaststroke);
			$brId = ($brRes->fetch(PDO::BOTH))['id'];
				//echo 'EXECUTE RESULT:  ' . $brId . '<br/>';
			$bfRes = $pdo->query($queryButterfly);
			$bfId = ($bfRes->fetch(PDO::BOTH))['id'];
				//echo 'EXECUTE RESULT:  ' . $bfId . '<br/>';
			$frRes = $pdo->query($queryFreestyleRelay);
			$frId = ($frRes->fetch(PDO::BOTH))['id'];
				//echo 'EXECUTE RESULT:  ' . $frId . '<br/>';

		} catch (Exception $exeption) {

		}


	}
?>