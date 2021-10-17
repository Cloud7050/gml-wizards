/* [Classes] */

function AnimationWrapper() constructor {
	currentAnimation = undefined;
	
	function isAnimating() {
		return currentAnimation != undefined;
	}
	
	function step() {
		if (!isAnimating()) return;
		
		currentAnimation.step();
		if (currentAnimation.isOver()) currentAnimation = undefined;
	}
	
	function startReplacementAnimation(newAnimation) {
		if (isAnimating()) currentAnimation.cancel();
		
		newAnimation.start();
		currentAnimation = newAnimation;
	}
}

enum ANIMATION_PROGRESS_TYPE {
	LINEAR,
	EXPONENTIAL,
	SLOWING
}

function BaseAnimation(
	targetSeconds,
	progressType
) constructor {
	targetSteps = getStepsPerSecond() * targetSeconds;
	self.progressType = progressType;
	
	stepsAnimated = 0;
	
	// [Child]
	function onStart() {}
	
	function onStep(progress) {}
	
	function onCancel() {}
	
	function onEnd() {}
	
	// [Methods]
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
	
	function isOver() {
		return stepsAnimated >= targetSteps;
	}
	
	function start() {
		onStart();
	}
	
	function step() {
		if (progressType == ANIMATION_PROGRESS_TYPE.LINEAR) onStep(getLinearProgress());
		else if (progressType == ANIMATION_PROGRESS_TYPE.EXPONENTIAL) onStep(getExponentialProgress());
		else onStep(getSlowingProgress());

		stepsAnimated++;
		if (isOver()) onEnd();
	}
	
	function cancel() {
		onCancel();
		
		stepsAnimated = targetSteps;
		onEnd();
	}
}

function WizardPlacementAnimation(
	activeWizard
) : BaseAnimation(
	0.33,
	ANIMATION_PROGRESS_TYPE.EXPONENTIAL
) constructor {
	self.activeWizard = activeWizard;

	originalY = activeWizard.y;
	originalOpacity = activeWizard.image_alpha;
	originalXScale = activeWizard.image_xscale;
	originalYScale = activeWizard.image_yscale;

	yOffset = -(activeWizard.sprite_height / 2);

	// [Parent]
	function onStart() {
		matchProgress(0);
	}
	
	function onStep(progress) {
		matchProgress(progress);
	}
	
	function onCancel() {
		matchProgress(1);
	}
	
	// [Methods]
	function matchProgress(progress) {
		var offsetFactor = 1 - progress;
		activeWizard.y = originalY + (offsetFactor * yOffset);
		activeWizard.image_alpha = originalOpacity + (offsetFactor * -0.75);
		
		var scaleOffset = offsetFactor * -0.25;
		activeWizard.image_xscale = originalXScale + scaleOffset;
		activeWizard.image_yscale = originalYScale + scaleOffset;
	}
}

function WizardMergeInAnimation(
	activeWizard,
	ephemeralSacrifice
) : BaseAnimation(
	0.5,
	ANIMATION_PROGRESS_TYPE.EXPONENTIAL
) constructor {
	self.activeWizard = activeWizard;
	
	startX = ephemeralSacrifice.attackX;
	startY = ephemeralSacrifice.attackY;
	sprite = ephemeralSacrifice.getLevelSprite();
	rotation = ephemeralSacrifice.image_angle;
	
	// [Parent]
	function onStart() {
		matchProgress(0);
	}
	
	function onStep(progress) {
		matchProgress(progress);
	}
	
	function onCancel() {
		matchProgress(1);
	}
	
	function onEnd() {
		activeWizard.refreshSprite();
		//TODO trigger next animation via activeWizard
	}
	
	// [Methods]
	function matchProgress(progress) {
		rotation -= 15;
		
		var particleMergingWizard = instance_create_layer(
			lerp(startX, activeWizard.attackX, progress),
			lerp(startY, activeWizard.attackY, progress),
			global.CONSTANTS.LAYERS.INSTANCE_PARTICLES,
			objectParticleMergingWizard
		);
		particleMergingWizard.initialise(
			sprite,
			lerp(1, 0.5, progress),
			rotation
		);
	}
}