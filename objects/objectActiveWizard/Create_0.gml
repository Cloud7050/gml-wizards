/// @description Initialise



/* [Methods] */
function initialise(
	wizardData,
	level = 1
) {
	self.wizardData = wizardData;
	setLevel(level);
}

function setLevel(level) {
	self.level = level;
	
	sprite_index = wizardData.levelSprites[level - 1];
}