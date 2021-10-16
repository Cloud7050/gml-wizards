/// @description Chargeup bars



if (isOffCooldown()) return;

var barWidth = global.CONSTANTS.UI.CHARGEUP_BARS.WIDTH;
var barHeight = global.CONSTANTS.UI.CHARGEUP_BARS.HEIGHT;

var rightX = getEndX();
var topY = getMidY() - (barHeight / 2);

draw_healthbar(
	rightX - barWidth,
	topY,
	rightX,
	topY + barHeight,
	getCooldownPercentage(),
	c_black,
	c_aqua,
	c_purple,
	HEALTHBAR_ANCHORS.BOTTOM,
	true,
	true
);