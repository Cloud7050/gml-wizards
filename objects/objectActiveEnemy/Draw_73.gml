/// @description Healthbars



var healthPercentage = getHealthPercentage();
if (healthPercentage >= 100) return;

var healthbarWidth = global.C.BARS.HEALTH.DIMENSIONS.width;
var healthbarHeight = global.C.BARS.HEALTH.DIMENSIONS.height;

var startX = getMidX() - (healthbarWidth / 2);
var endY = getStartY() - healthbarHeight;

draw_healthbar(
	startX,
	endY - healthbarHeight,
	startX + healthbarWidth,
	endY,
	healthPercentage,
	c_black,
	global.C.BARS.HEALTH.COLOURS.END,
	global.C.BARS.HEALTH.COLOURS.START,
	HEALTHBAR_ANCHORS.LEFT,
	true,
	true
);