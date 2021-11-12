/// @description Draw self



var outlineThickness = min(width, height) / 16;
if (sprite != undefined) {
	drawSpriteBox(
		anchor,
		x,
		y,
		
		width,
		height,

		onGetBackgroundColour(
			isMouseWithin()
		),
		undefined,
		true,
		
		onGetOutlineColour(),
		outlineThickness,

		sprite
	);
} else {
	drawTextBox(
		anchor,
		x,
		y,
		
		width,
		height,

		onGetBackgroundColour(
			isMouseWithin()
		),
		undefined,
		true,
		
		onGetOutlineColour(),
		outlineThickness,

		text,
		onGetTextColour(),
		undefined,
		false
	);
}