/// @returns {string} The debug logged message
function l(any = "====================") {
	var combined_message = ">>> " + string(any);
	show_debug_message(combined_message);
	return combined_message;
}

function drawPath() {
	draw_path(getPath(), 0, 0, true);
}