/// @description Hover preview



if (
	!isPlacingWizard()
	|| !isEmpty()
	|| !isMouseWithin()
) return;

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