/// @description Draw self



drawTextBox(
	x,
	y,
	getEndX(),
	getEndY(),
	isPlacingThis() ? $aaffaa : c_white,
	undefined,
	true,
	wizardData.name
		+ "\n$" + string(wizardData.price),
	undefined,
	undefined,
	undefined,
	width / 16,
	height / 16
);