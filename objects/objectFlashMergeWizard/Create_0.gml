/// @description Initialise



/* [Instance Variables] */
// Merge colours, as unlike pure outline,
// blended colour becomes very dark
image_blend = merge_colour(
	c_white,
	global.C.WIZARDS.OUTLINES.CANDIDATE.COLOUR,
	0.75
);



/* [Methods] */
function initialise(
	sprite,

	xScale,
	yScale,
	rotation
) {
	sprite_index = sprite;

	image_xscale = xScale;
	image_yscale = yScale;
	image_angle = rotation;
}