/// @description Draw self with outline



if (isThisSelected()) {
	drawOutlinedInstance(
		self,
		global.CONSTANTS.UI.WIZARD_OUTLINES.SELECTED.THICKNESS,
		global.CONSTANTS.UI.WIZARD_OUTLINES.SELECTED.COLOUR
	);

	if (!isMaxLevel()) {
		var anyMergeCandidates = false;
		with (objectActiveWizard) {
			if (!anyMergeCandidates) anyMergeCandidates = isMergeCandidate;
		}

		addHint(
			anyMergeCandidates
				? global.CONSTANTS.HINTS.MERGE_OR_UNSELECT_WIZARD
				: global.CONSTANTS.HINTS.NO_MERGE_UNSELECT_WIZARD
		);
	} else addHint(
		global.CONSTANTS.HINTS.WIZARD_MAX_LEVEL
	);
} else if (isMergeCandidate) {
	drawOutlinedInstance(
		self,
		global.CONSTANTS.UI.WIZARD_OUTLINES.CANDIDATE.THICKNESS,
		global.CONSTANTS.UI.WIZARD_OUTLINES.CANDIDATE.COLOUR
	);
} else draw_self();