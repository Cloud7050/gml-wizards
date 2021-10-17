/// @description Initialise



/* [Parent] */

event_inherited();



/* [Instance Variables] */

isMergeCandidate = false;



/* [Methods] */

function initialise(
	space,
	wizardData,
	level = 1
) {
	self.space = space;
	self.wizardData = wizardData;

	setLevel(level);
	// Init after setting sprite
	initialiseParentCoordinates(
		sprite_width,
		sprite_height
	);

	// Start cooled down
	stepsWaited = getFireRate();
	
	// Store true coords used for attacking before animation
	attackX = getMidX();
	attackY = getMidY();
	
	// Animate placement, change actual sprite location for matching collision mask
	placementAnimation = new WizardPlacementAnimation(self);
	placementAnimation.start();
}

function setLevel(level) {
	self.level = level;

	sprite_index = wizardData.levelSprites[level - 1];
}

function getDamage() {
	return wizardData.getDamage(level);
}

function getFireRate() {
	return wizardData.getFireRate(level);
}

function getRange() {
	return wizardData.getRange(level);
}

function getCooldownPercentage() {
	return stepsWaited / getFireRate() * 100;
}

function isOffCooldown() {
	// Fire rate of 1 step means firing every step
	// (cooldown amount 100% or more).
	// Fire rate of 0 is invalid
	return getCooldownPercentage() >= 100;
}

function isThisSelected() {
	return getSelectedWizard() == self;
}

function isMaxLevel() {
	return level >= global.CONSTANTS.WIZARDS.LEVEL_CAP;
}

function isMatches(activeWizard) {
	return (
		wizardData == activeWizard.wizardData
		&& level == activeWizard.level
	);
}

/// @returns Whether the wizard attacked an available target in range
function tryAttack() {
	// Find enemies in range
	var enemiesInRange = findEnemiesInCircle(
		attackX,
		attackY,
		getRange()
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
		getDamage()
	);
	return true;
}