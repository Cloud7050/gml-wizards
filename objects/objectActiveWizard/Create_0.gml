/// @description Initialise



/* [Parent] */

event_inherited();



/* [Instance Variables] */

isMergeCandidate = false;

animationWrapper = new AnimationWrapper();

// Mouse touch scaling
scaledLastStep = false;
scaledThisStep = false;
storedXScale = image_xscale;
storedYScale = image_yscale;



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

	// Store true coords used for attacking before animation.
	// Live sprite location will change for things like matching collision mask
	attackX = getMidX();
	attackY = getMidY();

	// Placement animation
	animationWrapper.startReplacementAnimation(
		new WizardPlacementAnimation(self)
	);
}

function getLevelSprite() {
	var levelSprites = wizardData.levelSprites;
	var index = clamp(
		level - 1,
		0,
		array_length(levelSprites) - 1
	);
	return levelSprites[index];
}

function refreshSprite() {
	sprite_index = getLevelSprite();
}

function setLevel(
	newLevel,
	doRefresh = true
) {
	level = newLevel;
	if (doRefresh) refreshSprite();
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
	return stepsWaited / max(1, getFireRate()) * 100;
}

function isOffCooldown() {
	return getCooldownPercentage() >= 100;
}

function isThisSelected() {
	return getSelectedWizard() == self;
}

function isMaxLevel() {
	return level >= global.C.WIZARDS.LEVEL_CAP;
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

function destroy() {
	if (isThisSelected()) resetSelectedWizard();

	space.activeWizard = undefined;

	instance_destroy();
}

function tryScaleUp() {
	if (scaledThisStep) return;

	scaledThisStep = true;

	storedXScale = image_xscale;
	storedYScale = image_yscale;

	var scaleFactor = 1.1;
	image_xscale *= scaleFactor;
	image_yscale *= scaleFactor;
}

function tryScaleDown() {
	if (!scaledThisStep) return;

	scaledThisStep = false;

	image_xscale = storedXScale;
	image_yscale = storedYScale;
}

function tryStartScale() {
	// Pre-scale if was already scaled
	if (scaledLastStep) {
		// Forget for next step
		scaledLastStep = false;

		tryScaleUp();
	}

	// Then check. Newly scale if touching, or unscale immediately if not
	if (isMouseColliding()) {
		// For next step to pre-scale if applicable
		scaledLastStep = true;

		tryScaleUp();
	} else tryScaleDown();
}

function tryEndScale() {
	tryScaleDown();
}