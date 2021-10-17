/// @description Initialise



/* [Parent] */

event_inherited();



/* [Methods] */

function initialiseParentGridElement(
	rowIndex,
	columnIndex
) {
	initialiseParentCoordinates(
		sprite_width,
		sprite_height
	);
	
	self.rowIndex = rowIndex;
	self.columnIndex = columnIndex;
}