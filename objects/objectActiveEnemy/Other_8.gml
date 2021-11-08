/// @description Impact



modifyLives(-enemyData.impact);

playSound(
	soundImpact,
	global.C.PRIORITIES.EFFECT
);

instance_destroy();