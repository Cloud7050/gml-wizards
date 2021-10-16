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

	// self due to old global
	self.health = getMaxHealth();
}

function getMaxHealth() {
	return enemyData.health;
}

function followPath(path) {
	path_start(path, enemyData.speed, path_action_stop, false);
}

function takeDamage(damage) {
	self.health -= damage;

	if (self.health <= 0) {
		modifyCoins(enemyData.coins);

		instance_destroy();
	}
}