/// @description Initialise



/* [Parent] */

event_inherited();

function onClick() {
	room_goto(roomStages);
}



/* [Methods] */

function initialise(
	anchor
) {
	initialiseParentNavigationButton(
		anchor,
		
		spriteExit
	)
}