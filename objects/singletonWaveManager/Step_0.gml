/// @description Check game state



// Lose
if (isLivesInsufficient()) {
	//TODO
	room_goto(roomMain);
	return;
}

// Win
if (
	isWavesOver()
	&& instance_number(objectActiveEnemy) <= 0
) {
	//TODO
	room_goto(roomMain);
}