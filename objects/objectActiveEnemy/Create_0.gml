/// @description Initialise



/* [Methods] */
function setEnemyData(enemyData) {
	self.enemyData = enemyData;
	
	sprite_index = enemyData.sprite;
}

function followPath(path) {
	path_start(path, enemyData.speed, path_action_stop, false);
}