function onStagesStart() {
	// [Prepare Globals]
	resetStage();

	// [Create Stage Buttons]
	var displayLayer = global.CONSTANTS.LAYERS.INSTANCE_DISPLAY;
	var stageData = global.CONSTANTS.STAGES;
	var buttonWidth = global.CONSTANTS.UI.MENU_BUTTONS.WIDTH;
	var buttonHeight = global.CONSTANTS.UI.MENU_BUTTONS.HEIGHT;
	var marginX = global.CONSTANTS.UI.MARGIN_X;
	var marginY = global.CONSTANTS.UI.MARGIN_Y;

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
}

function onStagesDrawGUI() {
	drawTitle();
}