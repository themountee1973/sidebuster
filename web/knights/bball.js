function initButtons(){
	$('.addFgm').click(function(){
		var that = this;
		$.ajax({
			dataType 	:	'json',
			type		:	'POST',
			async		:	false,
			url			:	'http://localhost/sidebuster/ajaxketball.php',
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
			url			:	'http://localhost/sidebuster/ajaxketball.php',
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
			url			:	'http://localhost/sidebuster/ajaxketball.php',
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
			url			:	'http://localhost/sidebuster/ajaxketball.php',
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
			url			:	'http://localhost/sidebuster/ajaxketball.php',
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
			url			:	'http://localhost/sidebuster/ajaxketball.php',
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
			url			:	'http://localhost/sidebuster/ajaxketball.php',
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
			url			:	'http://localhost/sidebuster/ajaxketball.php',
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
			url			:	'http://localhost/sidebuster/ajaxketball.php',
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
			url			:	'http://localhost/sidebuster/ajaxketball.php',
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
			url			:	'http://localhost/sidebuster/ajaxketball.php',
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
			url			:	'http://localhost/sidebuster/ajaxketball.php',
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
			url			:	'http://localhost/sidebuster/ajaxketball.php',
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
			url			:	'http://localhost/sidebuster/ajaxketball.php',
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
			url			:	'http://localhost/sidebuster/ajaxremove.php',
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
	$('#ftpct').empty().append((u/t).toFixed(3));
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
	$('#fgpct').empty().append((b/z).toFixed(3));
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
	$('#tppct').empty().append((c/y).toFixed(3));
}