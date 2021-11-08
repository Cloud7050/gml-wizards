function onMainStart() {
	// [GameMaker Inits]
	draw_set_circle_precision(64);

	// [Create Menu Buttons]
	var displayLayer = global.C.LAYERS.INSTANCE_DISPLAY;
	var buttonWidth = global.C.BUTTONS.MENU.DIMENSIONS.width;

	var playButton = instance_create_layer(
		(room_width / 2) - (buttonWidth / 2),
		room_height / 2,
		displayLayer,
		objectPlayButton
	);
	playButton.initialise(
		DRAWING_ANCHORS.TOP_LEFT
	);

	//TODO credits, loop similar to in-game navigation buttons
}

function onMainDrawGUI() {
	drawTitle();
}