/// @description Healthbars



var healthPercentage = getHealthPercentage();
if (healthPercentage >= 100) return;

var healthbarWidth = global.CONSTANTS.UI.HEALTHBARS.WIDTH;
var healthbarHeight = global.CONSTANTS.UI.HEALTHBARS.HEIGHT;

var startX = getMidX() - (healthbarWidth / 2);
var endY = getStartY() - healthbarHeight;

draw_healthbar(
	startX,
	endY - healthbarHeight,
	startX + healthbarWidth,
	endY,
	healthPercentage,
	c_black,
	c_red,
	c_green,
	HEALTHBAR_ANCHORS.LEFT,
	true,
	true
);