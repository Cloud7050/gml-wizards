/* [Classes] */

function WizardData(
	name,
	price,

	damage,
	fireRateSeconds,
	rangeElementLengths,

	damageMultiplier,
	fireRateMultiplier,
	rangeMultiplier,

	levelSprites,
	buttonColour = c_black
) constructor {
	self.name = name;
	self.price = price;

	self.damage = damage;

	// Steps
	fireRate = getStepsPerSecond() * fireRateSeconds;

	// Pixels
	range = convertRange(rangeElementLengths);

	self.damageMultiplier = damageMultiplier;
	self.fireRateMultiplier = fireRateMultiplier;
	self.rangeMultiplier = rangeMultiplier;

	self.levelSprites = levelSprites;
	self.buttonColour = buttonColour;

	function getDamage(level) {
		return calculateForLevel(level, damage, damageMultiplier);
	}

	function getFireRate(level) {
		return calculateForLevel(level, fireRate, fireRateMultiplier);
	}

	function getRange(level) {
		return calculateForLevel(level, range, rangeMultiplier);
	}

	function calculateForLevel(level, baseValue, multiplier) {
		return baseValue + (multiplier * (level - 1));
	}
}

function WizardPlacementAnimation(
	activeWizard
) constructor {
	self.activeWizard = activeWizard;
	
	stepsAnimated = 0;
	targetSteps = getStepsPerSecond() / 3;
	
	originalY = activeWizard.y;
	originalOpacity = activeWizard.image_alpha;
	
	yOffset = -(activeWizard.sprite_height / 2);
	opacityOffset = -0.25;
	
	function isOver() {
		return stepsAnimated >= targetSteps;
	}
	
	function animate(exponentialProgress) {
		var offsetFactor = 1 - exponentialProgress;
		
		activeWizard.y = originalY + (offsetFactor * yOffset);
		activeWizard.image_alpha = originalOpacity + (offsetFactor * opacityOffset);
	}
	
	function start() {
		animate(0);
	}
	
	function step() {
		if (isOver()) return;
		
		// Animate exponentially
		var linearProgress = stepsAnimated / max(1, targetSteps - 1);
		l(linearProgress);
		var exponentialProgress = power(linearProgress, 2);
		l(exponentialProgress);
		animate(exponentialProgress);
		l();
		
		stepsAnimated += 1;
	}
}



/* [Functions] */

// [Placing WizardData]
// The WizardData the player selected via wizard buttons to try placing

function setPlacingWizard(wizardData) {
	resetSelectedWizard();

	global.placingWizardData = wizardData;
}

function resetPlacingWizard() {
	global.placingWizardData = undefined;
}

function getPlacingWizard() {
	return global.placingWizardData;
}

function isPlacingWizard() {
	return getPlacingWizard() != undefined;
}

// [Selected Active Wizard]
// The objectActiveWizard the player selected via spaces to perform actions

function setSelectedWizard(activeWizard) {
	resetPlacingWizard();

	global.selectedActiveWizard = activeWizard;
}

function resetSelectedWizard() {
	global.selectedActiveWizard = undefined;
}

function getSelectedWizard() {
	return global.selectedActiveWizard;
}

function isWizardSelected() {
	return getSelectedWizard() != undefined;
}