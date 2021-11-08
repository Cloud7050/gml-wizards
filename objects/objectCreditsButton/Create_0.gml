/// @description Initialise



/* [Parent] */

event_inherited();

function onClick() {
	room_goto(roomCredits);
}



/* [Methods] */

function initialise(
	anchor
) {
	initialiseParentMenuButton(
		anchor,

		global.C.TEXT.MENUS.CREDITS
	);
}