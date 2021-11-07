/// @description Initialise



/* [Parent] */

event_inherited();

function onClick() {
	incrementStage();
	room_goto(roomStage);
}



/* [Methods] */

function initialise(
	anchor
) {
	initialiseParentNavigationButton(
		anchor,
		spriteNext
	)
}