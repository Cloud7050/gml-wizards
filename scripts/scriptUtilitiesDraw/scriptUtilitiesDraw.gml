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

	outlineWidth = 0,
	outlineHeight = 0,
	outlineColour = c_black
) {
	// Draw outline
	if (outlineWidth != 0 || outlineHeight != 0) {
		draw_set_colour(outlineColour);
		draw_set_alpha(1);
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
	draw_set_colour(backgroundColour);
	draw_set_alpha(backgroundOpacity);
	if (isRounded) {
		draw_roundrect(
			startX + outlineWidth,
			startY + outlineHeight,
			endX - outlineWidth,
			endY - outlineHeight,
			false
		);
	} else {
		draw_rectangle(
			startX + outlineWidth,
			startY + outlineHeight,
			endX - outlineWidth,
			endY - outlineHeight,
			false
		);
	}

	// Draw text
	draw_set_colour(textColour);
	draw_set_alpha(1);
	draw_set_font(textFont);
	draw_set_halign(isCentreNotLeft ? fa_center : fa_left);
	draw_set_valign(fa_middle);
	draw_text(
		// Assuming that when the caller wants width to hug the text,
		// the margin used for its calculations is the default like in here
		isCentreNotLeft ? lerp(startX, endX, 0.5) : startX + outlineWidth + global.CONSTANTS.UI.MARGIN_X,
		lerp(startY, endY, 0.5),
		text
	);
}