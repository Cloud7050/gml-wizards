/// @description Draw self



draw_set_alpha(
	global.CONSTANTS.UI.PREVIEW_OPACITY
);
draw_set_circle_precision(100);
draw_circle_colour(
	x,
	y,
	radius,
	innerColour,
	outerColour,
	false
);