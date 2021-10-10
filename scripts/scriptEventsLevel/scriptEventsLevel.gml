function onLevelStart() {
	// Reset globals
	resetLives();
	resetCoins();
	resetPlacingWizard();
	
	// Lay out potential wizard spaces
	
	//TODO flesh out grid generation for levels
	var widthCount = 5;
	var heightCount = widthCount;
	
	var spaceObject = objectSpace;
	var spaceSprite = object_get_sprite(spaceObject);
	var spaceWidth = sprite_get_width(spaceSprite);
	var spaceHeight = sprite_get_height(spaceSprite);
	
	var totalWidth = spaceWidth * widthCount;
	var totalHeight = spaceHeight * heightCount;
	
	var startX = (room_width / 2) - (totalWidth / 2);
	var startY = (room_height / 2) - (totalHeight / 2);
	
	for (var columnIndex = 0; columnIndex < widthCount; columnIndex++) {
		var currentX = startX + (columnIndex * spaceWidth);
		
		for (var rowIndex = 0; rowIndex < widthCount; rowIndex++) {
			var currentY = startY + (rowIndex * spaceHeight);
			
			instance_create_layer(
				currentX,
				currentY,
				global.CONSTANTS.LAYERS.INSTANCE_FRAMEWORK,
				spaceObject
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
		global.CONSTANTS.LAYERS.INSTANCE_META,
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