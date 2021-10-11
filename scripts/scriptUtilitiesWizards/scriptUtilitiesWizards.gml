/* [Classes] */
function WizardData(
	name,
	price,

	damage,
	fireRate,
	range,

	damageMultiplier,
	fireRateMultiplier,
	rangeMultiplier,

	levelSprites
) constructor {
	self.name = name;
	self.price = price;

	self.damage = damage;
	self.fireRate = fireRate;
	self.range = range;

	self.damageMultiplier = damageMultiplier;
	self.fireRateMultiplier = fireRateMultiplier;
	self.rangeMultiplier = rangeMultiplier;

	self.levelSprites = levelSprites;
}



/* [Functions] */

// [Lives]
/// @returns The specified set lives value
function setLives(lives) {
	global.lives = lives;
	return lives;
}

/// @returns The new reset lives value
function resetLives() {
	return setLives(
		global.CONSTANTS.DEFAULTS.LIVES
	);
}

function getLives() {
	return global.lives;
}

/// @returns The new modified lives value
function modifyLives(change) {
	return setLives(
		getLives() + change
	);
}

/// @returns Whether the player has lost the level
function isLivesInsufficient() {
	return getLives() <= 0;
}

// [Coins]
/// @returns The specified set coins value
function setCoins(coins) {
	global.coins = coins;
	return coins;
}

/// @returns The new reset coins value
function resetCoins() {
	return setCoins(
		global.CONSTANTS.DEFAULTS.COINS
	);
}

function getCoins() {
	return global.coins;
}

/// @returns The new modified coins value
function modifyCoins(change) {
	return setCoins(
		getCoins() + change
	);
}

/// @returns Whether the player has enough coins for the specified price
function isAffordable(price) {
	return getCoins() >= price;
}

/// @returns {boolean} Whether the price got deducted from the player
function trySpend(price) {
	if (isAffordable(price)) {
		modifyCoins(-price);
		return true;
	}

	return false;
}

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