//(function($){

		var statElements = ['game', 'player', 'uniform', 'fga', 'fgm',
			'tpa', 'tpm', 'fta', 'ftm', 'offrebound', 'defrebound', 
			'assist', 'block', 'steal', 'tips', 'drawncharges', 'turnovers'];

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
			$('#fgattl').empty().append(fgaTtl);
			$('#fgmttl').empty().append(fgmTtl);
			$('#tpattl').empty().append(tpaTtl);
			$('#tpmttl').empty().append(tpmTtl);
			$('#ftattl').empty().append(ftaTtl);
			$('#ftmttl').empty().append(ftmTtl);
			$('#orebttl').empty().append(orebTtl);
			$('#drebttl').empty().append(drebTtl);
			$('#asstttl').empty().append(astTtl);
			$('#blkttl').empty().append(blkTtl);
			$('#stlttl').empty().append(stlTtl);
			$('#tipsttl').empty().append(pdTtl);
			$('#chrgttl').empty().append(ctTtl);
			$('#tosttl').empty().append(toTtl);

		}

//})(jQuery);