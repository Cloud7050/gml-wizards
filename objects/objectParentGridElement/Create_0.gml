/// @description Initialise



/* [Parent] */

event_inherited();
initialiseParentCoordinates(
	sprite_width,
	sprite_height
);



/* [Child] */

function onCheckBlocksMerging() {
	return true;
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