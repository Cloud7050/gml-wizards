function onMainStart() {
	// [GameMaker Inits]
	draw_set_circle_precision(64);

	// [Prepare Globals]
	resetStage();

	// [Create Stage Buttons]
	var stageData = global.CONSTANTS.STAGES;
	var buttonWidth = global.CONSTANTS.UI.STAGE_BUTTONS.WIDTH;
	var buttonHeight = global.CONSTANTS.UI.STAGE_BUTTONS.HEIGHT;
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
			global.CONSTANTS.LAYERS.INSTANCE_DISPLAY,
			objectStageButton
		);
		stageButton.initialise(
			DRAWING_ANCHORS.TOP_LEFT,

			stageIndex
		);
	}
}

function onDrawMainGUI() {
	// Title
	draw_sprite(
		spriteTitle,
		0,
		room_width / 2,
		room_height / 4
	);
}