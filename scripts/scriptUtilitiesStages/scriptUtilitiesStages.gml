/* [Classes] */

function StageData(
	name,
	grid,
	waveContents,
	wizardsAvailable,
	startingCoins,
	instructions = undefined
) constructor {
	self.name = name;
	self.grid = grid;
	self.waveContents = waveContents;
	self.wizardsAvailable = wizardsAvailable;
	self.startingCoins = startingCoins;
	self.instructions = instructions;
}



/* [Functions] */

// [Stage Index]
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

function getStageData(
	stageIndex = getStage()
) {
	var allStageData = global.CONSTANTS.STAGES;
	var index = clamp(
		stageIndex,
		0,
		array_length(allStageData) - 1
	);
	return allStageData[index];
}

function getStageString(
	stageIndex = getStage()
) {
	return getStageData(stageIndex).name;
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

function getLivesString() {
	return "Lives: " + string(getLives());
}

function modifyLives(change) {
	setLives(
		getLives() + change
	);
}

/// @returns Whether the player has lost too many lives to continue the stage
function isLivesInsufficient() {
	return getLives() <= 0;
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

function getCoinsString() {
	return "Coins: $" + string(getCoins());
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