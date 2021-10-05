var createWizardData = function(
	name,
	price,
	
	damage,
	fireRate,
	range,
	
	damageMultiplier,
	fireRateMultiplier,
	rangeMultiplier,
	
	levelSprites
) constructor {
	self.name = name;
	self.price = price;
	
	self.damage = damage;
	self.fireRate = fireRate;
	self.range = range;
	
	self.damageMultiplier = damageMultiplier;
	self.fireRateMultiplier = fireRateMultiplier;
	self.rangeMultiplier = rangeMultiplier;
	
	self.levelSprites = levelSprites;
}



global.CONSTANTS = {
	LAYERS: {
		INSTANCE_WIZARDS: "wizards",
		INSTANCE_ENEMIES: "enemies",
		INSTANCE_FRAMEWORK: "framework",
		
		INSTANCE_BACKGROUND: "background"
	},
	WIZARDS: {
		GREY: new createWizardData(
			"Grey",
			30,
			
			1,
			1,
			2,
			
			1.5,
			0.9,
			1.25,
			
			[
				spriteGreyWizard1,
				spriteGreyWizard1,
				spriteGreyWizard1
			]
		),
		LEVEL_CAP: 3
	},
	UI: {
		MARGIN_X: 16,
		MARGIN_Y: 16
	}
}