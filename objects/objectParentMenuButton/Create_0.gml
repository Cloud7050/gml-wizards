/// @description Initialise



/* [Parent] */

event_inherited();



/* [Methods] */

function initialiseParentMenuButton(
	anchor,
	
	text
) {
	initialiseParentButton(
		anchor,

		global.CONSTANTS.UI.MENU_BUTTONS.WIDTH,
		global.CONSTANTS.UI.MENU_BUTTONS.HEIGHT,

		text
	);
}