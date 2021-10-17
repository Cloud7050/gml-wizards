/// @description Attack. Range display & hint. Animation



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
	var wizardRange = instance_create_layer(
		attackX,
		attackY,
		global.CONSTANTS.LAYERS.INSTANCE_ABOVEGROUND,
		objectWizardRange
	);
	wizardRange.initialise(
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

// [Animation]
placementAnimation.step();