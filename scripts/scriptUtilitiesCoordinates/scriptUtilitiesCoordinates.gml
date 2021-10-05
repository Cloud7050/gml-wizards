function mouseWithinInstance(instanceWithMethods) {
	var mouseX = device_mouse_x_to_gui(0);
	var mouseY = device_mouse_y_to_gui(0);
	return point_in_rectangle(
		mouseX,
		mouseY,
		instanceWithMethods.x,
		instanceWithMethods.y,
		instanceWithMethods.getEndX(),
		instanceWithMethods.getEndY()
	);
}