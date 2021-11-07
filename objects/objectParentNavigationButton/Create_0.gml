/// @description Initialise



/* [Parent] */

event_inherited();



/* [Methods] */

function initialiseParentNavigationButton(
	anchor,
	sprite
) {
	initialiseParentButton(
		anchor,

		global.CONSTANTS.UI.NAVIGATION_BUTTONS.WIDTH,
		global.CONSTANTS.UI.NAVIGATION_BUTTONS.HEIGHT,

		undefined,
		sprite
	);
}