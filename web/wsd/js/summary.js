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
 
 function makeSummaryRow(list) {
		
	var tbl = '<tr>';
	
	tbl += '<td class="conference">' + list.conference + '</td>';
	tbl += '<td class="team">' + list.team + '</td>';
	tbl += '<td class="wins">' + list.wins + '</td>';
	tbl += '<td class="losses">' + list.losses + '</td>';
	tbl += '<td class="conf-wins">' + list.cwins + '</td>';
	tbl += '<td class="conf-losses">' + list.closses + '</td>';
	tbl += '<td class="conf-pts-home">' + list.chomefor + '</td>';
	tbl += '<td class="conf-pts-home-against">' + list.chomeagainst + '</td>';
	tbl += '<td class="conf-pts-away">' + list.cawayfor + '</td>';
	tbl += '<td class="conf-pts-away-against">' + list.cawayagainst + '</td>';
	tbl += '<td class="conf-total-pts">' + list.cttlfor + '</td>';
	tbl += '<td class="conf-total-pts-against">' + list.cttlagainst + '</td>';
	tbl += '<td class="home-total-pts">' + list.homefor + '</td>';
	tbl += '<td class="home-total-pts-against">' + list.homeagainst + '</td>';
	tbl += '<td class="away-total-pts">' + list.awayfor + '</td>';
	tbl += '<td class="away-total-pts-against">' + list.awayagainst + '</td>';
	tbl += '<td class="total-pts">' + list.totalfor + '</td>';
	tbl += '<td class="total-pts-against">' + list.totalagainst + '</td>';
	
	
	tbl += '</tr>';

	return tbl;
 }
 
 function initSummary() {
	var summaries = [];
	
	 $.ajax({
		async		:	false,
		dataType	:	'json',
			type	:	'GET',
			url		:	'/wsd/services/meets.php',
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