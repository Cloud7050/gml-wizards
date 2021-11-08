function onResultsStart() {
	// [Create Navigation Buttons]
	var buttonWidth = global.C.BUTTONS.NAVIGATION.DIMENSIONS.width;
	var buttonHeight = global.C.BUTTONS.NAVIGATION.DIMENSIONS.height;
	var marginX = global.C.MARGINS.X;
	var marginY = global.C.MARGINS.Y;

	var navigationButtons = [
		objectExitButton,
		objectRestartButton
	];
	if (isNextStageable()) array_push(navigationButtons, objectNextButton);
	var buttonCount = array_length(navigationButtons);

	var totalWidth = (buttonCount * buttonWidth) + ((buttonCount - 1) * marginX);

	var startX = (room_width / 2) - (totalWidth / 2);
	var constantY = room_height / 2;

	for (var buttonIndex = 0; buttonIndex < array_length(navigationButtons); buttonIndex++) {
		var navigationButton = instance_create_layer(
			startX + (buttonIndex * (buttonWidth + marginX)),
			constantY,
			global.C.LAYERS.INSTANCE_DISPLAY,
			navigationButtons[buttonIndex]
		);
		navigationButton.initialise(
			DRAWING_ANCHORS.TOP_LEFT
		);
	}
	
	// [Sound]
	playSound(
		getWin() ? soundWin : soundLose,
		global.C.PRIORITIES.EFFECT
	);
}

function onResultsDraw() {
	// Darkened end surface
	startDrawSurface(application_surface);

	draw_clear(c_black);
	draw_surface_ext(
		makeSurface(),
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

function onResultsDrawGUI() {
	// Game state
	drawSmartTextBox(
		DRAWING_ANCHORS.CENTRE,
		room_width / 2,
		room_height / 4,

		room_width / 2,

		undefined,
		global.C.OPACITIES.PANEL,
		undefined,

		undefined,
		undefined,

		getWin()
			? global.C.TEXT.RESULTS.WIN
			: global.C.TEXT.RESULTS.LOSE,
		undefined,
		fontTitle
	);
}