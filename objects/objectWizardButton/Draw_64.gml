/// @description Draw self



//FIXME
//l();
//l(x);
//l(y);
//l(getEndX());
//l(getEndY());
//l(width / 16);
//l(height / 16);
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