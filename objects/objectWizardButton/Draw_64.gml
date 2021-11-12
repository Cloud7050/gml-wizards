/// @description Description



event_inherited();

if (isMouseWithin()) {
	drawSmartTextBox(
		DRAWING_ANCHORS.BOTTOM_RIGHT,
		room_width - global.C.MARGINS.X,
		room_height - global.C.MARGINS.Y,

		room_width / 4,

		wizardData.descriptionColour,
		global.C.OPACITIES.PANEL,
		undefined,

		undefined,
		undefined,

		wizardData.description
	);
}