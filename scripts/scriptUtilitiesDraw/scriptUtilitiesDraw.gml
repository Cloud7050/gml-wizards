/* [Functions] */

function anchorStartX(anchor, anchorX, width) {
	var startX = anchorX;

	if (
		anchor == DRAWING_ANCHORS.TOP_RIGHT
		|| anchor == DRAWING_ANCHORS.BOTTOM_RIGHT
	) startX -= width;
	else if (anchor == DRAWING_ANCHORS.CENTRE) startX -= width / 2;

	return startX;
}

function anchorStartY(anchor, anchorY, height) {
	var startY = anchorY;

	if (
		anchor == DRAWING_ANCHORS.BOTTOM_LEFT
		|| anchor == DRAWING_ANCHORS.BOTTOM_RIGHT
	) startY -= height;
	else if (anchor == DRAWING_ANCHORS.CENTRE) startY -= height / 2;

	return startY;
}

function startDrawOpacity(opacity) {
	draw_set_alpha(opacity);
}

function stopDrawOpacity() {
	draw_set_alpha(1);
}

function drawBackground(
	startX,
	startY,
	endX,
	endY,

	backgroundColour = c_white,
	backgroundOpacity = 1,
	isRounded = false,

	outlineColour = c_black,
	outlineThickness = 0
) {
	var rectangleFunction = draw_rectangle;
	if (isRounded) rectangleFunction = draw_roundrect;

	startDrawOpacity(backgroundOpacity);

	// Draw outline
	if (outlineThickness != 0) {
		draw_set_colour(outlineColour);
		rectangleFunction(
			startX,
			startY,
			endX,
			endY,
			false
		);
	}

	// Draw background
	var innerStartX = startX + outlineThickness;
	var innerStartY = startY + outlineThickness;
	var innerEndX = endX - outlineThickness;
	var innerEndY = endY - outlineThickness;

	draw_set_colour(backgroundColour);
	rectangleFunction(
		innerStartX,
		innerStartY,
		innerEndX,
		innerEndY,
		false
	);

	// Draw end
	stopDrawOpacity();
}

function drawText(
	textX,
	textY,

	maxWidth,

	text,
	colour = c_black,
	opacity = 1,
	font = fontGUI,
	isLeftNotCentre = true
) {
	startDrawOpacity(opacity);

	draw_set_colour(colour);
	draw_set_font(font);
	draw_set_halign(isLeftNotCentre ? fa_left : fa_center);
	draw_set_valign(fa_middle);
	draw_text_ext(
		textX,
		textY,
		text,
		LINE_SEPARATORS.M,
		maxWidth
	);

	// Draw end
	stopDrawOpacity();
}

function drawTextBox(
	anchor,
	anchorX,
	anchorY,

	width,
	height,

	backgroundColour = undefined,
	backgroundOpacity = undefined,
	isRounded = undefined,

	outlineColour = undefined,
	outlineThickness = undefined,

	text,
	textColour = undefined,
	textFont = undefined,
	isLeftNotCentre = true
) {
	var startX = anchorStartX(
		anchor,
		anchorX,
		width
	);
	var startY = anchorStartY(
		anchor,
		anchorY,
		height
	);
	var endX = startX + width;
	var endY = startY + height;

	drawBackground(
		startX,
		startY,
		endX,
		endY,

		backgroundColour,
		backgroundOpacity,
		isRounded,

		outlineColour,
		outlineThickness
	);

	// Draw text
	var paddingX = outlineThickness + global.CONSTANTS.UI.MARGIN_X;
	var textStartX = startX + paddingX;
	var textEndX = endX - paddingX;
	var textMaxWidth = textEndX - textStartX;

	drawText(
		isLeftNotCentre
			? textStartX
			: mid(startX, endX),
		mid(startY, endY),

		textMaxWidth,

		text,
		textColour,
		undefined,
		textFont,
		isLeftNotCentre
	);
}

function drawSpriteBox(
	anchor,
	anchorX,
	anchorY,

	width,
	height,

	backgroundColour = undefined,
	backgroundOpacity = undefined,
	isRounded = undefined,

	outlineColour = undefined,
	outlineThickness = undefined,

	sprite
) {
	var startX = anchorStartX(
		anchor,
		anchorX,
		width
	);
	var startY = anchorStartY(
		anchor,
		anchorY,
		height
	);
	var endX = startX + width;
	var endY = startY + height;

	drawBackground(
		startX,
		startY,
		endX,
		endY,

		backgroundColour,
		backgroundOpacity,
		isRounded,

		outlineColour,
		outlineThickness
	);

	// Draw sprite
	draw_sprite(
		sprite,
		0,
		mid(startX, endX) - (sprite_get_width(sprite) / 2) + sprite_get_xoffset(sprite),
		mid(startY, endY) - (sprite_get_height(sprite) / 2) + sprite_get_yoffset(sprite)
	);
}

function drawSmartTextBox(
	anchor,
	anchorX,
	anchorY,

	maxWidth,

	backgroundColour = undefined,
	backgroundOpacity = undefined,
	isRounded = undefined,

	outlineColour = undefined,
	outlineThickness = 0,

	text,
	textColour = undefined,
	textFont = fontGUI
) {
	var paddingX = outlineThickness + global.CONSTANTS.UI.MARGIN_X;
	var paddingY = outlineThickness + global.CONSTANTS.UI.MARGIN_Y;

	var textMaxWidth = maxWidth - (2 * paddingX);

	draw_set_font(textFont);
	var textWidth = string_width_ext(
		text,
		LINE_SEPARATORS.M,
		textMaxWidth
	);
	var textHeight = string_height_ext(
		text,
		LINE_SEPARATORS.M,
		textMaxWidth
	);

	var width = textWidth + (2 * paddingX);
	var height = textHeight + (2 * paddingY);

	drawTextBox(
		anchor,
		anchorX,
		anchorY,

		width,
		height,

		backgroundColour,
		backgroundOpacity,
		isRounded,

		outlineColour,
		outlineThickness,

		text,
		textColour,
		textFont
	);
}

function startDrawColour(colour = c_white) {
	gpu_set_fog(true, colour, 0, 0);
}

function stopDrawColour() {
	var fogSettings = gpu_get_fog();
	fogSettings[0] = false;
	gpu_set_fog(fogSettings);
}

function drawOutlinedInstance(
	instance,
	outlineThickness,
	outlineColour
) {
	startDrawColour(outlineColour);

	for (var xOffset = -outlineThickness; xOffset <= outlineThickness; xOffset++) {
		for (var yOffset = -outlineThickness; yOffset <= outlineThickness; yOffset++) {
			draw_sprite_ext(
				instance.sprite_index,
				0,
				instance.x + xOffset,
				instance.y + yOffset,
				image_xscale,
				image_yscale,
				image_angle,
				image_blend,
				1
			);
		}
	}

	// Draw end
	stopDrawColour();

	instance.draw_self();
}

function startDrawSurface(surface) {
	surface_set_target(surface);
}

function stopDrawSurface() {
	surface_reset_target();
}

// [End Surface]
function setSurface(endSurface) {
	global.endSurface = endSurface;
}

/// @returns The reset end surface
function resetSurface() {
	var endSurface;
	if (!variable_global_exists("endSurface")) {
		endSurface = surface_create(
			room_width,
			room_height
		);
		global.endSurface = endSurface;
	} else {
		endSurface = getSurface();
		
		startDrawSurface(endSurface);
		
		draw_clear(c_black);
		
		// Draw end
		stopDrawSurface();
	}
	return endSurface;
}

function getSurface() {
	return global.endSurface;
}



/* [Enums] */

enum DRAWING_ANCHORS {
	TOP_LEFT,
	TOP_RIGHT,
	BOTTOM_LEFT,
	BOTTOM_RIGHT,
	CENTRE
}