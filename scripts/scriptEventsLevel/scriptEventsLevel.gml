function onLevelStart() {
	// [Prepare Globals]
	resetLives();
	resetCoins();

	resetHints();

	resetPath();

	//resetGrid();

	resetPlacingWizard();
	resetSelectedWizard();

	//TODO dynamic read
	var levelData = global.CONSTANTS.LEVELS.ONE;

	// [Lay Out Grid Elements]
	var levelGrid = levelData.grid;

	var rowCount = array_length(levelGrid);
	var columnCount = rowCount > 0 ? array_length(levelGrid[0]) : 0;

	var referenceSprite = object_get_sprite(objectParentGridElement);
	var elementWidth = sprite_get_width(referenceSprite);
	var elementHeight = sprite_get_height(referenceSprite);

	var startX = global.CONSTANTS.UI.MARGIN_X + sprite_get_xoffset(referenceSprite);
	var startY = room_height - global.CONSTANTS.UI.MARGIN_Y - (rowCount * elementHeight) + sprite_get_yoffset(referenceSprite);

	var instancesGrid = resetGrid();

	for (var rowIndex = 0; rowIndex < rowCount; rowIndex++) {
		// Passed by weird reference from function,
		// cannot get and set out of bounds regardless of use of @,
		// so use array functions
		var row = [];
		array_push(instancesGrid, row);

		for (var columnIndex = 0; columnIndex < columnCount; columnIndex++) {
			var currentX = startX + (columnIndex * elementWidth);
			var currentY = startY + (rowIndex * elementHeight);

			var gridElement = instance_create_layer(
				currentX,
				currentY,
				global.CONSTANTS.LAYERS.INSTANCE_FRAMEWORK,
				levelGrid[rowIndex][columnIndex]
			);
			gridElement.initialise(
				new Indexes(
					rowIndex,
					columnIndex
				)
			);

			array_push(row, gridElement);
		}
	}

	// Throwaway grid of element positions relevent to pathing
	var pathingGrid = [[]];
	var startIndexes = new Indexes(0, 0);
	for (var rowIndex = rowCount - 1; rowIndex >= 0; rowIndex--) {
		for (var columnIndex = columnCount - 1; columnIndex >= 0; columnIndex--) {
			var currentObject = levelGrid[rowIndex][columnIndex];

			if (currentObject == objectStart) startIndexes = new Indexes(
				rowIndex,
				columnIndex
			);

			// true if relevent to pathing, false if not
			pathingGrid[rowIndex][columnIndex] = (
				currentObject == objectPath
				|| currentObject == objectEnd
			);
		}
	}

	var currentIndexes = startIndexes;
	var path = getPath();
	while (true) {
		// Add coords to path
		var currentElement = getGridElement(currentIndexes);
		path_add_point(
			path,
			currentElement.getMidX(),
			currentElement.getMidY(),
			100
		);

		// Find adjacent relevant element, if any
		var allAdjacentIndexes = [
			currentIndexes.right(),
			currentIndexes.down(),
			currentIndexes.left(),
			currentIndexes.up()
		];
		var isElementRelevant;
		for (var index = 0; index < array_length(allAdjacentIndexes); index++) {
			var adjacentIndexes = allAdjacentIndexes[index];
			if (!checkGridBounds(
				pathingGrid,
				adjacentIndexes
			)) continue;

			isElementRelevant = pathingGrid[adjacentIndexes.row][adjacentIndexes.column];
			if (!isElementRelevant) continue;

			// If found relevant element, unmark current as relevant to not backtrack
			pathingGrid[currentIndexes.row][currentIndexes.column] = false;

			currentIndexes = adjacentIndexes;
			break;
		}

		// Finding nothing relevant means reached end of path, stop finding
		if (!isElementRelevant) break;
	}

	// [Set Off Waves]
	singletonWaveManager.startUsingWaves(
		levelData.waveContents
	);

	// [Create Wizard Buttons]
	var levelWizardData = levelData.wizardsAvailable;

	// Create from bottom up
	var wizardCount = array_length(levelWizardData);
	for (var wizardIndex = wizardCount - 1; wizardIndex >= 0; wizardIndex--) {
		var wizardButton = instance_create_layer(
			room_width - (global.CONSTANTS.UI.MARGIN_X + global.CONSTANTS.UI.WIZARD_BUTTONS.WIDTH),
			room_height - ((wizardCount - wizardIndex) * (global.CONSTANTS.UI.MARGIN_Y + global.CONSTANTS.UI.WIZARD_BUTTONS.HEIGHT)),
			global.CONSTANTS.LAYERS.INSTANCE_DISPLAY,
			objectWizardButton
		);
		wizardButton.initialise(levelWizardData[wizardIndex]);
	}
}

function onDrawLevelGUI() {
	var marginX = global.CONSTANTS.UI.MARGIN_X;
	var marginY = global.CONSTANTS.UI.MARGIN_Y;
	var opacity = global.CONSTANTS.UI.PANEL_OPACITY;

	// Stats
	drawSmartTextBox(
		room_width - marginX,
		marginY,
		SMART_TEXTBOX_ANCHORS.TOP_RIGHT,

		undefined,
		opacity,
		undefined,

		"Lives: " + string(getLives())
			+ "\nCoins: $" + string(getCoins())
	);

	// Hints
	if (isAnyHints()) {
		drawSmartTextBox(
			marginX,
			marginY,
			SMART_TEXTBOX_ANCHORS.TOP_LEFT,

			undefined,
			opacity,
			undefined,

			getHintsString()
		);

		resetHints();
	}
}

function onWaveAlarm(waveManager) {
	waveManager.trySpawn();
}