/// @description Draw self with outline



if (isThisSelected()) {
	drawOutlinedInstance(self);
	
	//TODO change hint based on merge status
	addHint(
		global.CONSTANTS.HINTS.NO_MERGE_UNSELECT_WIZARD
	);
} else draw_self();