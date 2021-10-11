/* [Classes] */
function EnemyData(
	health,
	elementsPerSecond,
	
	coins,
	impact,
	
	sprite
) constructor {
	self.health = health;
	// Pixels per step
	self.speed = convertSpeed(elementsPerSecond);

	self.coins = coins;
	self.impact = impact;
	self.sprite = sprite;
}

function WaveData(
	enemyData,
	
	count,
	initialFrequency,
	finalFrequency,
	
	startingDelay = 0
) constructor {
	self.enemyData = enemyData;
	
	self.count = count;
	// Steps
	self.initialFrequency = initialFrequency;
	self.finalFrequency = finalFrequency;
	
	// Steps
	self.startingDelay = startingDelay;
}



/* [Functions] */
/// @returns The steps per second the game is set to run at. Different from fps & fps_real
function getStepsPerSecond() {
	return game_get_speed(gamespeed_fps);
}

/// @returns The pixels per step needed to reach the specified speed in elements per second
function convertSpeed(elementsPerSecond) {
	// Assuming all grid elements' sprite dimensions are the same as the space sprite
	var spaceSprite = object_get_sprite(objectSpace);
	// Assuming height is the same as width regarding path traversal
	var elementLength = sprite_get_width(spaceSprite);
	
	var pixelsPerSecond = elementLength * elementsPerSecond;
	var pixelsPerStep = pixelsPerSecond / getStepsPerSecond();
	l(elementsPerSecond);
	l(elementLength);
	l(pixelsPerSecond);
	l(pixelsPerStep);
	l();
	l(fps);
	l(getStepsPerSecond());
	l(128 / 60);
	return pixelsPerStep;
}

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