/// @description Initialise



/* [Parent] */

event_inherited();



/* [Methods] */

function initialiseParentGridElement(
	indexes
) {
	initialiseParentCoordinates(
		sprite_width,
		sprite_height
	);

	self.indexes = indexes;
}