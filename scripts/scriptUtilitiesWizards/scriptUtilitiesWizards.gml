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



/* [Functions] */

function anyMergeCandidates() {
	for (var index = 0; index < instance_number(objectActiveWizard); index++) {
		var activeWizard = instance_find(objectActiveWizard, index);
		if (activeWizard.isMergeCandidate) return true;
	}
	
	return false;
}

function clearMergeCandidates() {
	with (objectActiveWizard) {
		isMergeCandidate = false;
	}
}

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
// The objectActiveWizard the player clicked to perform actions

function setSelectedWizard(activeWizard) {
	resetPlacingWizard();

	global.selectedActiveWizard = activeWizard;
	
	remarkMergeCandidates(activeWizard);
}

function resetSelectedWizard() {
	global.selectedActiveWizard = undefined;
	
	clearMergeCandidates();
}

function getSelectedWizard() {
	return global.selectedActiveWizard;
}

function isWizardSelected() {
	return getSelectedWizard() != undefined;
}