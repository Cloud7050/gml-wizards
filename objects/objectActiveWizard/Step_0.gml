/// @description Attack



cooldown--;
if (cooldown <= 0) {
	if (tryAttack()) cooldown = wizardData.fireRate;
}