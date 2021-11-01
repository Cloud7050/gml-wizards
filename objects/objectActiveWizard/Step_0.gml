/// @description Attack. Animate. Scale. Range display



// [Attack]
stepsWaited++;
if (isOffCooldown()) {
	if (tryAttack()) stepsWaited = 0;
}

// [Animate]
animationWrapper.step();

// [Scale]
tryStartScale();

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