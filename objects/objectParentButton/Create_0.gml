/// @description Initialise



/* [Parent] */

event_inherited();



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
	// Take current coords as anchor coords,
	// adjust to top left for parent methods
	if (anchor == DRAWING_ANCHORS.CENTRE) {
		x -= width / 2;
		y -= height / 2;
	} else {
		if (
			anchor == DRAWING_ANCHORS.TOP_RIGHT
			|| anchor == DRAWING_ANCHORS.BOTTOM_RIGHT
		) x -= width;
		if (
			anchor == DRAWING_ANCHORS.BOTTOM_LEFT
			|| anchor == DRAWING_ANCHORS.BOTTOM_RIGHT
		) y -= height;
	}

	initialiseParentCoordinates(
		width,
		height,
		true
	);

	self.text = text;
	self.sprite = sprite;
}