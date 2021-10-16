/// @description Initialise



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

function getEndX() {
	return x + width;
}

function getEndY() {
	return y + height;
}

function getMidX() {
	return lerp(x, getEndX(), 0.5);
}

function getMidY() {
	return lerp(y, getEndY(), 0.5);
}

function isMouseWithin() {
	var mouseX = useGUICoordinates ? device_mouse_x_to_gui(0) : device_mouse_x(0);
	var mouseY = useGUICoordinates ? device_mouse_y_to_gui(0) : device_mouse_y(0);

	// End checks are < due to integer mouse coords.
	// If mouse is considered at corner of a coord,
	// don't want to count as in multiple adjacent instances at once,
	// unlike point_in_rectangle()
	return (
		mouseX >= x
		&& mouseX < getEndX()
		&& mouseY >= y
		&& mouseY < getEndY()
	);
}