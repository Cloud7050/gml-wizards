/// @description Draw self



// Draw outline

var startX = x;
var startY = y;
var endX = getEndX();
var endY = getEndY();

draw_set_color(c_black);
draw_roundrect(
	startX,
	startY,
	endX,
	endY,
	false
);

// Draw background

if (isPlacingThis()) {
	// Selected colour
	draw_set_color($aaffaa);
} else {
	// Default colour
	draw_set_color(c_white);
}
var borderWidth = global.CONSTANTS.UI.WIZARD_BUTTONS.WIDTH / 16;
var borderHeight = global.CONSTANTS.UI.WIZARD_BUTTONS.HEIGHT / 16;
draw_roundrect(
	startX + borderWidth,
	startY + borderHeight,
	endX - borderWidth,
	endY - borderHeight,
	false
);

// Draw text

draw_set_color(c_black);
draw_set_font(fontGUI);
draw_set_valign(fa_middle);
draw_set_halign(fa_center);
draw_text(
	getMidX(),
	getMidY(),
	wizardData.name
		+ "\n$" + string(wizardData.price)
);