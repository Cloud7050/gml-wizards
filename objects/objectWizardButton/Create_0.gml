/// @description Initialise
// wizardData set by onLevelStart()



/* [Instance Variables] */
// For parent
event_inherited();
width = global.CONSTANTS.UI.WIZARD_BUTTONS.WIDTH;
height = global.CONSTANTS.UI.WIZARD_BUTTONS.HEIGHT;
useGUICoordinates = true;

visible = true;



/* [Methods] */
function isPlacingThis() {
	return getPlacingWizard() == wizardData;
}