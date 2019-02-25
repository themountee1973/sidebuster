var statElements = ['game', 'player', 'uniform', 'tp', 'ppg', 'fga', 'fgm', 'fgp',
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
				{bVisible	:	false},									//	0
				{'sClass':'name'},										//	1
				{'sClass':'center','bSortable':false},					//	2
				{
					'sClass' : 'center plyrpts',
					'render' : function(data, type, row) {
						return (row[6]*2) + (row[9]*3) + row[12];
					}
				},														//	3								
				{
					'sClass' : 'center plyrppg',
					'render' : function(data, type, row) {
						if($('#game').find('option:selected').val() == 'season') {
							return (((row[6]*2) + (row[9]*3) + row[12])/6).toFixed(1);
						}else{
							return '';	
						}
					}
				},														//	4
				{
					'sClass':'aafga center split',
					'render' : function(data, type, row) {
						return row[4] + row[8];
					}
				},														//	5
				{
					'sClass':'aafgm center split',
					'render' : function(data, type, row) {
						return row[5] + row[9];
					}
				},														//	6
				{
					'sClass':'center',
					'render' : function(data, type, row){
						return (row[5] == 0) ? '0.000' : (row[6]/row[5]).toFixed(3);
					}
				},														//	7
				{'sClass':'aatpa center split'},						//	8
				{'sClass':'aatpm center split'},						//	9
				{
					'sClass':'center',
					'render' : function(data, type, row){
						return (row[8] == 0) ? '0.000' : (row[9]/row[8]).toFixed(3);
					}
				},														//	10
				{'sClass':'aafta center split'},						//	11
				{'sClass':'aaftm center split'},						//	12
				{
					'sClass':'center',
					'render' : function(data, type, row){
						return (row[11] == 0) ? '0.000' : (row[12]/row[11]).toFixed(3);
					}
				},														//	13
				{'sClass':'aaorb center split'},						//	14
				{'sClass':'aadrb center split'},						//	15
				{
					'sClass':'center',
					'render' : function(data, type, row){
						return row[15] + row[14];
					}
				},														//	16
				{'sClass':'aaast center'},								//	17
				{'sClass':'aablk center'},								//	18				
				{'sClass':'aastl center'},								//	19
				{'sClass':'aatip center'},								//	20
				{'sClass':'aachg center'},								//	21
				{'sClass':'aatos center'}								//	22
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
			url				:	'json/stats-' + gameId + '-jv.json',
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
			url				:	'json/games-jv.json',
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
	var selectGame = '<table style="width:440px !important; margin-bottom: 10px; border: 2px red outset; border-radius: 5px;">';
	selectGame += '<tr><td style="width:90px; font-weight:bold; font-family:Tw Cen MT;">Select game:  </td><td>';

	$.ajax({
		dataType		:	'json',
		type			:	'GET',
		url				:	'json/games-jv.json',
		success			:	function(json){
							selectGame += '<select name="game" id="game">';
							selectGame += '<option value="season"></option>';
							for(var a = 0; a < json.length; a++) {
								selectGame += '<option value="' + json[a].id + '">(' + json[a].level + ' ' + json[a].day + ') ' + json[a].away + ' @ ' + json[a].home + '</option>';											
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
	var plyrTtl = 0;
	var plyrPpg = 0;

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
	var ppts = $('td.plyrpts');
	var teampts = $('td.plyrppg');

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

	for(var x = 0; x < ppts.length; x++) {
		plyrTtl += parseInt($(ppts[x]).text());
	}
	
	for(var x = 0; x < teampts.length; x++) {
		plyrPpg += parseFloat($(teampts[x]).text());
	}
	
	$('.teampts').empty().append(plyrTtl);
	
	if($('#game').find('option:selected').val() == 'season'){
		$('.teamttl').empty().append((plyrPpg).toFixed(1));
	}else{
		$('.teamttl').empty();
	}

	$('.fgattl').empty().append(fgaTtl);
	$('.fgmttl').empty().append(fgmTtl);
	//$('.fgpct').empty().append( ((fgmTtl/fgaTtl).toFixed(3)));

	$('.fgpct').empty().append(
		function(){
			return (fgmTtl == 0) ? '0.000' : ((fgmTtl/fgaTtl).toFixed(3));
		}
	);

	$('.tpattl').empty().append(tpaTtl);
	$('.tpmttl').empty().append(tpmTtl);
	//$('.tppct').empty().append( ((tpmTtl/tpaTtl).toFixed(3)));

	$('.tppct').empty().append( 
		function(){
			return (tpmTtl == 0) ? '0.000' : ((tpmTtl/tpaTtl).toFixed(3));	
		}
	);

	$('.ftattl').empty().append(ftaTtl);
	$('.ftmttl').empty().append(ftmTtl);
	//$('.ftpct').empty().append(  ((ftmTtl/ftaTtl).toFixed(3)));

	$('.ftpct').empty().append(  
		function(){
			return (ftmTtl == 0) ? '0.000' : ((ftmTtl/ftaTtl).toFixed(3));
		}
	);	

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
		$('#awayTeamAvg').empty().append(vt);
		$('#homeTeamAvg').empty().append(ht);
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
		/*
		if($('#game').find('option:selected').val() === 'season') {
			$('#awayQ1avg').empty().append(v1/6);
			$('#awayQ2avg').empty().append(v2/6);
			$('#awayQ3avg').empty().append(v3/6);
			$('#awayQ4avg').empty().append(v4/6);
			$('#homeQ1avg').empty().append(h1/6);
			$('#homeQ2avg').empty().append(h2/6);
			$('#homeQ3avg').empty().append(h3/6);
			$('#homeQ4avg').empty().append(h4/6);
			$('#awayTtlavg').empty().append(awayScore/6);
			$('#homeTtlavg').empty().append(homeScore/6);
			$('.fgaavg').empty().append($('#board').find('.fgattl').text()/6);
			$('.fgmavg').empty().append($('#board').find('.fgmttl').text()/6);
			$('.tpaavg').empty().append($('#board').find('.tpattl').text()/6);
			$('.tpmavg').empty().append($('#board').find('.tpmttl').text()/6);
			$('.ftaavg').empty().append($('#board').find('.ftattl').text()/6);
			$('.ftmavg').empty().append($('#board').find('.ftmttl').text()/6);
			$('.orebavg').empty().append($('#board').find('.orebttl').text()/6);
			$('.drebavg').empty().append($('#board').find('.drebttl').text()/6);
			$('.rebavg').empty().append($('#board').find('.rebttl').text()/6);
			$('.asstavg').empty().append($('#board').find('.asstttl').text()/6);
			$('.blkavg').empty().append($('#board').find('.blkttl').text()/6);
			$('.stlavg').empty().append($('#board').find('.stlttl').text()/6);
			$('.tipsavg').empty().append($('#board').find('.tipsttl').text()/6);
			$('.chrgavg').empty().append($('#board').find('.chrgttl').text()/6);
			$('.tosavg').empty().append($('#board').find('.tosttl').text()/6);
		}
		*/
}


function initButtons(){
	$('.addFgm').click(function(){
		var that = this;
		$.ajax({
			dataType 	:	'json',
			type		:	'POST',
			async		:	false,
			url			:	'http://localhost/sidebuster/web/knights/ajaxketball.php',
			data		:	{functionname: 'fieldgoalmake', parameter: $(this).parent().parent().attr('id')},
			success		:	function(json){
				$(that).parent().find('.fga').val(json.update.fga);
				$(that).parent().find('.fgm').val(json.update.fgm);
			},
			complete	:	function(){sumTotals();}
		});
	});
	$('.addFga').click(function(){
		var that = this;
		$.ajax({
			dataType 	:	'json',
			type		:	'POST',
			async		:	false,
			url			:	'http://localhost/sidebuster/web/knights/ajaxketball.php',
			data		:	{functionname: 'fieldgoalmiss', parameter: $(this).parent().parent().attr('id')},
			success		:	function(json){
				$(that).parent().find('.fga').val(json.update.fga);
			},
			complete	:	function(){sumTotals();}
		});
	});

	$('.addTpm').click(function(){
		var that = this;
		$.ajax({
			dataType 	:	'json',
			type		:	'POST',
			async		:	false,
			url			:	'http://localhost/sidebuster/web/knights/ajaxketball.php',
			data		:	{functionname: 'threepointmake', parameter: $(this).parent().parent().attr('id')},
			success		:	function(json){
				$(that).parent().find('.tpa').val(json.update.tpa);
				$(that).parent().find('.tpm').val(json.update.tpm);
			},
			complete	:	function(){sumTotals();}
		});
	});

	$('.addTpa').click(function(){
		var that = this;
		$.ajax({
			dataType 	:	'json',
			type		:	'POST',
			async		:	false,
			url			:	'http://localhost/sidebuster/web/knights/ajaxketball.php',
			data		:	{functionname: 'threepointmiss', parameter: $(this).parent().parent().attr('id')},
			success		:	function(json){
				$(that).parent().find('.tpa').val(json.update.tpa);
			},
			complete	:	function(){sumTotals();}
		});
	});

	$('.addFtm').click(function(){
		var that = this;
		$.ajax({
			dataType 	:	'json',
			type		:	'POST',
			async		:	false,
			url			:	'http://localhost/sidebuster/web/knights/ajaxketball.php',
			data		:	{functionname: 'freethrowmake', parameter: $(this).parent().parent().attr('id')},
			success		:	function(json){
				$(that).parent().find('.fta').val(json.update.fta);
				$(that).parent().find('.ftm').val(json.update.ftm);
			},
			complete	:	function(){sumTotals();}
		});
	});

	$('.addFta').click(function(){
		var that = this;
		$.ajax({
			dataType 	:	'json',
			type		:	'POST',
			async		:	false,
			url			:	'http://localhost/sidebuster/web/knights/ajaxketball.php',
			data		:	{functionname: 'freethrowmiss', parameter: $(this).parent().parent().attr('id')},
			success		:	function(json){
				$(that).parent().find('.fta').val(json.update.fta);
			},
			complete	:	function(){sumTotals();}
		});
	});

	$('.addOreb').click(function(){
		var that = this;
		$.ajax({
			dataType 	:	'json',
			type		:	'POST',
			async		:	false,
			url			:	'http://localhost/sidebuster/web/knights/ajaxketball.php',
			data		:	{functionname: 'offensiveboard', parameter: $(this).parent().parent().attr('id')},
			success		:	function(json){
				$(that).parent().find('.offrebound').val(json.update.offrebound);
			},
			complete	:	function(){sumTotals();}
		});
	});

	$('.addDreb').click(function(){
		var that = this;
		$.ajax({
			dataType 	:	'json',
			type		:	'POST',
			async		:	false,
			url			:	'http://localhost/sidebuster/web/knights/ajaxketball.php',
			data		:	{functionname: 'board', parameter: $(this).parent().parent().attr('id')},
			success		:	function(json){
				$(that).parent().find('.defrebound').val(json.update.defrebound);
			},
			complete	:	function(){sumTotals();}
		});
	});

	$('.addAsst').click(function(){
		var that = this;
		$.ajax({
			dataType 	:	'json',
			type		:	'POST',
			async		:	false,
			url			:	'http://localhost/sidebuster/web/knights/ajaxketball.php',
			data		:	{functionname: 'assist', parameter: $(this).parent().parent().attr('id')},
			success		:	function(json){
				$(that).parent().find('.assist').val(json.update.assist);
			},
			complete	:	function(){sumTotals();}
		});
	});

	$('.addBlk').click(function(){
		var that = this;
		$.ajax({
			dataType 	:	'json',
			type		:	'POST',
			async		:	false,
			url			:	'http://localhost/sidebuster/web/knights/ajaxketball.php',
			data		:	{functionname: 'block', parameter: $(this).parent().parent().attr('id')},
			success		:	function(json){
				$(that).parent().find('.block').val(json.update.block);
			},
			complete	:	function(){sumTotals();}
		});
	});

	$('.addStl').click(function(){
		var that = this;
		$.ajax({
			dataType 	:	'json',
			type		:	'POST',
			async		:	false,
			url			:	'http://localhost/sidebuster/web/knights/ajaxketball.php',
			data		:	{functionname: 'steal', parameter: $(this).parent().parent().attr('id')},
			success		:	function(json){
				$(that).parent().find('.steal').val(json.update.steal);
			},
			complete	:	function(){sumTotals();}
		});
	});

	$('.addTip').click(function(){
		var that = this;
		$.ajax({
			dataType 	:	'json',
			type		:	'POST',
			async		:	false,
			url			:	'http://localhost/sidebuster/web/knights/ajaxketball.php',
			data		:	{functionname: 'passDefended', parameter: $(this).parent().parent().attr('id')},
			success		:	function(json){
				$(that).parent().find('.tips').val(json.update.tips);
			},
			complete	:	function(){sumTotals();}
		});
	});

	$('.addChrg').click(function(){
		var that = this;
		$.ajax({
			dataType 	:	'json',
			type		:	'POST',
			async		:	false,
			url			:	'http://localhost/sidebuster/web/knights/ajaxketball.php',
			data		:	{functionname: 'charge', parameter: $(this).parent().parent().attr('id')},
			success		:	function(json){
				$(that).parent().find('.drawncharges').val(json.update.drawncharges);
			},
			complete	:	function(){sumTotals();}
		});
	});

	$('.addTo').click(function(){
		var that = this;
		$.ajax({
			dataType 	:	'json',
			type		:	'POST',
			async		:	false,
			url			:	'http://localhost/sidebuster/web/knights/ajaxketball.php',
			data		:	{functionname: 'turnover', parameter: $(this).parent().parent().attr('id')},
			success		:	function(json){
				$(that).parent().find('.turnovers').val(json.update.turnovers);
			},
			complete	:	function(){sumTotals();}
		});
	});
	
	$('.dec, .dec-split').click(function(){
		var that = this;
		$.ajax({
			dataType	:	'json',
			type		:	'POST',
			async		:	false,
			url			:	'http://localhost/sidebuster/web/knights/ajaxremove.php',
			data		:	{functionname: $(this).attr('alt'), parameter: $(this).parent().parent().attr('id')},
			success		:	function(json) {
				var callingAttribute = $(that).attr('alt');
				var findClass = '.' + callingAttribute;
				if(callingAttribute == 'fgm' || callingAttribute == 'tpm' || callingAttribute == 'ftm'){
					var sisterAttribute = callingAttribute.replace('m','a');
					var sisterClass = '.' + sisterAttribute;
					$(that).parent().find(sisterClass).val(json.update[sisterAttribute]);
				}
				$(that).parent().find(findClass).val(json.update[callingAttribute]);
			},
			complete	:	function(){sumTotals();}
		});
	});

}

function sumTotals() {
	var fgsAtt = $('.fga');
	var fgsMade = $('.fgm');
	var tpsAtt = $('.tpa');
	var tpsMade = $('.tpm');
	var ftsAtt = $('.fta');
	var ftsMade = $('.ftm');
	var offRebs = $('.offrebound');
	var defRebs = $('.defrebound');
	var assists = $('.assist');
	var blocks = $('.block');
	var steals = $('.steal');
	var tips = $('.tips');
	var chrgs = $('.drawncharges');
	var tos = $('.turnovers');
	
	$('#ttlassists').empty().append(function(){
		var k = 0;
		for(var a = 0; a < assists.length; a++){
			k += parseInt($(assists[a]).val());
		}
		return k;
	});
	$('#ttlblocks').empty().append(function(){
		var k = 0;
		for(var a = 0; a < blocks.length; a++){
			k += parseInt($(blocks[a]).val());
		}
		return k;
	});
	$('#ttlsteals').empty().append(function(){
		var k = 0;
		for(var a = 0; a < steals.length; a++){
			k += parseInt($(steals[a]).val());
		}
		return k;
	});
	$('#ttltips').empty().append(function(){
		var k = 0;
		for(var a = 0; a < tips.length; a++){
			k += parseInt($(tips[a]).val());
		}
		return k;
	});
	$('#ttlcharges').empty().append(function(){
		var k = 0;
		for(var a = 0; a < chrgs.length; a++){
			k += parseInt($(chrgs[a]).val());
		}
		return k;
	});
	$('#ttltos').empty().append(function(){
		var k = 0;
		for(var a = 0; a < tos.length; a++){
			k += parseInt($(tos[a]).val());
		}
		return k;
	});
	
	var j = 0;
	var k = 0;
	for(var a = 0; a < offRebs.length; a++){
		j += parseInt($(offRebs[a]).val());
	}
	for(var a = 0; a < defRebs.length; a++) {
		k += parseInt($(defRebs[a]).val());
	}
	$('#offrebs').empty().append(j);
	$('#defrebs').empty().append(k);
	$('#ttlrebs').empty().append(parseInt(j) + parseInt(k));
	
	var t = 0;
	var u = 0;
	for(var a = 0; a < ftsAtt.length; a++){
		t += parseInt($(ftsAtt[a]).val());
	}
	for(var a = 0; a < ftsMade.length; a++) {
		u += parseInt($(ftsMade[a]).val());
	}
	$('#ftatt').empty().append(t);
	$('#ftmade').empty().append(u);
	//$('#ftpct').empty().append((u/t).toFixed(3));
	
	$('#ftpct').empty().append(
		function(){
			return (u == 0) ? '0.000' : (u/t).toFixed(3);
		}
	);

	var z = 0;
	var b = 0;
	for(var a = 0; a < fgsAtt.length; a++){
		z += parseInt($(fgsAtt[a]).val());
	}
	for(var a = 0; a < fgsMade.length; a++){
		b += parseInt($(fgsMade[a]).val());
	}
	$('#fgatt').empty().append(z);
	$('#fgmade').empty().append(b);
	//$('#fgpct').empty().append((b/z).toFixed(3));

	$('#fgpct').empty().append(
		function(){
			return (b == 0) ? '0.000' : (b/z).toFixed(3);
		}
	);

	var y = 0;
	var c = 0;
	for(var a = 0; a < tpsAtt.length; a++){
		y += parseInt($(tpsAtt[a]).val());
	}
	for(var a = 0; a < tpsMade.length; a++){
		c += parseInt($(tpsMade[a]).val());
	}
	$('#tpatt').empty().append(y);
	$('#tpmade').empty().append(c);
	//$('#tppct').empty().append((c/y).toFixed(3));
	
	$('#tppct').empty().append(
		function(){
			return (c == 0) ? '0.000' : (c/y).toFixed(3);
		}
	);
}