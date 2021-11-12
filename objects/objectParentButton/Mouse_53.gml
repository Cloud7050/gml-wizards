/// @description Button click



if (isMouseWithin()) {
	onClick();
	
	playSound(
		soundButton,
		global.C.PRIORITIES.EFFECT
	);
}