function onLevelStart() {
	// [Reset Globals]
	resetLives();
	resetCoins();
	resetPlacingWizard();
	resetPath();

	// [Lay Out Grid Elements]
	var t = objectStart;
	var e = objectEnd;
	var p = objectPath;
	var s = objectSpace;
	//TODO atm there is only a single level's layout
	var levelGrid = [
		[t, p, p, p, p, p],
		[s, s, s, s, s, p],
		[s, s, s, s, s, p],
		[s, s, s, s, s, p],
		[s, s, s, s, s, p],
		[s, s, s, s, s, p],
		[e, p, p, p, p, p]
	];
	var instanceGrid = [];

	var rowCount = array_length(levelGrid);
	// Assuming there will always be at least 1 row
	var columnCount = array_length(levelGrid[0]);

	// Assuming all other elements' sprite dimensions are the same as the space sprite
	var spaceSprite = object_get_sprite(objectSpace);
	var elementWidth = sprite_get_width(spaceSprite);
	var elementHeight = sprite_get_height(spaceSprite);

	var gridWidth = elementWidth * columnCount;
	var gridHeight = elementHeight * rowCount;

	var startX = (room_width / 2) - (gridWidth / 2);
	var startY = (room_height / 2) - (gridHeight / 2);

	// Go in reverse for array allocation optimisation
	for (var rowIndex = rowCount - 1; rowIndex >= 0; rowIndex--) {
		for (var columnIndex = columnCount - 1; columnIndex >= 0; columnIndex--) {
			var currentX = startX + (columnIndex * elementWidth);
			var currentY = startY + (rowIndex * elementHeight);

			var elementInstance = instance_create_layer(
				currentX,
				currentY,
				global.CONSTANTS.LAYERS.INSTANCE_FRAMEWORK,
				levelGrid[rowIndex][columnIndex]
			);
			instanceGrid[rowIndex][columnIndex] = elementInstance;
		}
	}

	// Generate throwaway grid of element positions relevent to pathing.
	// Go in reverse for array allocation optimisation
	var pathingGrid = [];
	var startIndexes = new Indexes(0, 0);
	for (var rowIndex = rowCount - 1; rowIndex >= 0; rowIndex--) {
		for (var columnIndex = columnCount - 1; columnIndex >= 0; columnIndex--) {
			var currentObject = levelGrid[rowIndex][columnIndex];

			if (currentObject == t) startIndexes = new Indexes(rowIndex, columnIndex);

			// true if relevent to pathing, false if not
			pathingGrid[rowIndex][columnIndex] = (
				currentObject == e
				|| currentObject == p
			);
		}
	}

	var navigatingIndexes = startIndexes.clone();
	var path = getPath();
	while (true) {
		// Add coords to path
		var relevantInstance = instanceGrid[navigatingIndexes.rowIndex][navigatingIndexes.columnIndex];
		path_add_point(
			path,
			relevantInstance.getMidX(),
			relevantInstance.getMidY(),
			100
		);

		// Seek out adjacent relevant element position, if any
		var adjacentIndexesArray = [
			navigatingIndexes.right(),
			navigatingIndexes.down(),
			navigatingIndexes.left(),
			navigatingIndexes.up()
		];
		var isElementRelevant;
		for (var indexesIndex = 0; indexesIndex < array_length(adjacentIndexesArray); indexesIndex++) {
			var adjacentIndexes = adjacentIndexesArray[indexesIndex];
			if (checkGridBounds(
				pathingGrid,
				adjacentIndexes
			)) {
				isElementRelevant = pathingGrid[adjacentIndexes.rowIndex][adjacentIndexes.columnIndex];
				if (isElementRelevant) {
					// Ditch navigated element position to not backtrack
					pathingGrid[navigatingIndexes.rowIndex][navigatingIndexes.columnIndex] = false;

					navigatingIndexes = adjacentIndexes;
					break;
				}
			}
		}
		if (isElementRelevant) {
			continue;
		}

		// Break if dead end; found no adjacent relevant element position, navigated till end of path
		break;
	}

	// [Set Off Waves]
	//TODO atm there is only a single level's waves available
	var stepsPerSecond = getStepsPerSecond();
	var levelWaves = [
		new WaveData(
			global.CONSTANTS.ENEMIES.ONE,
			
			45,
			stepsPerSecond * 2,
			stepsPerSecond
		)
	];
	objectMetaWaveManager.startUsingWaves(levelWaves);

	// [Create Wizard Buttons]
	//TODO atm there is only a single level's wizards available
	var levelWizardData = [
		global.CONSTANTS.WIZARDS.ONE,
		global.CONSTANTS.WIZARDS.TWO,
		global.CONSTANTS.WIZARDS.THREE,
		global.CONSTANTS.WIZARDS.FOUR
	];

	var marginX = global.CONSTANTS.UI.MARGIN_X;
	var marginY = global.CONSTANTS.UI.MARGIN_Y;
	var buttonWidth = global.CONSTANTS.UI.WIZARD_BUTTONS.WIDTH;
	var buttonHeight = global.CONSTANTS.UI.WIZARD_BUTTONS.HEIGHT;

	// Draw from bottom up
	var wizardCount = array_length(levelWizardData);
	for (var wizardIndex = wizardCount - 1; wizardIndex >= 0; wizardIndex--) {
		var currentWizardButton = instance_create_layer(
			room_width - marginX - buttonWidth,
			room_height - ((wizardCount - wizardIndex) * (marginY + buttonHeight)),
			global.CONSTANTS.LAYERS.INSTANCE_DISPLAY,
			objectWizardButton
		);
		currentWizardButton.wizardData = levelWizardData[wizardIndex];
	}
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
	
	//FIXME
	drawPath();
}

function onWaveAlarm(waveManager) {
	l("onWaveAlarm");
	waveManager.trySpawn();
}