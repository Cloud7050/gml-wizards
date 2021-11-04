function onDrawResults() {
	// Darkened end surface
	startDrawSurface(application_surface);
	
	draw_clear(c_black);
	draw_surface_ext(
		getSurface(),
		0,
		0,
		1,
		1,
		0,
		c_white,
		0.5
	);
	
	// End draw
	stopDrawSurface();
}

function onDrawResultsGUI() {
	// Game state
	drawSmartTextBox(
		DRAWING_ANCHORS.CENTRE,
		room_width / 2,
		room_height / 4,
		
		room_width / 2,
		
		undefined,
		global.CONSTANTS.UI.PANEL_OPACITY,
		undefined,
		
		undefined,
		undefined,
		
		getWin() ? "VICTORY" : "OVERWHELMED",
		undefined,
		fontTitle
	);
}