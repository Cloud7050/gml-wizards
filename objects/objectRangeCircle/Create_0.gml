/// @description Initialise



/* [Instance Variables] */

visible = true;



/* [Methods] */

function initialise(
	radius,
	innerColour,
	outerColour = innerColour
) {
	self.radius = radius;
	self.innerColour = innerColour;
	self.outerColour = outerColour;
}