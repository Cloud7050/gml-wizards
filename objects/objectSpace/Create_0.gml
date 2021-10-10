/// @description Initialise



/* [Instance Variables] */
// For parent
event_inherited();
width = sprite_width;
height = sprite_height;

activeWizard = undefined;



/* [Methods] */
function isEmpty() {
	return activeWizard == undefined;
}

/// @returns The newly created objectActiveWizard
function createWizard(wizardData, level = 1) {
	activeWizard = instance_create_layer(
		x,
		y,
		global.CONSTANTS.LAYERS.INSTANCE_WIZARDS,
		objectActiveWizard
	);
	activeWizard.wizardData = wizardData;
	
	activeWizard.setLevel(level);
	
	return activeWizard;
}