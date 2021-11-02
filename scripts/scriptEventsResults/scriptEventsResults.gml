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