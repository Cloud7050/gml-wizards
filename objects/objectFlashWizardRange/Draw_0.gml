/// @description Draw self



var opacity = global.C.OPACITIES.RANGE;
startDrawOpacity(opacity);

var isHoverPreview = isPreview();
var previewColour = global.C.COLOURS.RANGE_PREVIEW;
var innerColour = global.C.COLOURS.RANGE_INNER;
var outerColour = global.C.COLOURS.RANGE_OUTER;

draw_circle_colour(
	x,
	y,
	radius,
	isHoverPreview ? previewColour : innerColour,
	isHoverPreview ? previewColour : outerColour,
	false
);

// Draw end
stopDrawOpacity();

if (isHoverPreview) {
	draw_sprite_ext(
		previewSprite,
		0,
		x,
		y,
		image_xscale,
		image_yscale,
		image_angle,
		image_blend,
		opacity
	);
}