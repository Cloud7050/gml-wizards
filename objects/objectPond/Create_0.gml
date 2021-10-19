/// @description Initialise



/* [Parent] */

event_inherited();

function onCheckBlocksMerging() {
	return false;
}



/* [Methods] */

function initialise(
	indexes
) {
	initialiseParentGridElement(
		indexes
	);
}