/// @description Draw self



var opacity = global.CONSTANTS.UI.RANGE_OPACITY;
startDrawOpacity(opacity);

var isHoverPreview = isPreview();

draw_circle_colour(
	x,
	y,
	radius,
	isHoverPreview ? c_grey : c_green,
	isHoverPreview ? c_grey : c_white,
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