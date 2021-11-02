/// @description Check game state



// Lose
if (isLivesInsufficient()) {
	showResults(false);
	return;
}

// Win
if (
	isWavesOver()
	&& instance_number(objectActiveEnemy) <= 0
) {
	showResults(true);
}