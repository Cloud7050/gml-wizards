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
	
	// Steps
	cooldown = 0;
}

function setLevel(level) {
	self.level = level;
	
	sprite_index = wizardData.levelSprites[level - 1];
}

/// @returns Whether the wizard attacked an available target in range
function tryAttack() {
	// Find enemies in range
	var enemiesInRange = findEnemiesInCircle(
		getMidX(),
		getMidY(),
		wizardData.getRange(level)
	);
	var enemyCount = array_length(enemiesInRange);
	if (enemyCount <= 0) {
		return false;
	}
	
	// Find enemy furthest along the path
	var target = enemiesInRange[0];
	var targetPathProgress = 0;
	for (var enemyIndex = 0; enemyIndex < enemyCount; enemyIndex++) {
		var potentialTarget = enemiesInRange[enemyIndex];
		var potentialTargetPathProgress = potentialTarget.path_position;
		if (potentialTargetPathProgress > targetPathProgress) {
			target = potentialTarget;
			targetPathProgress = potentialTargetPathProgress;
		}
	}
	
	// Trigger enemy damage to run own behaviours
	target.takeDamage(
		wizardData.getDamage(level)
	);
	return true;
}