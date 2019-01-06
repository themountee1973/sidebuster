// Generate a random example o1 and fancy visualization to help see what the plugin is doing
DEMO = {
	showWaypoints: false,
	showTrail: false
	};

DEMO.run = function() {

	var dotsPerSeg = 15;
	var i;

	var start = 0;

	var o1Points = [];
	var rightPoints = [];
	var liberoPoints = [];
	var o2Points = [];
	var setterPoints = [];
	
	o1Points.push([600,240]);
	o1Points.push([360,240]);
	setterPoints.push([360,240]);
	setterPoints.push([600,240]);
	liberoPoints.push([470,340]);
	liberoPoints.push([260,300]);
	o2Points.push([260,300]);
	o2Points.push([470,340]);
	rightPoints.push([750,360]);
	rightPoints.push([650,300]);
	
	// -- Important bit #1: Generate the o1 animation object --
	var o1 = $.crSpline.buildSequence(o1Points);
	var right = $.crSpline.buildSequence(rightPoints);
	var libero = $.crSpline.buildSequence(liberoPoints);
	var o2 = $.crSpline.buildSequence(o2Points);
	var setter = $.crSpline.buildSequence(setterPoints);
	
	// Clean up visuals if we've run this once already
	$("#mover").remove();
	$("#mover2").remove();
	$("#mover3").remove();
	$("#mover4").remove();
	$("#mover5").remove();

	// -- Important bit #2: Actually animate our mover object. --

	$('#go').click(function(){
		var val = $(this).text();
		if(val == 'GO') {
			$('<div id="mover">RIGHT</div>').appendTo($(document.body)).animate({ crSpline: right }, 2000); 
			$('<div id="mover2">OUTSIDE</div>').appendTo($(document.body)).animate({ crSpline: o1 }, 2000);
			$('<div id="mover3">LIBERO</div>').appendTo($(document.body)).animate({ crSpline: libero }, 2000); 
			$('<div id="mover4">OUTSIDE</div>').appendTo($(document.body)).animate({ crSpline: o2 }, 2000);
			$('<div id="mover5">SETTER</div>').appendTo($(document.body)).animate({ crSpline: setter }, 2000);
			$('#right, #outside1, #libero, #outside2, #setter').hide();
		}else if(val == 'RESET') {
			$('#right, #outside1, #libero, #outside2, #setter').show();
			$('#mover, #mover2, #mover3, #mover4, #mover5').remove();
		}
			$(this).text( ($(this).text()=='GO') ? 'RESET' : 'GO' );
	});
};

$(document).ready(function() {
	DEMO.run();
});
