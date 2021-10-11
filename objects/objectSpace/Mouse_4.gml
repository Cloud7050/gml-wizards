/// @description Pay & place wizard



if (
	!isPlacingWizard()
	|| !isEmpty()
) return;

var placingWizardData = getPlacingWizard();
if (trySpend(
	placingWizardData.price
)) {
	resetPlacingWizard();

	newActiveWizard(placingWizardData);
}