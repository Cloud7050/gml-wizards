/// @description Initialise
// wizardData set by onLevelStart()



/* [Instance Variables] */
visible = true;



/* [Methods] */
function getEndX() {
	return x + global.CONSTANTS.UI.WIZARD_BUTTONS.WIDTH;
}

function getEndY() {
	return y + global.CONSTANTS.UI.WIZARD_BUTTONS.HEIGHT;
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

function isPlacingThis() {
	return getPlacingWizard() == wizardData;
}