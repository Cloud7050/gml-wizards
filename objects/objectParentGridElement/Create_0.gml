/// @description Initialise



/* [Parent] */

event_inherited();
initialiseParentCoordinates(
	sprite_width,
	sprite_height
);



/* [Methods] */

function initialiseParentGridElement(
	indexes
) {
	self.indexes = indexes;
}

function isBlocksMerging() {
	return true;
}