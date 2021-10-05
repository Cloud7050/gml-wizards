/// @description Click action



//l("click");
//l(isMouseWithin());
if (!isMouseWithin()) return;
//l("click 2");

if (isPlacingThis()) {
	// Unselect
	global.wizardData = undefined;
} else {
	// Select / overwrite previous wizard
	global.wizardData = wizardData;
}