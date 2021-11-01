/* [Functions] */

function findEnemiesInCircle(
	centreX,
	centreY,
	radius
) {
	var enemiesInRange = [];
	with (objectActiveEnemy) {
		if (point_in_circle(
			getMidX(),
			getMidY(),
			centreX,
			centreY,
			radius
		)) array_push(enemiesInRange, self);
	}
	return enemiesInRange;
}