/// @description Initialise



/* [Parent] */

event_inherited();

function onClick() {
	singletonWaveManager.tryStartNextWave();

	instance_destroy();
}

function onGetOutlineColour() {
	return global.C.COLOURS.OUTLINE_FLAG;
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