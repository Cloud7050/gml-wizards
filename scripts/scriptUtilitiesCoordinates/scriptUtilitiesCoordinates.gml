/// @param {Instance} instance - The instance that has a .x, .y, .getEndX() & .getEndY()
/// @param {boolean} [isGUI=false] - Whether to check mouse coordinates in relation to the GUI layer, or just to normal layers dependent on screen resolution & room size
/// @returns Whether the mouse is positioned in the instance
function mouseInInstance(instance, isGUI = false) {
	var mouseX = isGUI ? device_mouse_x_to_gui(0) : device_mouse_x(0);
	var mouseY = isGUI ? device_mouse_y_to_gui(0) : device_mouse_y(0);
	
	var startX = instance.x;
	var startY = instance.y;
	
	var endX = instance.getEndX();
	var endY = instance.getEndY();
	
	// End checks are < due to integer mouse coords.
	// If mouse is considered at corner of a coord,
	// don't want to count as in multiple adjacent instances at once,
	// unlike point_in_rectangle()
	return (
		mouseX >= startX
		&& mouseX < endX
		&& mouseY >= startY
		&& mouseY < endY
	);
}