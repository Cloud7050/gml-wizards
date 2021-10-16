/* [Functions] */

function l(any = "====================") {
	show_debug_message(">>> " + string(any));
}

function drawPath() {
	draw_path(getPath(), 0, 0, true);
}