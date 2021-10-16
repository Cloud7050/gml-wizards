/// @description Healthbars



var currentHealth = self.health;
var maxHealth = getMaxHealth();
var healthPercentage = currentHealth / maxHealth * 100;
if (healthPercentage >= 100) return;

var healthbarWidth = global.CONSTANTS.UI.HEALTHBARS.WIDTH;
var healthbarHeight = global.CONSTANTS.UI.HEALTHBARS.HEIGHT;

var leftX = getMidX() - (healthbarWidth / 2);
var bottomY = y - healthbarHeight;

draw_healthbar(
	leftX,
	bottomY - healthbarHeight,
	leftX + healthbarWidth,
	bottomY,
	healthPercentage,
	c_black,
	c_red,
	c_green,
	HEALTHBAR_ANCHORS.LEFT,
	true,
	true
);