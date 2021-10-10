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
	// [Stats]
	
	// Draw background
	
	var marginX = global.CONSTANTS.UI.MARGIN_X;
	var marginY = global.CONSTANTS.UI.MARGIN_Y;
	var statsWidth = global.CONSTANTS.UI.STATS.WIDTH;
	var statsHeight = global.CONSTANTS.UI.STATS.HEIGHT;
	
	var endX = room_width - marginX;
	var startX = endX - statsWidth;
	// Left align
	var textX = startX + (statsWidth / 10);
	
	var startY = marginY;
	var endY = startY + statsHeight;
	// Middle align
	var textY = startY + (statsHeight / 2);

	draw_set_color(c_white);
	draw_rectangle(
		startX,
		startY,
		endX,
		endY,
		false
	);
	
	// Draw text
	
	draw_set_color(c_black);
	draw_set_font(fontGUI);
	draw_set_halign(fa_left);
	draw_set_valign(fa_middle);
	draw_text(
		textX,
		textY,
		"Coins: $" + string(getCoins())
	);
}