/// @description Initialise



/* [Parent] */

event_inherited();

function onGetOffsetX() {
	if (anchor == DRAWING_ANCHORS.CENTRE) return width / 2;
	
	if (
		anchor == DRAWING_ANCHORS.TOP_RIGHT
		|| anchor == DRAWING_ANCHORS.BOTTOM_RIGHT
	) return width;
	
	return 0;
}

function onGetOffsetY() {
	if (anchor == DRAWING_ANCHORS.CENTRE) return height / 2;
	
	if (
		anchor == DRAWING_ANCHORS.BOTTOM_LEFT
		|| anchor == DRAWING_ANCHORS.BOTTOM_RIGHT
	) return height;
	
	return 0;
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