/// @description Initialise



/* [Parent] */

event_inherited();



/* [Methods] */

function initialise(
	enemyData
) {
	self.enemyData = enemyData;

	sprite_index = enemyData.sprite;
	// Init after setting sprite
	initialiseParentCoordinates(
		sprite_width,
		sprite_height
	);

	// self due to old global
	self.health = getMaxHealth();
}

function getMaxHealth() {
	return enemyData.health;
}

function getHealthPercentage() {
	return self.health / getMaxHealth() * 100;
}

function followPath(path) {
	path_start(path, enemyData.speed, path_action_stop, true);
}

function takeDamage(damage) {
	self.health -= damage;

	if (self.health <= 0) {
		modifyCoins(enemyData.coins);
		
		playSound(
			soundDie,
			global.C.PRIORITIES.EFFECT
		);
		
		instance_destroy();
	}
}