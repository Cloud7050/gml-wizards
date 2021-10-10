/// @description Button click action



if (!isMouseWithin()) return;

if (isPlacingThis()) {
	resetPlacingWizard();
} else {
	// Select / overwrite previous wizard
	setPlacingWizard(wizardData);
}