function onMainStart() {
	// [Prepare Globals]
	resetStage();
	
	// [Title]
	//TODO
	//drawTextBox(
		
	//);

	// [Create Stage Buttons]
	var stageData = global.CONSTANTS.STAGES;
	var buttonWidth = global.CONSTANTS.UI.STAGE_BUTTONS.WIDTH;
	var buttonHeight = global.CONSTANTS.UI.STAGE_BUTTONS.HEIGHT;
	var marginX = global.CONSTANTS.UI.MARGIN_X;
	var marginY = global.CONSTANTS.UI.MARGIN_Y;

	var stageCount = array_length(stageData);

	var totalWidth = (stageCount * buttonWidth) + ((stageCount - 1) * marginX);

	var startX = (room_width / 2) - (totalWidth / 2);
	var constantY = lerp(0, room_height, 0.66);

	for (var stageIndex = 0; stageIndex < array_length(stageData); stageIndex++) {
		var stageButton = instance_create_layer(
			startX + (stageIndex * (buttonWidth + marginX)),
			constantY,
			global.CONSTANTS.LAYERS.INSTANCE_DISPLAY,
			objectStageButton
		);
		stageButton.initialise(stageIndex);
	}
}