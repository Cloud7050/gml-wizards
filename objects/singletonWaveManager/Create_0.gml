/// @description Initialise



/* [Instance Variables] */

waves = [];
waveIndex = -1;
waveSpawnedCount = 0;



/* [Methods] */

function getCurrentWave() {
	return waves[waveIndex];
}

function setAlarm(requestedDelay) {
	alarm_set(
		0,
		max(
			1,
			requestedDelay
		)
	);
}

function getUpcomingDelay() {
	var currentWave = getCurrentWave();
	return lerp(
		currentWave.initialFrequency,
		currentWave.finalFrequency,
		// 0 for first upcoming spawn (0 spawned),
		// 1 for last upcoming spawn (count - 1 spawned)
		waveSpawnedCount / max(1, currentWave.count - 1)
	)
}

function startWave(index) {
	waveIndex = index;
	waveSpawnedCount = 0;

	setAlarm(
		getCurrentWave().startingDelay + getUpcomingDelay()
	);
}

function tryStartNextWave() {
	var nextWaveIndex = waveIndex + 1;
	if (nextWaveIndex < array_length(waves)) {
		startWave(nextWaveIndex);
	}
}

function startUsingWaves(stageWaves) {
	waves = stageWaves;

	tryStartNextWave();
}

function isWaveOver() {
	return waveSpawnedCount >= getCurrentWave().count;
}

function trySpawn() {
	if (!isWaveOver()) {
		waveSpawnedCount++;

		var path = getPath();
		var activeEnemy = instance_create_layer(
			path_get_point_x(path, 0),
			path_get_point_y(path, 0),
			global.CONSTANTS.LAYERS.INSTANCE_ENEMIES,
			objectActiveEnemy
		);
		activeEnemy.initialise(
			getCurrentWave().enemyData
		);

		activeEnemy.followPath(path);
	}

	// Check again
	if (isWaveOver()) tryStartNextWave();
	else {
		// For next enemy spawn
		setAlarm(getUpcomingDelay());
	}
}