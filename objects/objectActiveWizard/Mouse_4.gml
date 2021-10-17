/// @description Toggle select or merge



if (isThisSelected()) {
	resetSelectedWizard();
} else if (
	// Ensure no rogue merge candidate just in case
	isWizardSelected()
	&& isMergeCandidate
) {
	// Destroy selected
	getSelectedWizard().destroy();
	
	// Own level for merge
	setLevel(level + 1);
} else {
	// Select / overwrite previous wizard
	setSelectedWizard(self);
}