<!DOCTYPE>
<html lang="en">
	
	<head>
		<meta charset="utf-8"/>
		<title>Score</title>
		<link rel="stylesheet" href="bball.css"/>
		<script type="text/javascript" src="jquery.js"></script>
		<script type="text/javascript" src="bball.js"></script>
		<script type="text/javascript">
			$(document).ready(function(){
				$('#games').change(function(){
					$('form').submit();
				});
				sumTotals();
				initButtons();
			});
		</script>
	</head>
	
	<body>
		<form id="stats" name="stats" method="POST" action="bball.php">
			<table id="scorecard" border="1">
				<thead>
					<tr>
						<th colspan="12">
						<?php
							echo '<select id="games" name="games"><option value=""></option>';

							$db = new mysqli("localhost","root","F3$73r_@","bball");

							$query = "call getVarsityGames();";

							$res = $db->query($query);

							while($row = mysqli_fetch_array($res)) {
								echo '<option value="' . $row['id'] . '" ' . (($selVal == $row['id']) ? 'selected' : '') . '>' . $row['away'] . ' @ ' . $row['home'] . '</option>';
							}
							$db->close();
							echo '</select>';
						?>
						</th>
					</tr>
					<tr style="vertical-align:bottom;">
						<th class="player">Player</th>
						<th class="stat-small">#</th>
						<th class="stat-wide">
							<div class="wide-top">2-pt FG</div>
							<div class="wide-left">Att</div>
							<div class="wide-right">Made</div>
						</th>
						<th class="stat-wide">
							<div class="wide-top">3-pt FG</div>
							<div class="wide-left">Att</div>
							<div class="wide-right">Made</div>
						</th>
						<th class="stat-wide">
							<div class="wide-top">FT</div>
							<div class="wide-left">Att</div>
							<div class="wide-right">Made</div>
						</th>
						<th class="stat-wide">
							<div class="wide-top">Rebounds</div>
							<div class="wide-left">Off</div>
							<div class="wide-right">Def</div>
						</th>
						<th class="stat">Player<br/>Assists</th>
						<th class="stat">Blocks</th>
						<th class="stat">Steals</th>
						<th class="stat">Tipped<br/>Passes</th>
						<th class="stat">Charges<br/>Taken</th>
						<th class="stat">TO</th>
					</tr>
				</thead>
				<tbody>
				<?php
					if(isset($_POST['games'])){
						$gameId = $_POST['games'];

						$db2 = new mysqli('localhost','root','F3$73r_@','bball');
						$q = 'call getGameStats(\'' . $gameId . '\')';
						$res2 = $db2->query($q);

						while($g = mysqli_fetch_array($res2)) {

							echo '<tr id="' . $g['id'] . '">';
							echo '<td>' . $g['firstname'] . '</td>';
							echo '<td class="stat-small">' . $g['uniform'] . '</td>';
							echo '<td>
									<input type="text" name="" value="'.$g['fga'].'" class="split fga"/>
									<input type="text" name="" value="'.$g['fgm'].'" class="split fgm"/>
									<br/>
									<input type="button" value="-" class="dec-split" alt="fga"/>
									<input type="button" value="+" class="inc-split addFga"/>
									<input type="button" value="-" class="dec-split" alt="fgm"/>
									<input type="button" value="+" class="inc-split addFgm"/>
								</td>';
							echo '<td>
									<input type="text" name="" value="'.$g['tpa'].'" class="split tpa"/>
									<input type="text" name="" value="'.$g['tpm'].'" class="split tpm"/>
									<br/>
									<input type="button" value="-" class="dec-split" alt="tpa"/>
									<input type="button" value="+" class="inc-split addTpa"/>
									<input type="button" value="-" class="dec-split" alt="tpm"/>
									<input type="button" value="+" class="inc-split addTpm"/>
								</td>';
							echo '<td>
									<input type="text" name="" value="'.$g['fta'].'" class="split fta"/>
									<input type="text" name="" value="'.$g['ftm'].'" class="split ftm"/>
									<br/>
									<input type="button" value="-" class="dec-split" alt="fta"/>
									<input type="button" value="+" class="inc-split addFta"/>
									<input type="button" value="-" class="dec-split" alt="ftm"/>
									<input type="button" value="+" class="inc-split addFtm"/>
								</td>';
							echo '<td>
									<input type="text" name="" value="'.$g['offrebound'].'" class="split offrebound"/>
									<input type="text" name="" value="'.$g['defrebound'].'" class="split defrebound"/>
									<br/>
									<input type="button" value="-" class="dec-split" alt="offrebound"/>
									<input type="button" value="+" class="inc-split addOreb"/>
									<input type="button" value="-" class="dec-split" alt="defrebound"/>
									<input type="button" value="+" class="inc-split addDreb"/>
								</td>';

							echo '<td>
									<input type="text" name="" value="'.$g['assist'].'" class="stat assist"/>
									<br/>
									<input type="button" value="-" class="dec" alt="assist"/>
									<input type="button" value="+" class="inc addAsst"/>
								</td>';

							echo '<td>
									<input type="text" name="" value="'.$g['block'].'" class="stat block"/>
									<br/>
									<input type="button" value="-" class="dec" alt="block"/>
									<input type="button" value="+" class="inc addBlk"/>
								</td>';

							echo '<td>
									<input type="text" name="" value="'.$g['steal'].'" class="stat steal"/>
									<br/>
									<input type="button" value="-" class="dec" alt="steal"/>
									<input type="button" value="+" class="inc addStl"/>
								</td>';

							echo '<td>
									<input type="text" name="" value="'.$g['tips'].'" class="stat tips"/>
									<br/>
									<input type="button" value="-" class="dec" alt="tips"/>
									<input type="button" value="+" class="inc addTip"/>
								</td>';

							echo '<td>
									<input type="text" name="" value="'.$g['drawncharges'].'" class="stat drawncharges"/>
									<br/>
									<input type="button" value="-" class="dec" alt="drawncharges"/>
									<input type="button" value="+" class="inc addChrg"/>
								</td>';

							echo '<td>
									<input type="text" name="" value="'.$g['turnovers'].'" class="stat turnovers"/>
									<br/>
									<input type="button" value="-" class="dec" alt="turnovers"/>
									<input type="button" value="+" class="inc addTo"/>
								</td>';

							echo '</tr>';

						}
							echo '<tr>
								<td>Totals:</td>
								<td></td>
								<td><div id="fgatt" class="att"></div><div id="fgmade" class="made"/></div><div id="fgpct" class="pctge"></div></td>
								<td><div id="tpatt" class="att"></div><div id="tpmade" class="made"/></div><div id="tppct" class="pctge"></div></td>
								<td><div id="ftatt" class="att"></div><div id="ftmade" class="made"/></div><div id="ftpct" class="pctge"></div></td>
								<td><div id="offrebs" class="att"></div><div id="defrebs" class="made"/></div><div id="ttlrebs" class="pctge"></div></td>
								<td><div id="ttlassists" class="center"></div></td>
								<td><div id="ttlblocks" class="center"></div></td>
								<td><div id="ttlsteals" class="center"></div></td>
								<td><div id="ttltips" class="center"></div></td>
								<td><div id="ttlcharges" class="center"></div></td>
								<td><div id="ttltos" class="center"></div></td>
							</tr>';
						$db2->close();
					}
				?>
				</tbody>
			</table>
		</form>
	</body>
	
</html>