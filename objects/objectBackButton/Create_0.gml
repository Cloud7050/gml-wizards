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
	initialiseParentMenuButton(
		anchor,

		global.C.TEXT.MENUS.BACK
	);
}