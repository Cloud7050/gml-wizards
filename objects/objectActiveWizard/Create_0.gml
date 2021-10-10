/// @description Initialise
// wizardData set by objectSpace



/* [Methods] */
function setLevel(level) {
	self.level = level;
	
	sprite_index = wizardData.levelSprites[level - 1];
}