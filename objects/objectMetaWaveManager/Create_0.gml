/// @description Initialise



/* [Instance Variables] */
waves = [];
waveIndex = 0;
waveSpawnedCount = 0;



/* [Methods] */
function getCurrentWave() {
	return waves[waveIndex];
}

function setAlarm(requestedDelay) {
	alarm[0] = max(
		1,
		requestedDelay
	);
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
	
	setAlarm(getCurrentWave().startingDelay);
}

function tryStartNextWave() {
	var nextWaveIndex = waveIndex + 1;
	if (nextWaveIndex < array_length(waves)) {
		startWave(nextWaveIndex);
	}
}

function trySpawn() {
	var currentWave = waves[waveIndex];
	var waveEnemyCount = currentWave.count;
	if (waveSpawnedCount < waveEnemyCount) {
		waveSpawnedCount++;
		
		// Spawn enemy w/ path
		var path = getPath();
		var activeEnemy = instance_create_layer(
			0,
			0,
			global.CONSTANTS.LAYERS.INSTANCE_ENEMIES,
			objectActiveEnemy
		);
		activeEnemy.initialise(
			currentWave.enemyData,
			path_get_point_x(path, 0),
			path_get_point_y(path, 0)
		);

		activeEnemy.followPath(path);

		// Alarm calculation for next attempted enemy spawn
		setAlarm(lerp(
			currentWave.initialFrequency,
			currentWave.finalFrequency,
			waveSpawnedCount / waveEnemyCount
		));
	} else tryStartNextWave();
}