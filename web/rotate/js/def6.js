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

	// Make a random list of waypoints for the animation to follow
	for (i=0; i<numPoints; i++) {
		//points.push([Math.floor(Math.random()*(maxX-minX))+minX, Math.floor(Math.random()*(maxY-minY))+minY]);
	}

	points.push([450,215]);
	points.push([680,250]);
	points2.push([680,250]);
	points2.push([470,260]);

	// -- Important bit #1: Generate the spline animation object --
	var spline = $.crSpline.buildSequence(points);
	var spline2 = $.crSpline.buildSequence(points2);
	
	// Clean up visuals if we've run this once already
	$("#mover").remove();
	$("#mover2").remove();
	$(".waypoint").remove();
	$(".path-dot").remove();

	// Scary-looking stuff to visualize the waypoints and the trail of dots
	// NOT needed for animation
	for (i=0; i<numPoints; i++) {
		$('<div class="waypoint">' + i + '</div>')
			.appendTo($(document.body))
			.css({
				left: points[i][0],
				top: points[i][1],
				display: (DEMO.showWaypoints ? "inline" : "none")
			});

		for (var j=0; j<dotsPerSeg; j++) {
			var t = (i + j/dotsPerSeg) / points.length;
			var pos = spline.getPos(t);
			$('<div class="path-dot" />')
				.appendTo($(document.body))
				.css({
					left: pos.left,
					top: pos.top,
					display: (DEMO.showTrail ? "inline" : "none")
				});
		}
	}

	// -- Important bit #2: Actually animate our mover object. --

	$('#go').click(function(){
		var val = $(this).text();
		if(val == 'GO') {
			$('<div id="mover">RIGHT</div>')
				.appendTo($(document.body))
				.animate({ crSpline: spline }, 2000); //, function () {
					// Re-run the demo with a new spline after we're done
					//window.setTimeout(function() {
					//	DEMO.run();
					//}, 5000);
				//});
			
			$('<div id="mover2">MIDDLE</div>')
				.appendTo($(document.body))
				.animate({ crSpline: spline2 }, 2000); //, function () {
					// Re-run the demo with a new spline after we're done
					//window.setTimeout(function() {
					//	DEMO.run();
					//}, 5000);
				//})
			
			$('#middle, #right').hide();
		}else if(val == 'RESET') {
			$('#middle, #right').show();
			$('#mover, #mover2').remove();
		}
			$(this).text( ($(this).text()=='GO') ? 'RESET' : 'GO' );
	});
};

$(document).ready(function() {
	$("#show-trail").click(function () {
		if ($(this).is(":checked")) {
			$(".path-dot").css({display: "inline"});
			DEMO.showTrail = true;
		}
		else {
			$(".path-dot").css({display: "none"});
			DEMO.showTrail = false;
		}
	});

	$("#show-waypoints").click(function () {
		if ($(this).is(":checked")) {
			$(".waypoint").css({display: "inline"});
			DEMO.showWaypoints = true;
		}
		else {
			$(".waypoint").css({display: "none"});
			DEMO.showWaypoints = false;
		}
	});

	$("#show-trail").attr("checked", DEMO.showTrail);
	$("#show-waypoints").attr("checked", DEMO.showWaypoints);

	DEMO.run();
});
