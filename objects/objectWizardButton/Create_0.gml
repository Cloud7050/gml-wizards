/// @description Initialise



/* [Parent] */

event_inherited();

function onGetBackgroundColour(isHovering) {
	if (isPlacingThis()) return isHovering
		? global.C.COLOURS.BACKGROUND_SELECTED_HOVER
		: global.C.COLOURS.BACKGROUND_SELECTED;
	else return isHovering
		? global.C.COLOURS.BACKGROUND_HOVER
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

		global.C.BUTTONS.WIZARD.DIMENSIONS,

		joinArray(
			[
				wizardData.name,
				wizardData.getPriceString()
			]
		)
	);
}

function isPlacingThis() {
	return getPlacingWizard() == wizardData;
}