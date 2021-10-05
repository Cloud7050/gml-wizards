/// @description Initialise



// buttonWidth. buttonHeight, wizard set by onGameStart()

// Go visible
visible = true;

// Convenient methods
function getEndX() {
	return x + buttonWidth;
}

function getEndY() {
	return y + buttonHeight;
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

function isPlacingThis() {
	return global.wizardData == wizardData;
}