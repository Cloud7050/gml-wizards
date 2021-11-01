/// @description Initialise



/* [Parent] */

event_inherited();

function onClick() {
	room_goto(roomMain);
}



/* [Methods] */

function initialise(
	anchor
) {
	initialiseParentButton(
		anchor,
		
		global.CONSTANTS.UI.NAVIGATION_BUTTONS.WIDTH,
		global.CONSTANTS.UI.NAVIGATION_BUTTONS.HEIGHT,
		
		undefined,
		spriteExit
	);
}