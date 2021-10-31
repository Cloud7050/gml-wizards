/// @description Initialise



/* [Parent] */

event_inherited();

function onClick() {
	setStage(index);
	room_goto(roomStage);
}



/* [Methods] */

function initialise(
	anchor,
	
	index
) {
	self.index = index;
	
	initialiseParentButton(
		anchor,
		
		global.CONSTANTS.UI.STAGE_BUTTONS.WIDTH,
		global.CONSTANTS.UI.STAGE_BUTTONS.HEIGHT,
		
		getStageString(index)
	);
}