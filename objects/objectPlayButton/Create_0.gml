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
	initialiseParentMenuButton(
		anchor,

		global.C.TEXT.MENUS.PLAY
	);
}