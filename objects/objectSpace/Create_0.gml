/// @description Initialise



/* [Instance Variables] */
// For parent
event_inherited();
width = sprite_width;
height = sprite_height;

activeWizard = undefined;



/* [Methods] */
function isEmpty() {
	return activeWizard == undefined;
}