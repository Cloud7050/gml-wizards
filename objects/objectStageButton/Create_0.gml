/// @description Initialise



/* [Parent] */

event_inherited();
initialiseParentCoordinates(
	global.CONSTANTS.UI.STAGE_BUTTONS.WIDTH,
	global.CONSTANTS.UI.STAGE_BUTTONS.HEIGHT,
	true
);



/* [Methods] */

function initialise(
	index
) {
	self.index = index;
}