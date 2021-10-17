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
	scale,
	rotation
) {
	sprite_index = sprite;
	image_xscale = scale;
	image_yscale = scale;
	image_angle = rotation;
}