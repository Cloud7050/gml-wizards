/// @description Initialise



/* [Instance Variables] */

animationWrapper = new AnimationWrapper();



/* [Methods] */

function initialise(
	text,
	textColour = undefined
) {
	self.text = text;
	self.textColour = textColour;
	
	animationWrapper.startReplacementAnimation(
		new FloatFadeAnimation(self)
	);
}