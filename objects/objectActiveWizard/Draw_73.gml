/// @description Chargeup bars



if (isOffCooldown()) return;

var barWidth = global.CONSTANTS.UI.CHARGEUP_BARS.WIDTH;
var barHeight = global.CONSTANTS.UI.CHARGEUP_BARS.HEIGHT;

var endX = getEndX();
var startY = getMidY() - (barHeight / 2);

draw_healthbar(
	endX - barWidth,
	startY,
	endX,
	startY + barHeight,
	getCooldownPercentage(),
	c_black,
	c_aqua,
	c_purple,
	HEALTHBAR_ANCHORS.BOTTOM,
	true,
	true
);