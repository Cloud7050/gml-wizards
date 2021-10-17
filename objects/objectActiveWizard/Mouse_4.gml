/// @description Toggle select or merge



if (isThisSelected()) {
	resetSelectedWizard();
	return;
} else if (
	// Ensure no rogue merge candidate just in case
	isWizardSelected()
	&& isMergeCandidate
) {
	// Destroy selected
	getSelectedWizard().space.destroyActiveWizard();
	
	// Own level for merge
	setLevel(level + 1);
} else {
	// Select / overwrite previous wizard
	setSelectedWizard(self);
}