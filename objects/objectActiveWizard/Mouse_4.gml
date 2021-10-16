/// @description Toggle select



if (isThisSelected()) {
	resetSelectedWizard();
} else {
	// Select / overwrite previous wizard
	setSelectedWizard(self);
}