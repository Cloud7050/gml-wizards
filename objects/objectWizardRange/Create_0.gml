/// @description Initialise



/* [Instance Variables] */

visible = true;



/* [Methods] */

function initialise(
	radius,

	previewSprite = undefined
) {
	self.radius = radius;

	self.previewSprite = previewSprite;
}

function isPreview() {
	return previewSprite != undefined;
}