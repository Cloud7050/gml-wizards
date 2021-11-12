/// @description Initialise



/* [Parent] */

event_inherited();

function onGetOffsetX() {
	return -anchorStartX(anchor, 0, width);
}

function onGetOffsetY() {
	return -anchorStartY(anchor, 0, height);
}



/* [Child] */

function onGetBackgroundColour(isHovering) {
	return isHovering
		? global.C.COLOURS.BACKGROUND_HOVER
		: undefined;
}

function onGetOutlineColour() {}

function onGetTextColour() {}

function onClick() {}



/* [Methods] */

function initialiseParentButton(
	anchor = DRAWING_ANCHORS.CENTRE,

	dimensions,

	text = "",
	sprite = undefined
) {
	self.anchor = anchor;

	initialiseParentCoordinates(
		dimensions.width,
		dimensions.height,
		true
	);

	self.text = text;
	self.sprite = sprite;
}