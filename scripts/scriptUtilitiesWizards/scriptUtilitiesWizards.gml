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

	levelSprites
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
}



/* [Functions] */

// [Placing WizardData]
// The WizardData the player selected via wizard buttons to try placing

/// @returns The specified set placing WizardData
function setPlacingWizard(wizardData) {
	global.placingWizardData = wizardData;
	return wizardData;
}

/// @returns The new reset placing WizardData
function resetPlacingWizard() {
	return setPlacingWizard(undefined);
}

function getPlacingWizard() {
	return global.placingWizardData;
}

function isPlacingWizard() {
	return getPlacingWizard() != undefined;
}