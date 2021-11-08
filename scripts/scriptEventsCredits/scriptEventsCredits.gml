function onCreditsStart() {
	var backButton = instance_create_layer(
		(room_width / 2) - (buttonWidth / 2),
		room_height - marginY,
		global.CONSTANTS.LAYERS.INSTANCE_DISPLAY,
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

		room_width - (2 * global.CONSTANTS.UI.MARGIN_X),

		undefined,
		global.CONSTANTS.UI.PANEL_OPACITY,
		undefined,

		undefined,
		undefined,

		global.CONSTANTS.UI.CREDITS,
		undefined,
		undefined,
		false
	);
}