/// @description Toggle select or merge



if (isThisSelected()) {
	resetSelectedWizard();
} else if (
	// Ensure no rogue merge candidate just in case
	isWizardSelected()
	&& isMergeCandidate
) {
	// Merge in animation
	var selectedWizard = getSelectedWizard();
	animationWrapper.startReplacementAnimation(
		new WizardMergeInAnimation(
			self,
			selectedWizard
		)
	);
	
	// Destroy selected
	selectedWizard.destroy();
	
	// Own level for merge
	setLevel(
		level + 1,
		false
	);
} else {
	// Select / overwrite previous wizard
	setSelectedWizard(self);
}