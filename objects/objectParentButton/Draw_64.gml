/// @description Draw self



if (sprite != undefined) {
	//TODO sprite button
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
		min(width, height) / 16,

		text,
		undefined,
		undefined,
		false
	);
}