/// @description Draw self with outline



// Outline
if (isThisSelected()) {
	drawOutlinedInstance(
		self,
		global.C.WIZARDS.OUTLINES.SELECTED.THICKNESS,
		global.C.WIZARDS.OUTLINES.SELECTED.COLOUR
	);
} else if (isMergeCandidate) {
	drawOutlinedInstance(
		self,
		global.C.WIZARDS.OUTLINES.CANDIDATE.THICKNESS,
		global.C.WIZARDS.OUTLINES.CANDIDATE.COLOUR
	);
} else draw_self();