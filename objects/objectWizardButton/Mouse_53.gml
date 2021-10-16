/// @description Toggle placing wizard



if (!isMouseWithin()) return;

if (isPlacingThis()) {
	resetPlacingWizard();
} else {
	// Select / overwrite previous wizard
	setPlacingWizard(wizardData);
}