function onStageStart() {
	// [Prepare Globals]
	resetSurfaceBuffer();

	resetPath();

	//resetGrid();

	resetLives();
	//resetCoins();
	resetWin();

	resetPlacingWizard();
	resetSelectedWizard();

	var stageData = getStageData();

	var marginX = global.C.MARGINS.X;
	var marginY = global.C.MARGINS.Y;

	// [Lay Out Grid Elements]
	var referenceSprite = object_get_sprite(objectParentGridElement);
	var elementWidth = sprite_get_width(referenceSprite);
	var elementHeight = sprite_get_height(referenceSprite);

	var stageGrid = stageData.grid;

	var rowCount = array_length(stageGrid);
	var columnCount = rowCount > 0 ? array_length(stageGrid[0]) : 0;

	var startX = (room_width / 2) - ((columnCount * elementWidth) / 2) + sprite_get_xoffset(referenceSprite);
	var startY = (room_height / 2) - ((rowCount * elementHeight) / 2) + sprite_get_yoffset(referenceSprite);

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
				global.C.LAYERS.INSTANCE_FRAMEWORK,
				stageGrid[rowIndex][columnIndex]
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
			var currentObject = stageGrid[rowIndex][columnIndex];

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

	// [Store Waves]
	singletonWaveManager.waves = stageData.waves;

	// [Create Wizard Buttons]
	var displayLayer = global.C.LAYERS.INSTANCE_DISPLAY;
	var buttonWidth = global.C.BUTTONS.WIZARD.DIMENSIONS.width;
	var buttonHeight = global.C.BUTTONS.WIZARD.DIMENSIONS.height;
	var marginX = global.C.MARGINS.X;
	var marginY = global.C.MARGINS.Y;

	var stageWizardData = stageData.wizardsAvailable;
	var wizardCount = array_length(stageWizardData);

	var totalHeight = (wizardCount * buttonHeight) + ((wizardCount - 1) * marginY);

	var constantX = room_width - marginX;
	var startY = (room_height / 2) + (totalHeight / 2);

	// Create from bottom up
	for (var wizardIndex = wizardCount - 1; wizardIndex >= 0; wizardIndex--) {
		var wizardButton = instance_create_layer(
			constantX,
			startY - ((wizardCount - (wizardIndex + 1)) * (buttonHeight + marginY)),
			displayLayer,
			objectWizardButton
		);
		wizardButton.initialise(
			DRAWING_ANCHORS.BOTTOM_RIGHT,

			stageWizardData[wizardIndex]
		);
	}

	// [Set Starting Coins]
	setCoins(
		stageData.startingCoins
	);
	
	// [Create Waves Button]
	buttonWidth = global.C.BUTTONS.WAVES.DIMENSIONS.width;
	buttonHeight = global.C.BUTTONS.WAVES.DIMENSIONS.height;
	
	var wavesButton = instance_create_layer(
		(room_width / 2) - (buttonWidth / 2),
		marginY,
		displayLayer,
		objectWavesButton
	);
	wavesButton.initialise(
		DRAWING_ANCHORS.TOP_LEFT
	);

	// [Create Navigation Buttons]
	buttonWidth = global.C.BUTTONS.NAVIGATION.DIMENSIONS.width;
	buttonHeight = global.C.BUTTONS.NAVIGATION.DIMENSIONS.height;

	var navigationButtons = [
		objectExitButton,
		objectRestartButton
	];

	for (var buttonIndex = 0; buttonIndex < array_length(navigationButtons); buttonIndex++) {
		var navigationButton = instance_create_layer(
			marginX,
			marginY + (buttonIndex * (buttonHeight + marginY)),
			displayLayer,
			navigationButtons[buttonIndex]
		);
		navigationButton.initialise(
			DRAWING_ANCHORS.TOP_LEFT
		);
	}

	// [Music]
	switchMusic(soundMusicStage);
}

function onStageDrawGUI() {
	var marginX = global.C.MARGINS.X;
	var marginY = global.C.MARGINS.Y;
	var opacity = global.C.OPACITIES.PANEL;

	// Stats
	drawSmartTextBox(
		DRAWING_ANCHORS.TOP_RIGHT,
		room_width - marginX,
		marginY,

		room_width / 2,

		undefined,
		opacity,
		undefined,

		undefined,
		undefined,

		joinArray(
			[
				getStageString(),
				"",
				getLivesString(),
				getCoinsString()
			]
		)
	);

	// Instructions
	var instructions = getStageData().instructions;
	if (instructions != undefined) {
		drawSmartTextBox(
			DRAWING_ANCHORS.BOTTOM_LEFT,
			marginX,
			room_height - marginY,

			room_width / 4,

			undefined,
			opacity,
			undefined,

			undefined,
			undefined,

			instructions
		);
	};
}

function onStagePressC() {
	modifyCoins(global.C.WIZARDS.ONE.price);
};

function onStagePressL() {
	modifyLives(global.C.ENEMIES.ONE.impact);
};