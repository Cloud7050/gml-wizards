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

	startingDelaySeconds = 0,

	count,
	initialFrequencySeconds,
	finalFrequencySeconds = initialFrequencySeconds
) constructor {
	self.enemyData = enemyData;

	// Steps
	var stepsPerSecond = getStepsPerSecond();
	startingDelay = stepsPerSecond * startingDelaySeconds;

	self.count = count;

	// Steps
	initialFrequency = stepsPerSecond * initialFrequencySeconds;
	finalFrequency = stepsPerSecond * finalFrequencySeconds;
}



/* [Functions] */

// [Path]
function setPath(path) {
	global.path = path;
}

/// @returns The reset path
function resetPath() {
	var path;
	if (!variable_global_exists("path")) {
		path = path_add();
		path_set_closed(path, false);
		setPath(path);
	} else {
		path = getPath();
		path_clear_points(path);
	}
	return path;
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