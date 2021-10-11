/// @description Initialise



/* [Parent] */
event_inherited();
initialiseParentCoordinates(
	sprite_width,
	sprite_height
);



/* [Instance Variables] */
activeWizard = undefined;



/* [Methods] */
function isEmpty() {
	return activeWizard == undefined;
}

/// @returns The newly created objectActiveWizard
function newActiveWizard(wizardData) {
	activeWizard = instance_create_layer(
		x,
		y,
		global.CONSTANTS.LAYERS.INSTANCE_WIZARDS,
		objectActiveWizard
	);
	activeWizard.initialise(wizardData);
	return activeWizard;
}