/// @description Initialise



/* [Instance Variables] */
// Merge colours, as unlike pure outline,
// blended colour becomes very dark
image_blend = merge_colour(
	c_white,
	global.CONSTANTS.UI.WIZARD_OUTLINES.CANDIDATE.COLOUR,
	0.75
);



/* [Methods] */
function initialise(
	sprite,
	rotation,
	
	xScale,
	yScale
) {
	sprite_index = sprite;
	image_angle = rotation;
	
	image_xscale = xScale;
	image_yscale = yScale;
}