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
		isCentreNotLeft ? mid(startX, endX) : startX + outlineThickness + global.CONSTANTS.UI.MARGIN_X,
		mid(startY, endY),
		text
	);
}

enum SMART_TEXTBOX_ANCHORS {
	TOP_LEFT,
	TOP_RIGHT,
	BOTTOM_LEFT,
	BOTTOM_RIGHT
}

function drawSmartTextBox(
	anchorX,
	anchorY,
	anchor = SMART_TEXTBOX_ANCHORS.BOTTOM_LEFT,

	backgroundColour = undefined,
	backgroundOpacity = undefined,
	isRounded = undefined,

	text,
	textColour = undefined,
	textFont = fontGUI,

	outlineThickness = 0,
	outlineColour = undefined
) {
	var marginX = global.CONSTANTS.UI.MARGIN_X;
	var marginY = global.CONSTANTS.UI.MARGIN_Y;

	// For calculating string display dimensions
	draw_set_font(textFont);
	var textWidth = string_width(text);
	var textHeight = string_height(text);

	var innerWidth = outlineThickness + marginX + textWidth + marginX + outlineThickness;
	var innerHeight = outlineThickness + marginY + textHeight + marginY + outlineThickness;

	var startX;
	var endX;
	if (
		anchor == SMART_TEXTBOX_ANCHORS.TOP_LEFT
		|| anchor == SMART_TEXTBOX_ANCHORS.BOTTOM_LEFT
	) {
		startX = anchorX;
		endX = startX + innerWidth;
	} else {
		endX = anchorX;
		startX = endX - innerWidth;
	}

	var startY;
	var endY;
	if (
		anchor == SMART_TEXTBOX_ANCHORS.TOP_LEFT
		|| anchor == SMART_TEXTBOX_ANCHORS.TOP_RIGHT
	) {
		startY = anchorY;
		endY = startY + innerHeight;
	} else {
		endY = anchorY;
		startY = endY - innerHeight;
	}

	drawTextBox(
		startX,
		startY,
		endX,
		endY,

		backgroundColour,
		backgroundOpacity,
		isRounded,

		text,
		textColour,
		textFont,
		false,

		outlineThickness,
		outlineColour
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

function drawOutlinedInstance(
	instance,
	outlineThickness,
	outlineColour
) {
	startColourDraw(outlineColour);

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

// [Hints]

/// @returns The reset hints array
function resetHints() {
	var hints;
	if (!variable_global_exists("hints")) {
		hints = [];
		global.hints = hints;
	} else {
		hints = getHints();
		array_delete(
			hints,
			0,
			array_length(hints)
		);
	}
	return hints;
}

function getHints() {
	return global.hints;
}

function getHintsString() {
	return joinArray(
		getHints()
	);
}

function isAnyHints() {
	return array_length(getHints()) > 0;
}

/// @returns The hints array, reset with only the specified hint
function setHint(hint) {
	resetHints();
	return addHint(hint);
}

/// @returns The hints array with the specified hint appended
function addHint(hint) {
	var hints = getHints();
	array_push(
		hints,
		hint
	);
	return hints;
}