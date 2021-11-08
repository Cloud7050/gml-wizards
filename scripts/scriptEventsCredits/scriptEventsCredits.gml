function onCreditsStart() {
	var backButton = instance_create_layer(
		(room_width / 2) - (buttonWidth / 2),
		room_height - marginY,
		global.C.LAYERS.INSTANCE_DISPLAY,
		objectBackButton
	);
	backButton.initialise(
		DRAWING_ANCHORS.BOTTOM_LEFT
	);
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