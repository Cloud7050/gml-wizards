function onResultsStart() {
	// [Create Navigation Buttons]
	var buttonWidth = global.CONSTANTS.UI.NAVIGATION_BUTTONS.WIDTH;
	var buttonHeight = global.CONSTANTS.UI.NAVIGATION_BUTTONS.HEIGHT;
	var marginX = global.CONSTANTS.UI.MARGIN_X;
	var marginY = global.CONSTANTS.UI.MARGIN_Y;

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
			global.CONSTANTS.LAYERS.INSTANCE_DISPLAY,
			navigationButtons[buttonIndex]
		);
		navigationButton.initialise(
			DRAWING_ANCHORS.TOP_LEFT
		);
	}
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
		global.CONSTANTS.UI.PANEL_OPACITY,
		undefined,

		undefined,
		undefined,

		getWin()
			? global.CONSTANTS.UI.RESULTS_TEXT.WIN
			: global.CONSTANTS.UI.RESULTS_TEXT.LOSE,
		undefined,
		fontTitle
	);
}