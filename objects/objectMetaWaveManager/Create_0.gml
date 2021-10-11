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
}

function trySpawn() {
	var currentWave = waves[waveIndex];
	var waveEnemyCount = currentWave.count;
	if (waveSpawnedCount < waveEnemyCount) {
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

		// Alarm calculation for next attempted enemy spawn
		alarm[0] = max(
			1,
			lerp(
				currentWave.initialFrequency,
				currentWave.finalFrequency,
				waveSpawnedCount / waveEnemyCount
			)
		);
		waveSpawnedCount++;
	}
	//TODO starting of subsequent waves
}