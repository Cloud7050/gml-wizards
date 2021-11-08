/// @description Hover preview



if (
	!isPlacingWizard()
	|| !isEmpty()
	|| !isMouseWithin()
) return;

// Create preview
var placingWizardData = getPlacingWizard();

var flashWizardRange = instance_create_layer(
	getMidX(),
	getMidY(),
	global.C.LAYERS.INSTANCE_ABOVEGROUND,
	objectFlashWizardRange
);
flashWizardRange.initialise(
	placingWizardData.range,
	placingWizardData.levelSprites[0]
);