/* [Functions] */

function findEnemiesInCircle(
	centreX,
	centreY,
	radius
) {
	var enemiesInRange = [];
	with (objectActiveEnemy) {
		var distance = point_distance(
			centreX,
			centreY,
			getMidX(),
			getMidY()
		);
		if (distance <= radius) {
			array_push(enemiesInRange, self);
		}
	}
	return enemiesInRange;
}