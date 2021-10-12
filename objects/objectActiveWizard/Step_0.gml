/// @description Attack



stepsWaited++;
if (isOffCooldown()) {
	if (tryAttack()) stepsWaited = 0;
}