/// @description Initialise



/* [Parent] */

event_inherited();

function onClick() {
	singletonWaveManager.tryStartNextWave();
	
	instance_destroy();
}

function onGetOutlineColour() {
	return $0000aa;
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