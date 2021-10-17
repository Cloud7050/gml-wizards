/// @description Hover preview & hint



if (
	!isPlacingWizard()
	|| !isEmpty()
	|| !isMouseWithin()
) return;

// Create preview
var placingWizardData = getPlacingWizard();

var rangeCircle = instance_create_layer(
	getMidX(),
	getMidY(),
	global.CONSTANTS.LAYERS.INSTANCE_ABOVEGROUND,
	objectWizardRange
);
rangeCircle.initialise(
	placingWizardData.range,
	placingWizardData.levelSprites[0]
);

// Add hint
if (
	!isAffordable(placingWizardData.price)
) {
	addHint(
		global.CONSTANTS.HINTS.CANNOT_AFFORD_WIZARD
	);
}