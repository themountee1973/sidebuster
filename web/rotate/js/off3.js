// Generate a random example spline and fancy visualization to help see what the plugin is doing
DEMO = {
	showWaypoints: false,
	showTrail: false
	};

DEMO.run = function() {

	var points = [];
	var points2 = [];
	var points3 = [];

	points.push([470,250]);
	points.push([670,220]);
	points2.push([560,300]);
	points2.push([700,300]);
	points3.push([750,360]);
	points3.push([470,300]);

	// -- Important bit #1: Generate the spline animation object --
	var spline = $.crSpline.buildSequence(points);
	var spline2 = $.crSpline.buildSequence(points2);
	var spline3 = $.crSpline.buildSequence(points3);
	
	// Clean up visuals if we've run this once already
	$("#mover").remove();
	$("#mover2").remove();
	$("#mover3").remove();

	
	// -- Important bit #2: Actually animate our mover object. --

	$('#go').click(function(){
		var val = $(this).text();
		if(val == 'GO') {
			$('<div id="mover">SETTER</div>').appendTo($(document.body)).animate({ crSpline: spline }, 2000);
			$('<div id="mover2">RIGHT</div>').appendTo($(document.body)).animate({ crSpline: spline2 }, 2000);
			$('<div id="mover3">OUTSIDE</div>').appendTo($(document.body)).animate({ crSpline: spline3 }, 2000);
			
			$('#right, #outside2, #setter').hide();
			
		}else if(val == 'RESET') {
			$('#right, #outside2, #setter').show();
			$('#mover, #mover2, #mover3').remove();
		}
			$(this).text( ($(this).text()=='GO') ? 'RESET' : 'GO' );
	});
};

$(document).ready(function() {
	DEMO.run();
});
