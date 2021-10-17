/* [Functions] */

/// @returns The steps per second the game is set to run at. Different from fps & fps_real
function getStepsPerSecond() {
	return game_get_speed(gamespeed_fps);
}

function joinArray(array, glue = "\n") {
	var outputString = "";
	for (var index = 0; index < array_length(array); index++) {
		if (index != 0) outputString += glue;
		outputString += string(array[index]);
	}
	return outputString;
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

/// @returns Whether the player has lost the level
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