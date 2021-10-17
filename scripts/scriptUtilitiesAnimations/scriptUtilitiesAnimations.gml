/* [Classes] */

function BaseAnimation(targetSeconds) constructor {
	stepsAnimated = 0;
	targetSteps = getStepsPerSecond() * targetSeconds;
	
	function flipProgress(progress) {
		return 1 - progress;
	}
	
	function powerProgress(
		progress,
		exponent = 3
	) {
		return power(progress, exponent);
	}
	
	function getLinearProgress() {
		return stepsAnimated / max(1, targetSteps - 1);
	}
	
	function getExponentialProgress() {
		return powerProgress(getLinearProgress());
	}
	
	function getSlowingProgress() {
		// Want to flip it from back to front,
		// which in this case is the same as flipping it upside down
		var backwardsLinearProgress = flipProgress(getLinearProgress());
		
		// Convert back-to-front linear progress to back-to-front exponential.
		// Starts complete and rapidly drops
		var backwardsExponentialProgress = powerProgress(backwardsLinearProgress);
		
		// Flip back-to-front exponential progress.
		// Starts empty with decreasing acceleration
		return flipProgress(backwardsExponentialProgress);
	}
	
	function forceOver() {
		stepsAnimated = targetSeconds;
	}
	
	function incrementProgress() {
		stepsAnimated++;
	}
	
	function isOver() {
		return stepsAnimated >= targetSteps;
	}
	
	function start() {}
	
	function step() {
		if (!isOver()) incrementProgress();
	}
	
	function cancel() {
		forceOver();
	}
}

function WizardPlacementAnimation(
	activeWizard
) : BaseAnimation(
	0.33
) constructor {
	self.activeWizard = activeWizard;

	originalY = activeWizard.y;
	originalOpacity = activeWizard.image_alpha;
	originalXScale = activeWizard.image_xscale;
	originalYScale = activeWizard.image_yscale;

	yOffset = -(activeWizard.sprite_height / 2);
	opacityOffset = -0.75;
	xScaleOffset = -0.25;
	yScaleOffset = -0.25;

	function matchAnimationProgress(progress) {
		var offsetFactor = 1 - progress;

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

		matchAnimationProgress(getExponentialProgress());

		incrementProgress();
	}
	
	function cancel() {
		matchAnimationProgress(1);
		
		forceOver();
	}
}