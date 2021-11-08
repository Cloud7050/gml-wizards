/// @description Pay & place wizard



if (
	!isPlacingWizard()
	|| !isEmpty()
) return;

var placingWizardData = getPlacingWizard();
if (trySpend(
	placingWizardData.price
)) {
	resetPlacingWizard();

	newActiveWizard(placingWizardData);
	
	playSound(
		soundSpend,
		global.C.PRIORITIES.EFFECT
	);
} else {
	var particleText = instance_create_layer(
		mouse_x,
		mouse_y,
		global.C.LAYERS.INSTANCE_DISPLAY,
		objectParticleText
	);
	particleText.initialise(
		"Not enough coins!",
		global.C.COLOURS.TEXT_ERROR
	);
}