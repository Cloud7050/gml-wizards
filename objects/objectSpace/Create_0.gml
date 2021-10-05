/// @description Initialise



// Instance variables
activeWizard = undefined;

// Convenient methods

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
	return mouseWithinInstance(self);
}

function isEmpty() {
	return activeWizard == undefined;
}