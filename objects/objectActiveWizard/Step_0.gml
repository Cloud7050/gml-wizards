/// @description Animate. Attack. Range display



// [Animation]
animationWrapper.step();

// [Attack]
stepsWaited++;
if (isOffCooldown()) {
	if (tryAttack()) stepsWaited = 0;
}

// [Range Display]
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
}