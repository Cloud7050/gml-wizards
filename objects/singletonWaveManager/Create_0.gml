/// @description Initialise



/* [Instance Variables] */

waves = [];
waveIndex = -1;
waveSpawnedCount = 0;



/* [Methods] */

function getCurrentWave() {
	var clampedIndex = clamp(
		waveIndex,
		0,
		array_length(waves) - 1
	);
	return waves[clampedIndex];
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

function isWavesOver() {
	return waveIndex >= array_length(waves);
}

function tryStartNextWave() {
	waveIndex += 1;
	if (isWavesOver()) return;

	waveSpawnedCount = 0;

	setAlarm(
		getCurrentWave().startingDelay + getUpcomingDelay()
	);
}

function isWaveSpawnedEnough() {
	return waveSpawnedCount >= getCurrentWave().count;
}

function trySpawn() {
	if (!isWaveSpawnedEnough()) {
		waveSpawnedCount++;

		var path = getPath();
		var activeEnemy = instance_create_layer(
			path_get_point_x(path, 0),
			path_get_point_y(path, 0),
			global.C.LAYERS.INSTANCE_ENEMIES,
			objectActiveEnemy
		);
		activeEnemy.initialise(
			getCurrentWave().enemyData
		);

		activeEnemy.followPath(path);
	}

	// Check again
	if (isWaveSpawnedEnough()) tryStartNextWave();
	else {
		// For next enemy spawn
		setAlarm(getUpcomingDelay());
	}
}

function showResults(winState) {
	setWin(winState);
	saveSurface(application_surface);

	room_goto(roomResults);
}