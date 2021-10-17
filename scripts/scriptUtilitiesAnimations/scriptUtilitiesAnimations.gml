/* [Classes] */

function AnimationWrapper() constructor {
	currentAnimation = undefined;

	function isAnimating() {
		return currentAnimation != undefined;
	}

	function step() {
		if (!isAnimating()) return;

		currentAnimation.step();
		if (currentAnimation.isOver()) {
			var oldAnimation = currentAnimation;
			currentAnimation = undefined;
			oldAnimation.discard();
		}
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

	function onDiscard() {}

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

	function discard() {
		onDiscard();
	}
}

function WizardPlacementAnimation(
	activeWizard
) : BaseAnimation(
	0.33,
	ANIMATION_PROGRESS_TYPE.EXPONENTIAL
) constructor {
	self.activeWizard = activeWizard;

	endY = activeWizard.y;
	endOpacity = activeWizard.image_alpha;
	endXScale = activeWizard.image_xscale;
	endYScale = activeWizard.image_yscale;

	startY = endY - (activeWizard.sprite_height / 2);
	startOpacity = endOpacity * 0.25;
	var scaleFactor = 0.75;
	startXScale = endXScale * scaleFactor;
	startYScale = endYScale * scaleFactor;

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
		activeWizard.y = lerp(startY, endY, progress);
		activeWizard.image_alpha = lerp(startOpacity, endOpacity, progress);
		activeWizard.image_xscale = lerp(startXScale, endXScale, progress);
		activeWizard.image_yscale = lerp(startYScale, endYScale, progress);
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

	sprite = ephemeralSacrifice.getLevelSprite();
	rotation = ephemeralSacrifice.image_angle;

	startX = ephemeralSacrifice.attackX;
	startY = ephemeralSacrifice.attackY;
	startXScale = activeWizard.image_xscale;
	startYScale = activeWizard.image_yscale;
	
	endX = activeWizard.attackX;
	endY = activeWizard.attackY;
	var scale = 0.5;
	endXScale = scale;
	endYScale = scale;

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
	}

	function onDiscard() {
		activeWizard.animationWrapper.startReplacementAnimation(
			new WizardUpgradeAnimation(
				activeWizard
			)
		);
	}

	// [Methods]
	function matchProgress(progress) {
		rotation -= 15;

		var flashMergeWizard = instance_create_layer(
			lerp(startX, endX, progress),
			lerp(startY, endY, progress),
			global.CONSTANTS.LAYERS.INSTANCE_PARTICLES,
			objectFlashMergeWizard
		);
		flashMergeWizard.initialise(
			sprite,
			rotation,
			
			lerp(startXScale, endXScale, progress),
			lerp(startYScale, endYScale, progress)
		);
	}
}

function WizardUpgradeAnimation(
	activeWizard
) : BaseAnimation(
	1,
	ANIMATION_PROGRESS_TYPE.SLOWING
) constructor {
	sprite = activeWizard.getLevelSprite();
	
	constantX = activeWizard.attackX;
	
	startY = activeWizard.attackY;
	startOpacity = activeWizard.image_alpha;
	startXScale = activeWizard.image_xscale;
	startYScale = activeWizard.image_yscale;
	
	endY = startY - (activeWizard.sprite_height / 2);
	endOpacity = 0;
	var scale = 2;
	endXScale = scale;
	endYScale = scale;

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
		var flashUpgradeWizard = instance_create_layer(
			constantX,
			lerp(startY, endY, progress),
			global.CONSTANTS.LAYERS.INSTANCE_PARTICLES,
			objectFlashUpgradeWizard
		);
		flashUpgradeWizard.initialise(
			sprite,
			
			lerp(startOpacity, endOpacity, progress),
			lerp(startXScale, endXScale, progress),
			lerp(startYScale, endYScale, progress)
		);
	}
}