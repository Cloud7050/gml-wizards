/// @description Initialise



/* [Parent] */

event_inherited();

function onGetBackgroundColour(isHovering) {
	if (isPlacingThis()) return isHovering
		? global.CONSTANTS.UI.SELECTED_HOVER_COLOUR
		: global.CONSTANTS.UI.SELECTED_COLOUR;
	else return isHovering
		? global.CONSTANTS.UI.HOVER_COLOUR
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

		joinArray(
			[
				wizardData.name,
				wizardData.getPriceString()
			]
		)
	);
}



/* [Methods] */

function isPlacingThis() {
	return getPlacingWizard() == wizardData;
}