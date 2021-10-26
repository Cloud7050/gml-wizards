/* [Classes] */

function StageData(
	grid,
	waveContents,
	wizardsAvailable,
	startingCoins
) constructor {
	self.grid = grid;
	self.waveContents = waveContents;
	self.wizardsAvailable = wizardsAvailable;
	self.startingCoins = startingCoins;
}



/* [Functions] */

// [Stage]
function setStage(index) {
	global.stageIndex = index;
}

/// @returns The new reset stage index
function resetStage() {
	var defaultIndex = global.CONSTANTS.DEFAULTS.STAGE_INDEX;
	setStage(defaultIndex);
	return defaultIndex;
}

function getStage() {
	return global.stageIndex;
}

// [Lives]
function setLives(lives) {
	global.lives = lives;
}

/// @returns The new reset lives value
function resetLives() {
	var defaultLives = global.CONSTANTS.DEFAULTS.LIVES;
	setLives(defaultLives);
	return defaultLives;
}

function getLives() {
	return global.lives;
}

function modifyLives(change) {
	setLives(
		getLives() + change
	);
}

// [Coins]
function setCoins(coins) {
	global.coins = coins;
}

/// @returns The new reset coins value
function resetCoins() {
	var coins = global.CONSTANTS.DEFAULTS.COINS;
	setCoins(coins);
	return coins;
}

function getCoins() {
	return global.coins;
}

function modifyCoins(change) {
	setCoins(
		getCoins() + change
	);
}

/// @returns Whether the player has enough coins for the specified price
function isAffordable(price) {
	return getCoins() >= price;
}

/// @returns Whether the price got deducted from the player
function trySpend(price) {
	if (isAffordable(price)) {
		modifyCoins(-price);
		return true;
	}

	return false;
}