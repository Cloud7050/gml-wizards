/// @description Draw self with outline



if (isThisSelected()) {
	drawOutlinedInstance(self);

	var anyMergeCandidates = false;
	with (objectActiveWizard) {
		if (!anyMergeCandidates) anyMergeCandidates = isMergeCandidate;
		//FIXME
		// anyMergeCandidates = anyMergeCandidates || isMergeCandidate;
	}

	addHint(
		anyMergeCandidates
			? global.CONSTANTS.HINTS.MERGE_OR_UNSELECT_WIZARD
			: global.CONSTANTS.HINTS.NO_MERGE_UNSELECT_WIZARD
	);
} else if (isMergeCandidate) {
	drawOutlinedInstance(
		self,
		c_blue
	);
} else draw_self();