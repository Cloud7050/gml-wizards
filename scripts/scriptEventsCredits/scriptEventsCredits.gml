function onCreditsStart() {
	var backButton = instance_create_layer(
		(room_width / 2) - (global.C.BUTTONS.MENU.DIMENSIONS.width / 2),
		room_height - global.C.MARGINS.Y,
		global.C.LAYERS.INSTANCE_DISPLAY,
		objectBackButton
	);
	backButton.initialise(
		DRAWING_ANCHORS.BOTTOM_LEFT
	);
	
	// [Music]
	switchMusic(soundMusicMenu);
}

function onCreditsDrawGUI() {
	drawSmartTextBox(
		DRAWING_ANCHORS.CENTRE,
		room_width / 2,
		room_height / 2,

		room_width - (2 * global.C.MARGINS.X),

		undefined,
		global.C.OPACITIES.PANEL,
		undefined,

		undefined,
		undefined,

		global.C.TEXT.CREDITS,
		undefined,
		undefined,
		false
	);
}