/// @description Pay & place wizard



if (
	!isPlacingWizard()
	|| !isEmpty()
) return;

var placingWizardData = getPlacingWizard();
if (trySpendOnWizard(
	placingWizardData.price
)) {
	resetPlacingWizard();
	
	createWizard(placingWizardData);
}