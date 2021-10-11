/* [Classes] */
function EnemyData(
	health,
	speedElementsPerSecond,

	coins,
	impact,

	sprite
) constructor {
	self.health = health;
	
	// Pixels per step
	self.speed = convertSpeed(speedElementsPerSecond);

	self.coins = coins;
	self.impact = impact;
	self.sprite = sprite;
}

function WaveData(
	enemyData,

	count,
	initialFrequencySeconds,
	finalFrequencySeconds,

	startingDelaySeconds = 0
) constructor {
	self.enemyData = enemyData;

	self.count = count;
	
	// Steps
	var stepsPerSecond = getStepsPerSecond();
	initialFrequency = stepsPerSecond * initialFrequencySeconds;
	finalFrequency = stepsPerSecond * finalFrequencySeconds;
	startingDelay = stepsPerSecond * startingDelaySeconds;
}



/* [Functions] */
// [Path]
/// @returns The specified set path
function setPath(path) {
	global.path = path;
	return path;
}

/// @returns The reset path
function resetPath() {
	if (!variable_global_exists("path")) {
		var path = path_add();
		path_set_closed(path, false);
		return setPath(path);
	} else {
		var path = getPath();
		path_clear_points(path);
		return path;
	}
}

function getPath() {
	return global.path;
}

/// @returns The pixels per step matching the specified speed in elements per second
function convertSpeed(elementsPerSecond) {
	// Assuming all grid elements' sprite dimensions are the same as the space sprite
	var spaceSprite = object_get_sprite(objectSpace);
	// Assuming height is the same as width regarding path traversal
	var elementLength = sprite_get_width(spaceSprite);

	var pixelsPerSecond = elementLength * elementsPerSecond;
	var pixelsPerStep = pixelsPerSecond / getStepsPerSecond();
	return pixelsPerStep;
}

/// @returns The pixels matching the specified range in element lengths
function convertRange(elementLengths) {
	// Assuming all grid elements' sprite dimensions are the same as the space sprite
	var spaceSprite = object_get_sprite(objectSpace);
	// Assuming height is the same as width regarding path traversal
	var elementLength = sprite_get_width(spaceSprite);
	
	return elementLength * elementLengths;
}