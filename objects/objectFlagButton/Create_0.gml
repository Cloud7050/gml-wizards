/// @description Initialise



/* [Parent] */

event_inherited();

function onClick() {
	singletonWaveManager.tryStartNextWave();

	instance_destroy();
}

function onGetOutlineColour() {
	return global.CONSTANTS.UI.FLAG_COLOUR;
}



/* [Methods] */

function initialise(
	anchor
) {
	initialiseParentNavigationButton(
		anchor,

		spriteFlag
	)
}