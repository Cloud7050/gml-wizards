/// @description Attack



stepsWaited++;
if (stepsWaited > wizardData.getFireRate(level)) {
	if (tryAttack()) stepsWaited = 0;
}