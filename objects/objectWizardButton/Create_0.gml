/// @description Initialise



/* [Parent] */

event_inherited();
initialiseParentCoordinates(
	global.CONSTANTS.UI.WIZARD_BUTTONS.WIDTH,
	global.CONSTANTS.UI.WIZARD_BUTTONS.HEIGHT,
	true
);



/* [Instance Variables] */

visible = true;



/* [Methods] */

function initialise(wizardData) {
	self.wizardData = wizardData;
}

function isPlacingThis() {
	return getPlacingWizard() == wizardData;
}