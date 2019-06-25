/**
 *	Title:	summary.js
 *	Author:	me
 *	Audit:
 *		6/19/2019	- 	Initial creation
 *					-	Load the whole enchillada
 *
 *
 *
 *
 */

var oTable;

function makeTable(rows) {

	var table = '<table id="meets" class="display">';
	table += '<thead>';
	table += '<tr class="ui-state-default">';
	table += '<th colspan="2"></th>';
	table += '<th colspan="2">Overall</th>';
	table += '<th colspan="8">Conference Points</th>';
	table += '<th colspan="6">Overall Points</th>';
	table += '</tr>';
	table += '<tr>';
	table += '<th>CONFERENCE</th>';
	table += '<th>TEAM</th>';
	table += '<th>W</th>';
	table += '<th>L</th>';
	table += '<th>W</th>';
	table += '<th>L</th>';
	table += '<th>Home</th>';
	table += '<th>Home (OPP)</th>';
	table += '<th>Away</th>';
	table += '<th>Away (OPP)</th>';
	table += '<th>Total</th>';
	table += '<th>Total (OPP)</th>';
	table += '<th>Home</th>';
	table += '<th>Home (OPP)</th>';
	table += '<th>Away</th>';
	table += '<th>Away (OPP)</th>';
	table += '<th>Total</th>';
	table += '<th>Total (OPP)</th>';
	table += '</tr>';
	table += '</thead>';
	table += '<tbody>';

	for(var i = 0; i < rows.length; i++) {
		table += makeSummaryRow(rows[i]);
	}
	
	table += '</tbody></table>';

	return table;

}

 function makeSummaryRow(list) {
		
	var tbl = '<tr>';
	
	tbl += '<td class="conference">' + list.conference + '</td>';
	tbl += '<td class="team">' + list.team + '</td>';
	tbl += '<td class="wins">' + list.wins + '</td>';
	tbl += '<td class="losses">' + list.losses + '</td>';
	tbl += '<td class="conf-wins">' + list.cwins + '</td>';
	tbl += '<td class="conf-losses">' + list.closses + '</td>';
	tbl += '<td>' + list.chomefor + '</td>';
	tbl += '<td>' + list.chomeagainst + '</td>';
	tbl += '<td>' + list.cawayfor + '</td>';
	tbl += '<td>' + list.cawayagainst + '</td>';
	tbl += '<td>' + list.cttlfor + '</td>';
	tbl += '<td>' + list.cttlagainst + '</td>';
	tbl += '<td>' + list.homefor + '</td>';
	tbl += '<td>' + list.homeagainst + '</td>';
	tbl += '<td>' + list.awayfor + '</td>';
	tbl += '<td>' + list.awayagainst + '</td>';
	tbl += '<td>' + list.totalfor + '</td>';
	tbl += '<td>' + list.totalagainst + '</td>';
	
	
	tbl += '</tr>';

	return tbl;
 }

function makeConfMeetTable(rows) {
	
	var table = '<table id="scores" class="display">';
	table += '<thead>';
	table += '<tr>';
	table += '<th>ID</th><th>Visitor</th><th>Score</th><th></th><th>Home</th><th>Score</th><th>Day</th>';
	table += '</tr>';
	table += '</thead>';
	table += '<tbody>';

	for(var a = 0; a < rows.length; a++) {
		table += makeConfMeetRow(rows[a]);
	}

	table += '</tbody>';
	table += '</table>';
	return table;

}
 
function makeConfMeetRow(list) {

	var vClass = list.vscore > list.hscore ? 'winner' : 'loser';
	var hClass = list.hscore > list.vscore ? 'winner' : 'loser';

	var tbl = '<tr>';
	tbl += '<td>' + list.id + '</td>';
	tbl += '<td class="' + vClass + '">' + list.visitor + '</td>';
	tbl += '<td class="' + vClass + '">' + list.vscore + '</td>';
	tbl += '<td> @ </td>';
	tbl += '<td class="' + hClass + '">' + list.home + '</td>';
	tbl += '<td class="' + hClass + '">' + list.hscore + '</td>';
	tbl += '<td>' + list.day + '</td>';
	tbl += '</tr>';
	return tbl;
}

function initLinks() {
	oTable = $('#meets').dataTable({
		bJQueryUI		:	true,
		aLengthMenu		:	[[10,25,50,100,-1],[10,25,50,100,'View All']],
		iDisplayLength	:	-1,
		sPaginationType	:	'full_numbers',
		aoColumns		:	[{'sClass':'conference'},{'sClass':'team'},null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null],
		bSort		:	false
	}).css({'width':'100%'});
	initInitialConfs();
	initInitialTeams();
}

function initMeetResults() {
	oTable = $('#scores').dataTable({
		bJQueryUI		:	true,
		aLengthMenu		:	[[10,25,50,100,-1],[10,25,50,100,'View All']],
		iDisplayLength	:	-1,
		sPaginationType	:	'full_numbers',
		aoColumns		:	[{'bVisible':false,'bSortable':false},null,null,{'sClass':'center-min'},null,null,{'sClass':'center-med'}],
		aoSorting		:	[[7, 'asc']]
	}).css({'width':'100%'});
	//initConfs();
}

function initInitialConfs() {
	$('.conference').click(function(){
		$.ajax({
			async			:	false,
			dataType		:	'json',
				type		:	'GET',
				url			:	'/wsd/services/meets.php',
//				url			:	'/sidebuster/web/wsd/services/meets.php',
				data		:	{'conf':$(this).text()},
			success			:	function(json) {
									oTable.fnClearTable(true);
									oTable.fnAddData(json.records, true);
								},
			complete		:	function(){ initConfsMeets(); initInitialTeams(); }
		});
	});
}

function initInitialTeams() {
	var teamMeets = [];

	$('.team').click(function(){
		$.ajax({
			async			:	false,
			dataType		:	'json',
				type		:	'GET',
				url			:	'/wsd/services/meets.php',
//				url			:	'/sidebuster/web/wsd/services/meets.php',
				data		:	{'team':$(this).text()},
			success			:	function(json) {
									var count = json.records.length;

									for(var y = 0; y < count; y++) {

										teamMeets.push(json.records[y]);

									}

								},
			complete		:	function() {
									$('#main').empty().append(makeConfMeetTable(teamMeets));
									initMeetResults();
								}
		});
	});
}

function initConfsMeets() {
	var confMeets = [];

	$('.conference').click(function(){
		$.ajax({
			async			:	false,
			dataType		:	'json',
				type		:	'GET',
				url			:	'/wsd/services/meets.php',
//				url			:	'/sidebuster/web/wsd/services/meets.php',
				data		:	{'conf':$(this).text(),'all':true},
			success			:	function(json) {
									
									var count = json.records.length;

									for(var x = 0; x < count; x++) {

										confMeets.push(json.records[x]);

									}

								},
			complete		:	function(){ /** something here to fetch the meet results for the conference and initialize teams to get meets for them **/ 
									$('#main').empty().append(makeConfMeetTable(confMeets));
									initMeetResults();
									initInitialTeams();
								}
		});
	});
}

 function initSummary() {
	var summaries = [];
	
	 $.ajax({
		async		:	false,
		dataType	:	'json',
			type	:	'GET',
			url		:	'/wsd/services/meets.php',
//			url		:	'/sidebuster/web/wsd/services/meets.php',
		success		:	function(json) {
							if(json.success == 1) {
								
								var count = json.records.length;
								
								for(var x = 0; x < count; x++) {
	
									summaries.push(json.records[x]);
									
								}
								
							}
		}
		 
	 });
		
	return summaries;	
 }