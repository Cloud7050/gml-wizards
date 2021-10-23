/// @description Initialise



/* [Parent] */

event_inherited();
initialiseParentCoordinates(
	sprite_width,
	sprite_height
);



/* [Child] */

function onCheckBlocksMerging() {
	return false;
}



/* [Methods] */

function initialiseParentGridElement(
	indexes
) {
	self.indexes = indexes;
}

function isBlocksMerging() {
	return onCheckBlocksMerging();
}