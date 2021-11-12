/// @description Toggle select or merge



if (isThisSelected()) resetSelectedWizard();
else if (
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
	
	// Sound
	playSound(
		soundMerge,
		global.C.PRIORITIES.EFFECT
	);
} else {
	// Select / overwrite previous wizard
	setSelectedWizard(self);

	if (isMaxLevel()) {
		var particleText = instance_create_layer(
			mouse_x,
			mouse_y,
			global.C.LAYERS.INSTANCE_DISPLAY,
			objectParticleText
		);
		particleText.initialise(
			global.C.TEXT.PARTICLES.MAX_LEVEL
		);
	}
}

playSound(
	soundSelection,
	global.C.PRIORITIES.EFFECT
);