/// @description Wizard hover preview



if (
	!isPlacingWizard()
	|| !isEmpty()
	|| !isMouseWithin()
) return;

var L1Sprite = getPlacingWizard().levelSprites[0];
draw_sprite_ext(
	L1Sprite,
	0,
	getMidX() - (sprite_get_width(L1Sprite) / 2),
	getMidY() - (sprite_get_height(L1Sprite) / 2),
	image_xscale,
	image_yscale,
	image_angle,
	image_blend,
	global.CONSTANTS.UI.PREVIEW_OPACITY
);