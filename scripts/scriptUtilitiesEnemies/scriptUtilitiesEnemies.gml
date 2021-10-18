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

	startingDelaySeconds,

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

/// @returns The reset path
function resetPath() {
	var path;
	if (!variable_global_exists("path")) {
		path = path_add();
		path_set_closed(path, false);
		global.path = path;
	} else {
		path = getPath();
		path_clear_points(path);
	}
	return path;
}

function getPath() {
	return global.path;
}

/// @returns The average length of any grid element regarding path traversal
function getElementLength() {
	var referenceSprite = object_get_sprite(objectParentGridElement);
	return mid(
		sprite_get_width(referenceSprite),
		sprite_get_height(referenceSprite)
	);
}

/// @returns The pixels per step matching the specified speed in elements per second
function convertSpeed(elementsPerSecond) {
	var pixelsPerSecond = getElementLength() * elementsPerSecond;
	var pixelsPerStep = pixelsPerSecond / getStepsPerSecond();
	return pixelsPerStep;
}

/// @returns The pixels matching the specified range in element lengths
function convertRange(elementLengths) {
	return getElementLength() * elementLengths;
}