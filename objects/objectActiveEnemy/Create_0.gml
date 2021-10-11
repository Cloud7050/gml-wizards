/// @description Initialise



/* [Parent] */
event_inherited();



/* [Methods] */
function initialise(
	enemyData,
	centreX,
	centreY
) {
	self.enemyData = enemyData;
	
	sprite_index = enemyData.sprite;
	initialiseParentCoordinates(
		sprite_width,
		sprite_height
	);
	
	// Correct own coordinates based on sprite
	x = centreX - (width / 2);
	y = centreY - (height / 2);
}

function followPath(path) {
	path_start(path, enemyData.speed, path_action_stop, false);
}

function takeDamage(damage) {
	//TODO
	l(damage);
}