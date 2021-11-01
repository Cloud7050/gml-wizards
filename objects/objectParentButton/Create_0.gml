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
	return isHovering ? c_silver : undefined;
}

function onGetOutlineColour() {}

function onClick() {}



/* [Methods] */

function initialiseParentButton(
	anchor = DRAWING_ANCHORS.CENTRE,

	width,
	height,

	text = "",
	sprite = undefined
) {
	self.anchor = anchor;

	initialiseParentCoordinates(
		width,
		height,
		true
	);

	self.text = text;
	self.sprite = sprite;
}