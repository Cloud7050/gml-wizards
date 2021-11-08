function onStagesStart() {
	// [Prepare Globals]
	resetStage();

	// [Create Stage Buttons]
	var displayLayer = global.C.LAYERS.INSTANCE_DISPLAY;
	var stageData = global.C.STAGES;
	var buttonWidth = global.C.BUTTONS.MENU.DIMENSIONS.width;
	var buttonHeight = global.C.BUTTONS.MENU.DIMENSIONS.height;
	var marginX = global.C.MARGINS.X;
	var marginY = global.C.MARGINS.Y;

	var stageCount = array_length(stageData);

	var totalWidth = (stageCount * buttonWidth) + ((stageCount - 1) * marginX);

	var startX = (room_width / 2) - (totalWidth / 2);
	var constantY = room_height / 2;

	for (var stageIndex = 0; stageIndex < array_length(stageData); stageIndex++) {
		var stageButton = instance_create_layer(
			startX + (stageIndex * (buttonWidth + marginX)),
			constantY,
			displayLayer,
			objectStageButton
		);
		stageButton.initialise(
			DRAWING_ANCHORS.TOP_LEFT,

			stageIndex
		);
	}

	var backButton = instance_create_layer(
		(room_width / 2) - (buttonWidth / 2),
		room_height - marginY,
		displayLayer,
		objectBackButton
	);
	backButton.initialise(
		DRAWING_ANCHORS.BOTTOM_LEFT
	);

	// [Music]
	switchMusic(soundMusicMenus);
}

function onStagesDrawGUI() {
	drawTitle();
}