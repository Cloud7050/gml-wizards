/// @description Initialise



/* [Child] */

function onGetOffsetX() {
	return sprite_get_xoffset(sprite_index);
}

function onGetOffsetY() {
	return sprite_get_yoffset(sprite_index);
}



/* [Methods] */

function initialiseParentCoordinates(
	width,
	height,
	// Whether to check mouse coordinates in relation to the GUI layer,
	// or just to normal layers dependent on screen resolution & room size
	useGUICoordinates = false
) {
	self.width = width;
	self.height = height;
	self.useGUICoordinates = useGUICoordinates;
}

function getStartX() {
	return x - onGetOffsetX();
}

function getStartY() {
	return y - onGetOffsetY();
}

function getEndX() {
	return getStartX() + width;
}

function getEndY() {
	return getStartY() + height;
}

function getMidX() {
	return mid(getStartX(), getEndX());
}

function getMidY() {
	return mid(getStartY(), getEndY());
}

function isMouseWithin() {
	var mouseX = useGUICoordinates ? device_mouse_x_to_gui(0) : mouse_x;
	var mouseY = useGUICoordinates ? device_mouse_y_to_gui(0) : mouse_y;

	// End checks are < due to integer mouse coords.
	// If mouse is considered at corner of a coord,
	// don't want to count as in multiple adjacent instances at once,
	// unlike point_in_rectangle()
	return (
		mouseX >= getStartX()
		&& mouseX < getEndX()
		&& mouseY >= getStartY()
		&& mouseY < getEndY()
	);
}

function isMouseColliding() {
	// Uses the collision mask of this instance's sprite
	return position_meeting(
		mouse_x,
		mouse_y,
		self
	);
}