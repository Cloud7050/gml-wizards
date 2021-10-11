/// @description Initialise



/* [Instance Variables] */
waves = [];
waveIndex = 0;
waveSpawnedCount = 0;



/* [Methods] */
function getCurrentWave() {
	return waves[waveIndex];
}

function startUsingWaves(levelWaves) {
	waves = levelWaves;
	
	// Start first wave.
	// Assuming there will always be at least 1 wave
	startWave(0);
}

function startWave(index) {
	waveIndex = index;
	waveSpawnedCount = 0;
	
	alarm[0] = getCurrentWave().startingDelay + 1;
	l("set alarm");
}

function trySpawn() {
	l("try spawn");
	var currentWave = waves[waveIndex];
	if (waveSpawnedCount < currentWave.count) {
		// Spawn enemy w/ path
		var path = getPath();
		var enemyData = currentWave.enemyData;
		var enemySprite = enemyData.sprite;
		var activeEnemy = instance_create_layer(
			// Assuming there will always be at least 1 point
			path_get_point_x(path, 0) - (sprite_get_width(enemySprite) / 2),
			path_get_point_y(path, 0) - (sprite_get_height(enemySprite) / 2),
			global.CONSTANTS.LAYERS.INSTANCE_ENEMIES,
			objectActiveEnemy
		);
		activeEnemy.setEnemyData(enemyData);
		
		activeEnemy.followPath(path);
		l(currentWave);
		l(enemyData);
		l(activeEnemy);
		
		// Set timer for next attempted enemy spawn
		//TODO calculate and set alarm
		
		//objectMetaBattlefield.alarm[0] = ;
		//onLevelAlarm0();
		//onWaveAlarm(waveManager)
	}
	//TODO starting of subsequent waves
}