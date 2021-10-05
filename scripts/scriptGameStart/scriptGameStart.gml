function onGameStart() {
	// Lay out potential wizard spaces
	
	widthCount = 5;
	heightCount = 5;
	
	spaceSprite = object_get_sprite(objectSpace);
	spaceWidth = sprite_get_width(spaceSprite);
	spaceHeight = sprite_get_height(spaceSprite);
	
	spaceMargin = 1;
	
	totalWidth = (spaceWidth * widthCount) + (widthCount - 1) * spaceMargin;
	totalHeight = (spaceHeight * heightCount) + (heightCount - 1) * spaceMargin;
	
	startX = (room_width / 2) - (totalWidth / 2);
	startY = (room_height / 2) - (totalHeight / 2);
	//l(room_width);
	//l(room_height);
	//l(totalWidth);
	//l(totalHeight);
	//l(startX);
	//l(startY);
	
	for (columnIndex = 0; columnIndex < widthCount; columnIndex++) {
		currentX = startX + (columnIndex * spaceWidth) + (columnIndex * spaceMargin);
		//l("X: " + string(currentX));
		
		for (rowIndex = 0; rowIndex < widthCount; rowIndex++) {
			currentY = startY + (rowIndex * spaceHeight) + (rowIndex * spaceMargin);
			//l("Y: " + string(currentY));
			
			instance_create_layer(currentX, currentY, global.CONSTANTS.LAYERS.INSTANCE_FRAMEWORK, objectSpace);
		}
	}
	
	
	
	// Create GUI of wizard purchase buttons
	
	buttonWidth = 128;
	buttonHeight = 128;

	marginX = global.CONSTANTS.UI.MARGIN_X;
	marginY = global.CONSTANTS.UI.MARGIN_Y;
	
	wizardData = global.CONSTANTS.WIZARDS.GREY;
	greyWizardButton = instance_create_layer(
		room_width - marginX - buttonWidth,
		room_height - marginY - buttonHeight,
		global.CONSTANTS.LAYERS.INSTANCE_FRAMEWORK,
		objectWizardButton
	);
	greyWizardButton.buttonWidth = buttonWidth;
	greyWizardButton.buttonHeight = buttonHeight;
	greyWizardButton.wizardData = wizardData;
	
	// The wizard the player is currently trying to place, if any
	global.wizardData = undefined;
	
	// Starting values
	global.lives = 10
	global.coins = 80
}