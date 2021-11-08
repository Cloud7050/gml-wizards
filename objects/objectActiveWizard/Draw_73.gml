/// @description Unscale. Chargeup bar



// [Unscale]
tryEndScale();

// [Chargeup bar]
if (isOffCooldown()) return;

var barWidth = global.C.BARS.CHARGEUP.DIMENSIONS.width;
var barHeight = global.C.BARS.CHARGEUP.DIMENSIONS.height;

var endX = getEndX();
var startY = getMidY() - (barHeight / 2);

draw_healthbar(
	endX - barWidth,
	startY,
	endX,
	startY + barHeight,
	getCooldownPercentage(),
	c_black,
	global.C.BARS.CHARGEUP.COLOURS.START,
	global.C.BARS.CHARGEUP.COLOURS.END,
	HEALTHBAR_ANCHORS.BOTTOM,
	true,
	true
);