/// @description Initialise



/* [Parent] */

event_inherited();

function onGetBackgroundColour(isHovering) {
	if (isPlacingThis()) return isHovering
		? $6bc06b
		: $aaffaa;
	else return isHovering
		? c_silver
		: undefined;
}

function onGetOutlineColour() {
	return wizardData.buttonColour;
}

function onClick() {
	if (isPlacingThis()) resetPlacingWizard();
	else {
		// Select / overwrite previous wizard
		setPlacingWizard(wizardData);
	}
}



/* [Methods] */

function initialise(
	anchor,
	
	wizardData
) {
	self.wizardData = wizardData;
	
	initialiseParentButton(
		anchor,
		
		global.CONSTANTS.UI.WIZARD_BUTTONS.WIDTH,
		global.CONSTANTS.UI.WIZARD_BUTTONS.HEIGHT,
		
		wizardData.name
			+ "\n$" + string(wizardData.price)
	);
}



/* [Methods] */

function isPlacingThis() {
	return getPlacingWizard() == wizardData;
}