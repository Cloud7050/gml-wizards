/// @description Attack. Range display & hint



// [Attack]
stepsWaited++;
if (isOffCooldown()) {
	if (tryAttack()) stepsWaited = 0;
}

// [Range Display & Hint]
if (
	isThisSelected()
	|| isMouseColliding()
) {
	var rangeCircle = instance_create_layer(
		getMidX(),
		getMidY(),
		global.CONSTANTS.LAYERS.INSTANCE_ABOVEGROUND,
		objectWizardRange
	);
	rangeCircle.initialise(
		wizardData.range
	);
	
	// If "unaware" of click-to-select
	// (displaying range not due to selecting this,
	// but due to hover)
	if (!isWizardSelected()) {
		addHint(
			global.CONSTANTS.HINTS.CLICK_SELECT_WIZARD
		);
	}
}