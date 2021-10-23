/// @description Initialise



/* [Parent] */

event_inherited();

function onCheckBlocksMerging() {
	return true;
}



/* [Methods] */

function initialise(
	indexes
) {
	initialiseParentGridElement(
		indexes
	);
}