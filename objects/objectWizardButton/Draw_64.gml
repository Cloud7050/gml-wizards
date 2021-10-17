/// @description Draw self



drawTextBox(
	getStartX(),
	getStartY(),
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

	min(width, height) / 16,
	wizardData.buttonColour
);