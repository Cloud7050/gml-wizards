/// @description Range hover preview



if (!isMouseWithin()) return;

var range;
var innerColour;
var outerColour = undefined;
if (isEmpty()) {
	if (!isPlacingWizard()) return;
	
	range = getPlacingWizard().range;
	innerColour = c_grey;
} else {
	range = activeWizard.getRange();
	innerColour = c_green;
	outerColour = c_white;
}

var rangeCircle = instance_create_layer(
	getMidX(),
	getMidY(),
	global.CONSTANTS.LAYERS.INSTANCE_ABOVEGROUND,
	objectRangeCircle
);
rangeCircle.initialise(
	range,
	innerColour,
	outerColour
);