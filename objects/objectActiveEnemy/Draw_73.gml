/// @description Healthbars



if (self.health >= getMaxHealth()) return;

var healthbarWidth = global.CONSTANTS.UI.HEALTHBARS.WIDTH;
var healthbarHeight = global.CONSTANTS.UI.HEALTHBARS.HEIGHT;

var leftX = getMidX() - (healthbarWidth / 2);
var bottomY = y - healthbarHeight;
draw_healthbar(
	leftX,
	bottomY - healthbarHeight,
	leftX + healthbarWidth,
	bottomY,
	self.health / getMaxHealth() * 100,
	c_black,
	c_red,
	c_green,
	0,
	true,
	true
);