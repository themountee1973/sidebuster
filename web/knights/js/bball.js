//(function($){

		var statElements = ['game', 'player', 'uniform', 'fga', 'fgm', 'fgp',
			'tpa', 'tpm', 'tpp', 'fta', 'ftm', 'ftp', 'offrebound', 'defrebound', 
			'rebttl', 'assist', 'block', 'steal', 'tips', 'drawncharges', 'turnovers'];

		var gameElements = ['id', 'home', 'away', 'day', 'date', 
			'homeq1', 'homeq2', 'homeq3', 'homeq4', 'awayq1', 'awayq2',
			'awayq3','awayq4','homescore','awayscore'];



		function initTable() {
				oTable = $('#statistics').dataTable({
					bJQueryUI: true,
					iDisplayLength: -1,
					aLenghtMenu: [[10,25,50,100,-1],[10,25,50,100,"View All"]],
					//bLengthChange: false,
					//info: false,
					columns		:	[
						{bVisible	:	false},					//	0
						{'sClass':'name'},						//	1
						{'sClass':'center','bSortable':false},					//	2
						{'sClass':'aafga center split'},		//	3
						{'sClass':'aafgm center split'},		//	4
						{
							'render' : function(data, type, row){
								return (row[3] == 0) ? '' : (row[4]/row[3]).toFixed(3);
							}
						},										//	5
						{'sClass':'aatpa center split'},		//	6
						{'sClass':'aatpm center split'},		//	7
						{
							'render' : function(data, type, row){
								return (row[6] == 0) ? '' : (row[7]/row[6]).toFixed(3);
							}
						},										//	8
						{'sClass':'aafta center split'},		//	9
						{'sClass':'aaftm center split'},		//	10
						{
							'render' : function(data, type, row){
								return (row[9] == 0) ? '' : (row[10]/row[9]).toFixed(3);
							}
						},										//	11
						{'sClass':'aaorb center split'},		//	12
						{'sClass':'aadrb center split'},		//	13
						{
							'render' : function(data, type, row){
								return row[13] + row[12];
							}
						},										//	14
						{'sClass':'aaast center'},				//	15
						{'sClass':'aablk center'},				//	16				
						{'sClass':'aastl center'},				//	17
						{'sClass':'aatip center'},				//	18
						{'sClass':'aachg center'},				//	19
						{'sClass':'aatos center'}				//	20
					]
				});
		}
		function initGameSelector() {
			$('#game').change(function(){
				var gameId = $(this).find('option:selected').val();
				
				if(gameId == '') {
					gameId = 'all';
				}

				$.ajax({
					dataType		:	'json',
					type			:	'GET',
					url				:	'json/stats-' + gameId + '.json',
					success			:	function(json){
						var a = [];
						if( ('undefined' !== json) && (json.length >= 1) ) {
							for(var i = 0; i < json.length; i++) {
								var inner = [];
								for(var j = 0; j < statElements.length; j++) {
									inner.push(json[i][statElements[j]]);
								}
								a.push(inner);
							}
						}
						oTable.fnClearTable(true);
						oTable.fnAddData(a, true);
						totals();
					}
				});

				$.ajax({
					dataType		:	'json',
					type			:	'GET',
					url				:	'json/games.json',
					success			:	function(json){
						for(var x = 0; x < json.length; x++) {
							
							if(json[x].id == gameId) {
								updateScore(json[x]);
							}
						}
					}
				});

			});
		}

		function fetchGames() {
			//var selectGame = 'Select game:  ';
			var selectGame = '<table border="1" style="width:355px !important; margin-bottom: 10px;">';
			selectGame += '<tr><td>Select game:  </td><td>';

			$.ajax({
				dataType		:	'json',
				type			:	'GET',
				url				:	'json/games.json',
				success			:	function(json){
									selectGame += '<select name="game" id="game">';
									selectGame += '<option value="season"></option>';
									for(var a = 0; a < json.length; a++) {
										selectGame += '<option value="' + json[a].id + '">' + json[a].away + ' @ ' + json[a].home + '</option>';											
									}
									selectGame += '</select></td></tr></table>';
									$('#game').empty().append(selectGame);
				}
			});

		}

		function totals() {
			var fgaTtl = 0;
			var fgmTtl = 0;
			var tpaTtl = 0;
			var tpmTtl = 0;
			var ftaTtl = 0;
			var ftmTtl = 0;
			var orebTtl = 0;
			var drebTtl = 0;
			var astTtl = 0;
			var blkTtl = 0;
			var stlTtl = 0;
			var pdTtl = 0;
			var ctTtl = 0;
			var toTtl = 0;

			var fgas = $('td.aafga');
			var fgms = $('td.aafgm');
			var tpas = $('td.aatpa');
			var tpms = $('td.aatpm');
			var ftas = $('td.aafta');
			var ftms = $('td.aaftm');
			var orbs = $('td.aaorb');
			var drbs = $('td.aadrb');
			var asts = $('td.aaast');
			var blks = $('td.aablk');
			var stls = $('td.aastl');
			var pds = $('td.aatip');
			var cts = $('td.aachg');
			var tos = $('td.aatos');

			for(var x = 0; x < fgas.length; x++) {
				fgaTtl += parseInt($(fgas[x]).text());
			}
			for(var x = 0; x < fgms.length; x++) {
				fgmTtl += parseInt($(fgms[x]).text());
			}
			for(var x = 0; x < tpas.length; x++) {
				tpaTtl += parseInt($(tpas[x]).text());
			}
			for(var x = 0; x < tpms.length; x++) {
				tpmTtl += parseInt($(tpms[x]).text());
			}
			for(var x = 0; x < ftas.length; x++) {
				ftaTtl += parseInt($(ftas[x]).text());
			}
			for(var x = 0; x < ftms.length; x++) {
				ftmTtl += parseInt($(ftms[x]).text());
			}
			for(var x = 0; x < orbs.length; x++) {
				orebTtl += parseInt($(orbs[x]).text());
			}
			for(var x = 0; x < drbs.length; x++) {
				drebTtl += parseInt($(drbs[x]).text());
			}
			for(var x = 0; x < asts.length; x++) {
				astTtl += parseInt($(asts[x]).text());
			}
			for(var x = 0; x < blks.length; x++) {
				blkTtl += parseInt($(blks[x]).text());
			}
			for(var x = 0; x < stls.length; x++) {
				stlTtl += parseInt($(stls[x]).text());
			}
			for(var x = 0; x < pds.length; x++) {
				pdTtl += parseInt($(pds[x]).text());
			}
			for(var x = 0; x < cts.length; x++) {
				ctTtl += parseInt($(cts[x]).text());
			}
			for(var x = 0; x < tos.length; x++) {
				toTtl += parseInt($(tos[x]).text());
			}
			$('.fgattl').empty().append(fgaTtl);
			$('.fgmttl').empty().append(fgmTtl);
			$('.fgpct').empty().append( ((fgmTtl/fgaTtl).toFixed(3)));

			$('.tpattl').empty().append(tpaTtl);
			$('.tpmttl').empty().append(tpmTtl);
			$('.tppct').empty().append( ((tpmTtl/tpaTtl).toFixed(3)));

			$('.ftattl').empty().append(ftaTtl);
			$('.ftmttl').empty().append(ftmTtl);
			$('.ftpct').empty().append(  ((ftmTtl/ftaTtl).toFixed(3)));	

			$('.orebttl').empty().append(orebTtl);
			$('.drebttl').empty().append(drebTtl);
			$('.rebttl').empty().append(orebTtl + drebTtl);

			$('.asstttl').empty().append(astTtl);
			$('.blkttl').empty().append(blkTtl);
			$('.stlttl').empty().append(stlTtl);
			$('.tipsttl').empty().append(pdTtl);
			$('.chrgttl').empty().append(ctTtl);
			$('.tosttl').empty().append(toTtl);

		}

		function updateScore(json) {
			
				var ht = json.home;
				var vt = json.away;
				var homeScore = json.homescore;
				var awayScore = json.awayscore;
				var v1 = json.awayq1;
				var v2 = json.awayq2;
				var v3 = json.awayq3;
				var v4 = json.awayq4;
				var h1 = json.homeq1;
				var h2 = json.homeq2;
				var h3 = json.homeq3;
				var h4 = json.homeq4;
				var dt = json.day;
				$('#awayTeam').empty().append(vt);
				$('#homeTeam').empty().append(ht);
				$('#awayQ1').empty().append(v1);
				$('#awayQ2').empty().append(v2);
				$('#awayQ3').empty().append(v3);
				$('#awayQ4').empty().append(v4);
				$('#homeQ1').empty().append(h1);
				$('#homeQ2').empty().append(h2);
				$('#homeQ3').empty().append(h3);
				$('#homeQ4').empty().append(h4);
				$('#awayTtl').empty().append(awayScore);
				$('#homeTtl').empty().append(homeScore);
		}

//})(jQuery);