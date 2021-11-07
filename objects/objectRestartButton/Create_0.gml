/// @description Initialise



/* [Parent] */

event_inherited();

function onClick() {
	room_goto(roomStage);
}



/* [Methods] */

function initialise(
	anchor
) {
	initialiseParentNavigationButton(
		anchor,
		spriteRestart
	)
}