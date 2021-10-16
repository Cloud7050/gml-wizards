/* [Functions] */

function drawTextBox(
	startX,
	startY,
	endX,
	endY,
	backgroundColour = c_white,
	backgroundOpacity = 1,
	isRounded = false,

	text,
	textColour = c_black,
	textFont = fontGUI,
	isCentreNotLeft = true,

	outlineThickness = 0,
	outlineColour = c_black
) {
	startDrawOpacity(backgroundOpacity);

	// Draw outline
	if (outlineThickness != 0) {
		draw_set_colour(outlineColour);
		if (isRounded) {
			draw_roundrect(
				startX,
				startY,
				endX,
				endY,
				false
			);
		} else {
			draw_rectangle(
				startX,
				startY,
				endX,
				endY,
				false
			);
		}
	}

	// Draw background
	var innerStartX = startX + outlineThickness;
	var innerStartY = startY + outlineThickness;
	var innerEndX = endX - outlineThickness;
	var innerEndY = endY - outlineThickness;

	draw_set_colour(backgroundColour);
	if (isRounded) {
		draw_roundrect(
			innerStartX,
			innerStartY,
			innerEndX,
			innerEndY,
			false
		);
	} else {
		draw_rectangle(
			innerStartX,
			innerStartY,
			innerEndX,
			innerEndY,
			false
		);
	}

	// Draw end
	stopDrawOpacity();

	// Draw text
	draw_set_colour(textColour);
	draw_set_font(textFont);
	draw_set_halign(isCentreNotLeft ? fa_center : fa_left);
	draw_set_valign(fa_middle);
	draw_text(
		// Assuming that when the caller wants width to hug the text,
		// the margin used for its calculations is the default like in here
		isCentreNotLeft ? lerp(startX, endX, 0.5) : startX + outlineThickness + global.CONSTANTS.UI.MARGIN_X,
		lerp(startY, endY, 0.5),
		text
	);
}

function startDrawOpacity(opacity) {
	draw_set_alpha(opacity);
}

function stopDrawOpacity() {
	draw_set_alpha(1);
}

function startColourDraw(colour = c_white) {
	gpu_set_fog(true, colour, 0, 0);
}

function stopColourDraw() {
	var fogSettings = gpu_get_fog();
	fogSettings[0] = false;
	gpu_set_fog(fogSettings);
}

function drawOutlinedInstance(instance, outlineThickness = 4) {
	startColourDraw();

	for (var xOffset = -outlineThickness; xOffset <= outlineThickness; xOffset++) {
		for (var yOffset = -outlineThickness; yOffset <= outlineThickness; yOffset++) {
			draw_sprite(
				instance.sprite_index,
				0,
				instance.x + xOffset,
				instance.y + yOffset
			);
		}
	}

	// Draw end
	stopColourDraw();

	instance.draw_self();
}