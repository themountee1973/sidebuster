
function init(){
	InitMethods.initTeamCount();
	InitMethods.initTypeList();
}

var Scoring = {
	earlyRelayScores : [],
	individualScores : [],
	lateRelayScores  : [],

	initScoring : function(){
		
		var teamsScoringList = $('select[class="competingteam"]');
		
		for(var a = 0; a < teamsScoringList.length; a++){
			var id = $(teamsScoringList[a]).find('option:selected').val();
			var val = 0;

			Scoring.earlyRelayScores.push({team:id,score:val});
			Scoring.individualScores.push({team:id,score:val});
			Scoring.lateRelayScores.push({team:id,score:val});
			
		}
		
	},
	totalScoring : function(){
		var teamTotalScores = [];

		var teamsScoringList = $('select[class="competingteam"]');
		
		for(var a = 0; a < teamsScoringList.length; a++){
			var id = $(teamsScoringList[a]).find('option:selected').val();

			var val = 0;

			teamTotalScores.push({team:id,score:val});
			
		}

		for(var aaa = 0; aaa < Scoring.earlyRelayScores.length; aaa++){
			var id = Scoring.earlyRelayScores[aaa].team;
			var score = Scoring.earlyRelayScores[aaa].score;
			
			for(var zzz = 0; zzz < teamTotalScores.length; zzz++){
				
				if(teamTotalScores[zzz].team === id){
					teamTotalScores[zzz].score += score;
				}
				
			}
		}
		for(var aaa = 0; aaa < Scoring.individualScores.length; aaa++){
			var id = Scoring.individualScores[aaa].team;
			var score = Scoring.individualScores[aaa].score;
			
			for(var zzz = 0; zzz < teamTotalScores.length; zzz++){
				
				if(teamTotalScores[zzz].team === id){
					teamTotalScores[zzz].score += score;
				}
				
			}
		}
		for(var aaa = 0; aaa < Scoring.lateRelayScores.length; aaa++){
			var id = Scoring.lateRelayScores[aaa].team;
			var score = Scoring.lateRelayScores[aaa].score;
			
			for(var zzz = 0; zzz < teamTotalScores.length; zzz++){
				
				if(teamTotalScores[zzz].team === id){
					teamTotalScores[zzz].score += score;
				}
				
			}
		}
		
		var ttlStr = '';
		
		for(var zzz = 0; zzz < teamTotalScores.length; zzz++){
			var ttt = teamTotalScores[zzz];
			ttlStr += '(' + Constants.teamAbbrs[ttt.team] + ' - ' + ttt.score + ' PTS)&nbsp;&nbsp;';
		}
		
		$('#ttlscore').empty().append(ttlStr);
		
	},
	resetEarlyRelays : function(){
		for(var aaa = 0; aaa < Scoring.earlyRelayScores.length; aaa++){
			Scoring.earlyRelayScores[aaa].score = 0;
		}
	},
	resetIndividual : function(){
		for(var aaa = 0; aaa < Scoring.individualScores.length; aaa++){
			Scoring.individualScores[aaa].score = 0;
		}
	},
	resetLateRelays : function(){
		for(var aaa = 0; aaa < Scoring.lateRelayScores.length; aaa++){
			Scoring.lateRelayScores[aaa].score = 0;
		}
	},
	earlyRelayScoring : function(){

		Scoring.resetEarlyRelays();
			
		for(var x = 0; x < Constants.relayPlaces; x++){
			
			var place = Constants.ordinal[x];

			for(var aaa = 0; aaa < Scoring.earlyRelayScores.length; aaa++){
				var key = Scoring.earlyRelayScores[aaa].team;
				var eventPts = Constants.relayScoring[( x + 1)];
				var selected = $('select[name$="-' + place + '"][alt="early"] option:selected[value="' + key + '"]');
				var teamPts = (selected.length * eventPts);
				Scoring.earlyRelayScores[aaa].score += teamPts;
			}
		}
		
		var ersStr = '';

		for(var zzz = 0; zzz < Scoring.earlyRelayScores.length; zzz++){
			var ttt = Scoring.earlyRelayScores[zzz];
			ersStr += '(' + Constants.teamAbbrs[ttt.team] + ' - ' + ttt.score + ' PTS)&nbsp;&nbsp;';
		}
		
		$('#earlyrelayscore').empty().append(ersStr);

	},
	individualEventScoringMethod : function(){
		
		Scoring.resetIndividual();
		
		for(var x = 0; x < Constants.individualPlaces; x++){
			
			var place = Constants.ordinal[x];

			for(var aaa = 0; aaa < Scoring.individualScores.length; aaa++){
				var key = Scoring.individualScores[aaa].team;
				var eventPts = Constants.individualScoring[( x + 1)];
				var selected = $('select[name$="-' + place + '"][alt="individual"] option:selected[value="' + key + '"]');
				var teamPts = (selected.length * eventPts);
				Scoring.individualScores[aaa].score += teamPts;
			}
		}
		
		var indStr = '';

		for(var zzz = 0; zzz < Scoring.individualScores.length; zzz++){
			var ttt = Scoring.individualScores[zzz];
			indStr += '(' + Constants.teamAbbrs[ttt.team] + ' - ' + ttt.score + ' PTS)&nbsp;&nbsp;';
		}
		
		$('#individualscore').empty().append(indStr);

	},
	lateRelayScoring : function(){
		
		Scoring.resetLateRelays();
		
		for(var x = 0; x < Constants.relayPlaces; x++){
			
			var place = Constants.ordinal[x];

			for(var aaa = 0; aaa < Scoring.lateRelayScores.length; aaa++){
				var key = Scoring.lateRelayScores[aaa].team;
				var eventPts = Constants.relayScoring[( x + 1)];
				var selected = $('select[name$="-' + place + '"][alt="late"] option:selected[value="' + key + '"]');
				var teamPts = (selected.length * eventPts);
				Scoring.lateRelayScores[aaa].score += teamPts;
			}
			
		}
		
		var lrsStr = '';

		for(var zzz = 0; zzz < Scoring.lateRelayScores.length; zzz++){
			var ttt = Scoring.lateRelayScores[zzz];
			lrsStr += '(' + Constants.teamAbbrs[ttt.team] + ' - ' + ttt.score + ' PTS)&nbsp;&nbsp;';
		}
		
		$('#laterelayscore').empty().append(lrsStr);

	}
};

var Constants = {

	relayScoring : null,
	individualScoring : null,
	relayPlaces : 0,
	individualPlaces : 0,
	qtyOfTeams : 0,
	tt : "timeTrials",
	dm : "dualMeet",
	im : "invitationalMeet",
	cc : "conferenceChamps",
	moc : "meetOfChamps",
	contestants : null,
	participants : null,
	relayPoints : {
		"timeTrials" : [{1:7},1],
		"dualMeet" : [{1:7},1],
		"conferenceChamps" : [{1:22,2:18,3:16,
							4:14,5:12,6:10,
							7:8,8:6,9:4,10:2},10],
		"meetOfChamps" : [{1:40,2:34,3:32,4:30,
						5:28,6:26,7:24,8:22,
						9:18,10:14,11:12,12:10,
						13:8,14:6,15:4,16:2},16],
		"invitationalMeet" : [{1:1},0],
		get : function(type){
			return Constants.relayPoints[type];
		}
	},
	individualPoints : {
		"timeTrials" : [{1:5,2:3,3:2,4:1},4],
		"dualMeet" : [{1:5,2:3,3:2,4:1},4],
		"conferenceChamps" : [{1:11,2:9,3:8,
								4:7,5:6,6:5,
								7:4,8:3,9:2,
								10:1},10],
		"meetOfChamps" : [{1:20,2:17,3:16,4:15,
							5:14,6:13,7:12,8:11,
							9:9,10:7,11:6,12:5,
							13:4,14:3,15:2,16:1},16],
		"invitationalMeet" : [{1:10,2:8,3:7,4:6,
							5:5,6:4,7:3,8:2},8],
		get : function(type){
			return Constants.individualPoints[type];
		}
	},
	teams : {
		100038:'Amador Polar Bears',
		100032:'Arden Hills Otters',
		100033:'Arden Park Dolphins',
		100039:'Carmichael Beavers',
		100034:'Del Norte Dolphins',
		100040:'Dixon Dolphins',
		100023:'Elk Grove Piranhas',
		100041:'Fair Oaks Dolphins',
		100027:'Folsom Tiger Sharks',
		100035:'Fulton-El Camino Stingrays',
		100042:'Galt Gators',
		100024:'Glen Oaks Sea Lions',
		100028:'Gold River Stingrays',
		100044:'Highlander Dolphins',
		100025:'Johnson Ranch Barracudas',
		100029:'Laguna Creek Gators',
		100026:'Rio Del Oro Rapids',
		100045:'Rio Linda Aqua Knights',
		100046:'Rio Vista Sharks',
		100030:'Rocklin Wave',
		100049:'Rollingwood Rockets',
		100036:'Roseville Sugarbears',
		100047:'Sac Town Tsunami',
		100037:'Sunrise Sharks',
		100043:'West Sac Dolphins',
		100031:'Woodcreek Sea Wolves',
		100048:'Woodland Wreckers'
	},
	teamAbbrs : {
		100038:'APB',100032:'AH',
		100033:'AP',100039:'CB',
		100034:'DN',100040:'DD',
		100023:'EG',100041:'FOD',
		100027:'FTST',100035:'FEC',
		100042:'GG',100024:'GO',
		100028:'GR',100044:'NHD',
		100025:'JRB',100029:'LC',
		100026:'RDO',100045:'RLK',
		100046:'RVS',100030:'ROC',
		100049:'RR',100036:'RS',
		100047:'STT',100037:'SS',
		100043:'Fins',100031:'WSW',
		100048:'WW'
	},
	ordinal : {
		0:'1st',1:'2nd',2:'3rd',
		3:'4th',4:'5th',5:'6th',
		6:'7th',7:'8th',8:'9th',
		9:'10th',10:'11th',11:'12th',
		12:'13th',13:'14th',14:'15th',
		15:'16th',16:'17th',17:'18th',
		18:'19th',19:'20th'
	},
	teamColors : {
		100038:'#3366FF',
		100032:['maroon','gold'],
		100039:'#3333FF',
		100034:['darkblue','white'],
		100040:['#339933','black'],
		100023:['#0066FF','yellow'],
		100027:'#993300',
		100035:'#3333FF',
		100042:['#339933','black'],
		100024:'#660033',
		100028:['#000000','gold'],
		100044:'#FF0000',
		100025:'#0033FF',
		100029:'#990033',
		100026:['#00CCFF', 'black'],
		100045:'#CCFF00',
		100046:'#660000',
		100030:['black','lightblue'],
		100036:'#FFFFFF',
		100047:'#000000',
		100037:['#FFFF00','blue'],
		100031:['#FF0000','black'],
		100043:['#0066FF','white'],
		100049:['#FF6600','black'],
		100041:['#FF0033','black'],
		100033:['#000099','white'],
		100048:'#6699FF'
	}
};

var InitMethods = {

	initCompetingTeams : function(){
		
		return $('select[class="competingteam"]').each(function(){
		
			$(this).change(function(){	
			
				var thisTeam = $(this).find('option:selected').val();
				var allLists = $('.competingteam');
				
				for(var l = 0; l < allLists.length; l++){
				
					if(this != allLists[l]){
					
						$(allLists[l]).find('option[value="' 
							+ thisTeam + '"]').remove();
					
					}
				
				}
			
			});
		
		});
	},
	initTypeList : function(){
		
		$('#meet-type').change(function(){
			
			var selectedType = $(this).find('option:selected').val();
			var relay = Constants.relayPoints.get(selectedType);
			var individual = Constants.individualPoints.get(selectedType);
			
			Constants.relayScoring = relay[0];
			Constants.relayPlaces = relay[1];
			
			Constants.individualScoring = individual[0];
			Constants.individualPlaces = individual[1];
		
		});
	},
	initTeamCount : function(){
		
		$('#teamCount').keyup(function(){
		
			var qty = $(this).val();
			
			$('#teamselect').empty().append(ModularMethods.buildTeamSelectors(qty));
			
			InitMethods.initCompetingTeams();
			InitMethods.initCreateSheetButton();
			
			Constants.qtyOfTeams = qty;
		
		});
		
	},
	initCreateSheetButton : function(){
		
		return $('#createsheet').click(function(){
			
			Constants.contestants = new ModularMethods.outerList();

			$('#scoretable').empty().append(TableMethods.createEventTable());
			$('#ttl').click(function(){
				Scoring.earlyRelayScoring();
				Scoring.individualEventScoringMethod();
				Scoring.lateRelayScoring();
				Scoring.totalScoring();
			});
			Scoring.initScoring();
			$('#builder, #teamselect').hide();
			InitMethods.initShrinkage();
			InitMethods.initControls();
			InitMethods.initScoringLists();
			InitMethods.initLockButtons();
			return true;
		});
	},
	initControls : function(){
		
		$('#eventcontrol').show();
		
		$('#im,#shortfree,#back,#longfree,#breast,#fly').each(function(){
			
			$(this).click(function(){
				
				var className = $(this).attr('id');
				
				if($('.' + className).is(':visible')){
					
					$('.' + className).hide();
				
				}else{
					
					$('.' + className).show();
				
					$('.' + className).css({'background-color':'limegreen'});
					
					var chirren = $('.' + className);
					
					for(var a = 0; a < chirren.length; a++){
						
						if( ($(chirren[a]).children('td').children('select[id$="-1st"]').find('option:selected').val() !== "") ){
							$(chirren[a]).css({'background-color':'red'});
							$(chirren[a]).children('td').children('select[id$="-1st"]').attr("disabled",true);
						}
					}
					
				}
				return true;
				
			});
			
		});
	},
	initShrinkage : function(){
		
		return $('[id$="-shrinkage"]').each(function(){
			
			$(this).click(function(){
				
				var name = $(this).attr('id').split('\-')[0];

				var ctlRow = name + 'row';

				if($('.' + ctlRow).is(':visible')){
					$('.' + ctlRow).hide();
				}else{
					$('.' + ctlRow).show();
				}
				return true;
			});
		});
	},
	initScoringLists : function(){
		return $('select[class="scoringlist"]').change(function(){
			var id = $(this).find('option:selected').val();
			
			if( id !== "" ){
				$(this).parent('td').css({'background-color':Constants.teamColors[id][0]});
				//$(this).attr("disabled",true);
				//alert('test...' + Constants.teamColors[id][0]);
			}
			
		});
	},
	initLockButtons : function(){
		$('#unlock').click(function(){
			
			return $('select[disabled="disabled"]').removeAttr("disabled");
			
		});
		$('#relock').click(function(){
			
			return $('select[class="scoringlist"] option:selected[value!=""]').parent('select').attr("disabled",true);
			
		});
	}
};

var TableMethods = {
	
	typeList : function(){
		var list = '<select name="meet-type" id="meet-type">';
		list += '<option value="">- Select meet type -</option>';
		list += '<option value="' + Constants.tt + '">Time Trials</option>';
		list += '<option value="' + Constants.dm + '">Dual Meet</option>';
		list += '<option value="' + Constants.im + '">Invitational</option>';
		list += '<option value="' + Constants.cc + '">Conference Championships</option>';
		list += '<option value="' + Constants.moc + '">Meet of Champions</option>';
		list += '</select>';
		return list;
	},
	teamCount : function(){
		return '<input type="text" size="5" maxlength="2" style="text-align:center;" id="teamCount" value="0"/>';
	},
	builderTable : function(){
		
		var tbl = '<table style="display:inline;"><thead>';
		
		tbl += '<tr><th>Type</th><th>Qty</th></tr>';
		tbl += '</thead><tbody>';
		tbl += '<tr><td>' + TableMethods.typeList() + '</td><td>' 
				+ TableMethods.teamCount() + '</td></tr>';
		tbl += '</tbody></table>';
		
		return tbl;
	},
	createEventTable : function(){
		var tbl = '<table><thead>';
		tbl += '<tr><th>Event #</th>';
		
		for(var d = 0; d < Constants.individualPlaces; d++){
			tbl += '<th>' + Constants.ordinal[d] + '</th>';
		}
		
		tbl += '</tr></thead>';
		tbl += '<tbody>';

		tbl += TableMethods.earlyRelayEventTable();
		tbl += TableMethods.individualEventTable();
		tbl += TableMethods.lateRelayEventTable();
		
		tbl += '<tr><td colspan="' + (Constants.individualPlaces+1) + '" align="center"><input type="button" id="ttl" value="Calculate"/></td></tr>';
		tbl += '<tr><td colspan="' + (Constants.individualPlaces+1) + '" align="center"><input type="button" value="Unlock" id="unlock"/><input type="button" value="Relock" id="relock"/></td></tr>';
		tbl += '<tr><td colspan="' + (Constants.individualPlaces+1) + '"><div id="ttlscore"></div></td></tr>';
		tbl += '</tbody></table>';
		
		return tbl;
	},
	earlyRelayEventTable : function(){
		var tbl = '';
		
		for(var x = 1; x <= 11; x++){
			var eventName = 'Event - ' + x;
			
			tbl += '<tr class="earlyrow"><td>' + eventName + '</td>';

			for(var t = 0; t < Constants.individualPlaces; t++){
				
				if(t < Constants.relayPlaces)
					tbl += '<td>' + Constants.contestants(x + '-' 
						+ Constants.ordinal[t],'early') + '</td>';
				else
					tbl += '<td></td>';
				
			}

			tbl += '</tr>';
		}
		
		tbl += '<tr><td colspan="' + (Constants.individualPlaces+1) + 
				'" align="right" id="early-shrinkage">Early Relay Totals:  ' +
				'<div id="earlyrelayscore" style="display:inline;">0' 
				+ '</div></td></tr>';

		return tbl;
	},
	individualEventTable : function(){
		var tbl = '';
		
		for(var x = 12; x <= 73; x++){
			var eventName = 'Event - ' + x;
			
			tbl += '<tr class="' + ModularMethods.disciplineClass(x) + '"><td>' + eventName + '</td>';

			for(var t = 0; t < Constants.individualPlaces; t++){
				
				tbl += '<td>' + Constants.contestants(x + '-' + 
						Constants.ordinal[t],'individual') + '</td>';
				
			}

			tbl += '</tr>';
		}
		
		tbl += '<tr><td colspan="' + (Constants.individualPlaces+1) + 
				'" align="right" id="individual-shrinkage">Individual Event Totals:  '
				+ '<div id="individualscore" style="display:inline;">0' 
				+ '</div></td></tr>';

		return tbl;
	},
	lateRelayEventTable : function(){
		var tbl = '';
		
		for(var x = 74; x <= 83; x++){
			var eventName = 'Event - ' + x;
			
			tbl += '<tr class="laterow"><td>' + eventName + '</td>';

			for(var t = 0; t < Constants.individualPlaces; t++){
				
				if(t < Constants.relayPlaces)
					tbl += '<td>' + Constants.contestants(x + '-' + Constants.ordinal[t],'late') + '</td>';
				else
					tbl += '<td></td>';
				
			}

			tbl += '</tr>';
		}
		
		tbl += '<tr><td colspan="' + (Constants.individualPlaces+1) + 
				'" align="right" id="late-shrinkage">Late Relay Totals:  ' + 
				'<div id="laterelayscore" style="display:inline;">0' 
				+ '</div></td></tr>';

		return tbl;
	}
};

var ModularMethods = {
	
	outerTeam : function(){
		
		function innerTeam(number){
		
			var list = '<select name="team' + number + 
					'" id="team' + number + 
					'" class="competingteam">';
			
			list += '<option value=""></option>';
			
			for(t in Constants.teams){
			
				list += '<option value="' + t + '">' 
						+ Constants.teams[t] + '</option>';
			
			}
			
			list += '</select>';
			
			return list;
		
		}
		
		return innerTeam;
	},
	outerList : function(){
		
		function innerList(name,alt){
			
			var ts = $('select[class="competingteam"]');
			
			var list = '<select name="' + name + 
					'" id="' + name + '" class="scoringlist" alt="' 
					+ alt + '">';
			
			list += '<option value=""></option>';

			for(var z = 0; z < ts.length; z++){
				
				var id = $(ts[z]).find('option:selected').val();
				var colors = Constants.teamColors[id];
				
				list += '<option value="' + id + '" style="background-color:' + 
						colors[0] + ';color:' + colors[1] + ';">' + 
						Constants.teamAbbrs[id] + '</option>';
				
			}
			
			list += '</select>';
			
			return list;
			
		}

		
		return innerList;
	},
	buildTeamSelectors : function(qty){
		
		var tbl = '<table style="display:inline;"><thead>';
		tbl += '<tr><th colspan="' + qty + '">Select Teams Competing in Meet</th></tr>';
		tbl += '</thead><tbody>';
		tbl += '<tr>';
		
		for(var a=1; a <= qty; a++){
			tbl += '<td>';
			tbl += Constants.participants(a);
			tbl += '</td>';
		}
		
		tbl += '</tr><tr>';
		tbl += '<td colspan="' + qty + '" align="center"><input type="button" id="createsheet" value="Create Sheet"/></td>';
		tbl += '</tr>';
		tbl += '</tbody></table>';
		
		return tbl;
	},
	disciplineClass : function(int){
		var val = '';
		
		if( 12 <= int && int <= 19 )
			val = 'im';
		else if( 20 <= int && int <= 31 )
			val = 'shortfree';
		else if( 32 <= int && int <= 43 )
			val = 'back';
		else if( 44 <= int && int <= 53 )
			val = 'longfree';
		else if( 54 <= int && int <= 63 )
			val = 'breast';
		else if( 64 <= int && int <= 73 )
			val = 'fly';

		return val;
	}
};