/// @description Hover preview



// If nothing selected
if (global.wizardData == undefined) return;

// If already have wizard placed
if (!isEmpty()) return;

// Actual hover position check
if (!isMouseWithin()) return;

// Draw
wizardSprite = global.wizardData.levelSprites[0];
draw_sprite_ext(
	wizardSprite,
	0,
	getMidX() - (sprite_get_width(wizardSprite) / 2),
	getMidY() - (sprite_get_height(wizardSprite) / 2),
	image_xscale,
	image_yscale,
	image_angle,
	image_blend,
	0.75
);
//l(wizardSprite);
//l(getMidX());
//l(getMidY());
//l((sprite_get_width(wizardSprite) / 2));
//l(getMidX() - (sprite_get_width(wizardSprite) / 2));
//l(getMidY() - (sprite_get_height(wizardSprite) / 2));