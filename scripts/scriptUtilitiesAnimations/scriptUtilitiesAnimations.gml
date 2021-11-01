/* [Classes] */

function AnimationWrapper() constructor {
	currentAnimation = undefined;

	function isAnimating() {
		return currentAnimation != undefined;
	}

	// Objects using an AnimationWrapper instance are in charge of stepping it during the game's step event
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

function BaseAnimation(
	targetSeconds,
	progressType
) constructor {
	targetSteps = getStepsPerSecond() * targetSeconds;
	self.progressType = progressType;

	stepsAnimated = 0;

	// [Child]
	// Triggered once at the start of this animation.
	// • Manual call to start()
	// • By passing this into an AnimationWrapper
	function onStart() {}

	// Triggered every step of this animation.
	// • Manual call to step() when appropriate (during the game's step event if this isn't over)
	// • By its AnimationWrapper getting stepped while this is animating
	// Fires in the same step as its start event if not started during the game's step event.
	// Fires a number of times matching its targeted step count.
	function onStep(progress) {}

	// Triggered once if this animation ends prematurely.
	// • Manual call to cancel()
	// • By another animation getting passed into its AnimationWrapper while this is still animating
	// Provides a progress from 0-1 scaled based on its animation progress type.
	function onCancel() {}

	// Triggered once at the end of this animation.
	// • After its last step event
	// • After its cancellation event
	// Fires in the same step after the event that caused this animation's end.
	function onEnd() {}

	// Triggered once after this animation has been forgotten by its AnimationWrapper,
	// due to having ended via last step (not via cancellation).
	// • By its AnimationWrapper after this animation's end
	// Safe to pass a new animation into its AnimationWrapper during this event.
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
		if (progressType == ANIMATION_PROGRESS_TYPES.LINEAR) onStep(getLinearProgress());
		else if (progressType == ANIMATION_PROGRESS_TYPES.EXPONENTIAL) onStep(getExponentialProgress());
		else onStep(getSlowingProgress());

		stepsAnimated++;
		if (isOver()) onEnd();
	}

	function cancel() {
		onCancel();
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
	ANIMATION_PROGRESS_TYPES.EXPONENTIAL
) constructor {
	self.activeWizard = activeWizard;

	endY = activeWizard.y;
	endOpacity = activeWizard.image_alpha;
	endXScale = activeWizard.image_xscale;
	endYScale = activeWizard.image_yscale;

	startY = endY - (activeWizard.sprite_height / 2);
	startOpacity = endOpacity * 0.25;
	startXScale = endXScale * 0.75;
	startYScale = endYScale * 0.75;

	// [Parent]
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
		//FIXME progress is overshooting
	}
}

function WizardMergeInAnimation(
	activeWizard,
	ephemeralSacrifice
) : BaseAnimation(
	0.5,
	ANIMATION_PROGRESS_TYPES.EXPONENTIAL
) constructor {
	self.activeWizard = activeWizard;

	sprite = ephemeralSacrifice.getLevelSprite();

	startX = ephemeralSacrifice.attackX;
	startY = ephemeralSacrifice.attackY;
	startXScale = activeWizard.image_xscale;
	startYScale = activeWizard.image_yscale;
	startRotation = ephemeralSacrifice.image_angle;

	endX = activeWizard.attackX;
	endY = activeWizard.attackY;
	endXScale = 0.5;
	endYScale = 0.5;
	endRotation = startRotation - (5 * 360);

	// [Parent]
	function onStep(progress) {
		var flashMergeWizard = instance_create_layer(
			lerp(startX, endX, progress),
			lerp(startY, endY, progress),
			global.CONSTANTS.LAYERS.INSTANCE_PARTICLES,
			objectFlashMergeWizard
		);
		flashMergeWizard.initialise(
			sprite,

			lerp(startXScale, endXScale, progress),
			lerp(startYScale, endYScale, progress),
			lerp(startRotation, endRotation, progress)
		);
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
}

function WizardUpgradeAnimation(
	activeWizard
) : BaseAnimation(
	1,
	ANIMATION_PROGRESS_TYPES.SLOWING
) constructor {
	sprite = activeWizard.getLevelSprite();
	constantX = activeWizard.attackX;

	startY = activeWizard.attackY;
	startOpacity = activeWizard.image_alpha;
	startXScale = activeWizard.image_xscale;
	startYScale = activeWizard.image_yscale;

	endY = startY - (activeWizard.sprite_height / 2);
	endOpacity = 0;
	endXScale = 2;
	endYScale = 2;

	// [Parent]
	function onStep(progress) {
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



/* [Enums] */

enum ANIMATION_PROGRESS_TYPES {
	LINEAR,
	EXPONENTIAL,
	SLOWING
}