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

		global.C.BUTTONS.NAVIGATION.DIMENSIONS,

		undefined,
		sprite
	);
}