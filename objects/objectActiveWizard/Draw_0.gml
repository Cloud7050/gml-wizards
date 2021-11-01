/// @description Draw self with outline



if (isThisSelected()) {
	drawOutlinedInstance(
		self,
		global.CONSTANTS.UI.WIZARD_OUTLINES.SELECTED.THICKNESS,
		global.CONSTANTS.UI.WIZARD_OUTLINES.SELECTED.COLOUR
	);
} else if (isMergeCandidate) {
	drawOutlinedInstance(
		self,
		global.CONSTANTS.UI.WIZARD_OUTLINES.CANDIDATE.THICKNESS,
		global.CONSTANTS.UI.WIZARD_OUTLINES.CANDIDATE.COLOUR
	);
} else draw_self();