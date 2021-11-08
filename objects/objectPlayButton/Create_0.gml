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

		global.CONSTANTS.UI.MENU_BUTTONS.PLAY_TEXT
	);
}