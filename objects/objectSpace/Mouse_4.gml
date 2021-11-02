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
} else {
	var particleText = instance_create_layer(
		mouse_x,
		mouse_y,
		global.CONSTANTS.LAYERS.INSTANCE_DISPLAY,
		objectParticleText
	);
	particleText.initialise(
		"Not enough coins!",
		c_red
	);
}