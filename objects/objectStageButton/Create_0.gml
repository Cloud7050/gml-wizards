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

	initialiseParentMenuButton(
		anchor,

		getStageString(index)
	);
}