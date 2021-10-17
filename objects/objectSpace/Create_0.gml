/// @description Initialise



/* [Parent] */

event_inherited();

function onCheckBlocksMerging() {
	return !isEmpty();
}



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
		getMidX(),
		getMidY(),
		global.CONSTANTS.LAYERS.INSTANCE_WIZARDS,
		objectActiveWizard
	);
	activeWizard.initialise(
		self,
		wizardData
	);
}