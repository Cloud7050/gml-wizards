/* [Classes] */

function StageData(
	name,
	grid,
	waves,
	wizardsAvailable,
	startingCoins,
	instructions = undefined
) constructor {
	self.name = name;
	self.grid = grid;
	self.waves = waves;
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
	var index = 0;
	setStage(index);
	return index;
}

function getStage() {
	return global.stageIndex;
}

function getStageCeiling() {
	return array_length(global.C.STAGES) - 1;
}

function getStageData(
	index = getStage()
) {
	var clampedIndex = clamp(
		index,
		0,
		getStageCeiling()
	);
	return global.C.STAGES[clampedIndex];
}

function getStageString(
	index = undefined
) {
	return getStageData(index).name;
}

function isNextStageable() {
	// Whether current stage is under ceiling, next may be at ceiling
	return getStage() < getStageCeiling();
}

/// @returns The new incremented stage index
function incrementStage() {
	var index = getStage() + 1;
	setStage(index);
	return index;
}

// [Lives]
function setLives(lives) {
	global.lives = lives;
}

/// @returns The new reset lives value
function resetLives() {
	var defaultLives = global.C.DEFAULTS.LIVES;
	setLives(defaultLives);
	return defaultLives;
}

function getLives() {
	return global.lives;
}

function getLivesString() {
	return "Lives: " + string(getLives());
}

/// @returns The new modified lives value
function modifyLives(change) {
	var newLives = getLives() + change;
	setLives(newLives);
	return newLives;
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
	var coins = 0;
	setCoins(coins);
	return coins;
}

function getCoins() {
	return global.coins;
}

function getCoinsString() {
	return "Coins: $" + string(getCoins());
}

/// @returns The new modified coins value
function modifyCoins(change) {
	var coins = getCoins() + change;
	setCoins(coins);
	return coins;
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

// [Win State]
function setWin(state) {
	global.winState = state;
}

/// @returns The new reset win state
function resetWin() {
	var state = true;
	setWin(state);
	return state;
}

function getWin() {
	return global.winState;
}