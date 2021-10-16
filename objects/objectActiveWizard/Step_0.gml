/// @description Attack. Range display



// [Attack]
stepsWaited++;
if (isOffCooldown()) {
	if (tryAttack()) stepsWaited = 0;
}

// [Range Display]
if (isMouseColliding()) {
	var rangeCircle = instance_create_layer(
		getMidX(),
		getMidY(),
		global.CONSTANTS.LAYERS.INSTANCE_ABOVEGROUND,
		objectWizardRange
	);
	rangeCircle.initialise(
		wizardData.range
	);
}