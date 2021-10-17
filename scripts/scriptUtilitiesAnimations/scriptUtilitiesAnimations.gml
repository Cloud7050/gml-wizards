function WizardPlacementAnimation(
	activeWizard
) constructor {
	self.activeWizard = activeWizard;

	stepsAnimated = 0;
	targetSteps = getStepsPerSecond() / 3;

	originalY = activeWizard.y;
	originalOpacity = activeWizard.image_alpha;
	originalXScale = activeWizard.image_xscale;
	originalYScale = activeWizard.image_yscale;

	yOffset = -(activeWizard.sprite_height / 2);
	opacityOffset = -0.75;
	xScaleOffset = -0.25;
	yScaleOffset = -0.25;

	function isOver() {
		return stepsAnimated >= targetSteps;
	}

	function matchAnimationProgress(exponentialProgress) {
		var offsetFactor = 1 - exponentialProgress;

		activeWizard.y = originalY + (offsetFactor * yOffset);
		activeWizard.image_alpha = originalOpacity + (offsetFactor * opacityOffset);
		activeWizard.image_xscale = originalXScale + (offsetFactor * xScaleOffset);
		activeWizard.image_yscale = originalYScale + (offsetFactor * yScaleOffset);
	}

	function start() {
		matchAnimationProgress(0);
	}

	function step() {
		if (isOver()) return;

		// Animate exponentially
		var linearProgress = stepsAnimated / max(1, targetSteps - 1);
		var exponentialProgress = power(linearProgress, 2);
		matchAnimationProgress(exponentialProgress);

		stepsAnimated += 1;
	}
}