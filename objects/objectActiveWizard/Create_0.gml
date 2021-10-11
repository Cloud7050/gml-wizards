/// @description Initialise



/* [Parent] */
event_inherited();



/* [Methods] */
function initialise(
	wizardData,
	level = 1
) {
	self.wizardData = wizardData;
	
	setLevel(level);
	initialiseParentCoordinates(
		sprite_width,
		sprite_height
	);
}

function setLevel(level) {
	self.level = level;
	
	sprite_index = wizardData.levelSprites[level - 1];
}