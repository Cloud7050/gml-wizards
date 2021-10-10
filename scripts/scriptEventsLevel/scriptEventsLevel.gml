function onLevelStart() {
	// Reset globals
	resetLives();
	resetCoins();
	resetPlacingWizard();

	// Lay out grid elements
	var t = objectStart;
	var e = objectEnd;
	var p = objectPath;
	var s = objectSpace;
	//TODO atm there is only a single level's layout
	var gridRepresentation = [
		[t, p, p, p, p, p],
		[s, s, s, s, s, p],
		[s, s, s, s, s, p],
		[s, s, s, s, s, p],
		[s, s, s, s, s, p],
		[s, s, s, s, s, p],
		[e, p, p, p, p, p]
	];
	
	var rowCount = array_length(gridRepresentation);
	// Assuming there will always be at least one row
	var columnCount = array_length(gridRepresentation[0]);
	
	// Assuming all other elements' sprite dimensions are the same as the space sprite
	var spaceSprite = object_get_sprite(objectSpace);
	var elementWidth = sprite_get_width(spaceSprite);
	var elementHeight = sprite_get_height(spaceSprite);

	var gridWidth = elementWidth * columnCount;
	var gridHeight = elementHeight * rowCount;

	var startX = (room_width / 2) - (gridWidth / 2);
	var startY = (room_height / 2) - (gridHeight / 2);

	for (var columnIndex = 0; columnIndex < columnCount; columnIndex++) {
		var currentX = startX + (columnIndex * elementWidth);

		for (var rowIndex = 0; rowIndex < rowCount; rowIndex++) {
			var currentY = startY + (rowIndex * elementHeight);

			instance_create_layer(
				currentX,
				currentY,
				global.CONSTANTS.LAYERS.INSTANCE_FRAMEWORK,
				gridRepresentation[rowIndex][columnIndex]
			);
		}
	}

	// Create GUI of wizard purchase buttons
	var marginX = global.CONSTANTS.UI.MARGIN_X;
	var marginY = global.CONSTANTS.UI.MARGIN_Y;
	var buttonWidth = global.CONSTANTS.UI.WIZARD_BUTTONS.WIDTH;
	var buttonHeight = global.CONSTANTS.UI.WIZARD_BUTTONS.HEIGHT;

	//TODO flesh out button generation based on all data in CONSTANTS
	var wizard1Button = instance_create_layer(
		room_width - marginX - buttonWidth,
		room_height - marginY - buttonHeight,
		global.CONSTANTS.LAYERS.INSTANCE_DISPLAY,
		objectWizardButton
	);
	wizard1Button.wizardData = global.CONSTANTS.WIZARDS.ONE;
}

function onDrawLevelGUI() {
	var statText = "Lives: " + string(getLives())
		+ "\nCoins: $" + string(getCoins());

	var marginX = global.CONSTANTS.UI.MARGIN_X;
	var marginY = global.CONSTANTS.UI.MARGIN_Y;

	var endX = room_width - marginX;
	var startY = marginY;
	
	// Assuming drawTextBox() always uses this default font,
	// set it now to calculate string width/height
	draw_set_font(fontGUI);
	drawTextBox(
		endX - marginX - string_width(statText) - marginX,
		startY,
		endX,
		startY + marginY + string_height(statText) + marginY,
		undefined,
		0.5,
		undefined,
		statText,
		undefined,
		undefined,
		false
	);
}