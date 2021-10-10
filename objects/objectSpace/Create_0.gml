/// @description Initialise



/* [Instance Variables] */
activeWizard = undefined;



/* [Methods] */
function getEndX() {
	return x + sprite_width;
}

function getEndY() {
	return y + sprite_height;
}

function getMidX() {
	return lerp(x, getEndX(), 0.5);
}

function getMidY() {
	return lerp(y, getEndY(), 0.5);
}

function isMouseWithin() {
	return mouseInInstance(self);
}

function isEmpty() {
	return activeWizard == undefined;
}