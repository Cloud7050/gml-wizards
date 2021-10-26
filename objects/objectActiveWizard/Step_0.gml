/// @description Animate. Attack. Range display & hint



// [Animation]
animationWrapper.step();

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
	var flashWizardRange = instance_create_layer(
		attackX,
		attackY,
		global.CONSTANTS.LAYERS.INSTANCE_ABOVEGROUND,
		objectFlashWizardRange
	);
	flashWizardRange.initialise(
		getRange()
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