/// @description Initialise



/* [Parent] */

event_inherited();



/* [Instance Variables] */

activeWizard = undefined;



/* [Methods] */

function initialise(
	indexes
) {
	initialiseParentGridElement(
		indexes
	);
}

function isEmpty() {
	return activeWizard == undefined;
}

function newActiveWizard(wizardData) {
	activeWizard = instance_create_layer(
		x,
		y,
		global.CONSTANTS.LAYERS.INSTANCE_WIZARDS,
		objectActiveWizard
	);
	activeWizard.initialise(
		self,
		wizardData
	);
}

function destroyActiveWizard() {
	if (activeWizard.isThisSelected()) resetSelectedWizard();

	instance_destroy(activeWizard);
	activeWizard = undefined;
}