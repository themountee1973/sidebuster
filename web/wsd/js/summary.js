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
 function Summary(json) {
	var conference = json.conference;
	var team = json.team;
	var wins = json.wins;
	var losses = json.losses;
	var conferenceWins = json.cwins;
	var conferenceLosses = json.closses;
	var conferencePointsForHome = json.chomefor;
	var conferencePointsAgainstHome = json.chomeagainst;
	var conferencePointsForAway = json.cawayfor;
	var conferencePointsAgainstAway = json.cawayagainst;
	var conferenceTotalPointsFor = json.cttlfor;
	var conferenceTotalPointsAgainst = json.cttlagainst;
	var totalPointsHomeFor = json.homefor;
	var totalPointsHomeAgainst = json.homeagainst;
	var totalPointsAwayFor = json.awayfor;
	var totalPointsAwayAgainst = json.awayagainst;
	var totalPointsFor = json.totalfor;
	var totalPointsAgainst = json.totalagainst;
 }
 
 function makeSummaryTable(list) {
		
	var tbl = 
	 
 }
 
 function initSummary() {
	var summaries = [];
	
	 $.ajax({
		 dataType	:	'json',
			type	:	'GET',
			url		:	'/wsd/services/meets.php',
		success		:	function(json) {
							if(json.success == 1) {
								
								var count = json.records.length;
								
								for(var x = 0; x < count; x++) {
	
									summaries.push(new Summary(json.records[x]));
									
								}
								
							}
		}
		 
	 });
		
	return summaries;	
 }