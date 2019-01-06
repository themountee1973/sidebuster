// Generate a random example spline and fancy visualization to help see what the plugin is doing
DEMO = {
	showWaypoints: false,
	showTrail: false
	};

DEMO.run = function() {

	var minX = 200;
	var minY = 200;
	var maxX = $(document).width() - 100;
	var maxY = $(document).height() - 100;

	var numPoints = 2;
	var dotsPerSeg = 15;
	var i;

	var start = 0;

	var points = [];
	var points2 = [];
	var points3 = [];
	
	points.push([470,250]);
	points.push([300,240]);
	points2.push([260,300]);
	points2.push([700,300]);
	points3.push([750,360]);
	points3.push([260,300]);

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
			$('<div id="mover">OUTSIDE</div>').appendTo($(document.body)).animate({ crSpline: spline }, 2000); 
			$('<div id="mover2">RIGHT</div>').appendTo($(document.body)).animate({ crSpline: spline2 }, 2000);
			$('<div id="mover3">MIDDLE/<br/>LIBERO</div>').appendTo($(document.body)).animate({ crSpline: spline3 }, 2000);
			
			$('#right, #outside1, #libero').hide();
		}else if(val == 'RESET') {
			$('#right, #outside1, #libero').show();
			$('#mover, #mover2, #mover3').remove();
		}
			$(this).text( ($(this).text()=='GO') ? 'RESET' : 'GO' );
	});
};

$(document).ready(function() {
	DEMO.run();
});
