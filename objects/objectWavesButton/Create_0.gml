/// @description Initialise



/* [Parent] */

event_inherited();

function onGetOutlineColour() {
	return global.C.COLOURS.CALL_WAVES;
}

function onGetTextColour() {
	return global.C.COLOURS.CALL_WAVES;
}

function onClick() {
	singletonWaveManager.tryStartNextWave();

	instance_destroy();
}



/* [Methods] */

function initialise(
	anchor
) {
	initialiseParentButton(
		anchor,

		global.C.BUTTONS.WAVES.DIMENSIONS,

		global.C.TEXT.CALL_WAVES
	);
}