function onMainStart() {
	// [GameMaker Inits]
	draw_set_circle_precision(64);

	// [Create Menu Buttons]
	var buttonWidth = global.C.BUTTONS.MENU.DIMENSIONS.width;
	var buttonHeight = global.C.BUTTONS.MENU.DIMENSIONS.height;
	var marginX = global.C.MARGINS.X;
	var marginY = global.C.MARGINS.Y;

	var menuButtons = [
		objectPlayButton,
		objectCreditsButton
	];

	var constantX = (room_width / 2) - (buttonWidth / 2);
	var startY = room_height / 2;

	for (var buttonIndex = 0; buttonIndex < array_length(menuButtons); buttonIndex++) {
		var menuButton = instance_create_layer(
			constantX,
			startY + (buttonIndex * (buttonHeight + marginY)),
			global.C.LAYERS.INSTANCE_DISPLAY,
			menuButtons[buttonIndex]
		);
		menuButton.initialise(
			DRAWING_ANCHORS.TOP_LEFT
		);
	}

	// [Music]
	switchMusic(soundMusicMenus);
}

function onMainDrawGUI() {
	drawTitle();
}