global.CONSTANTS = {
	LAYERS: {
		INSTANCE_META: "meta",
		INSTANCE_WIZARDS: "wizards",
		INSTANCE_ENEMIES: "enemies",
		INSTANCE_FRAMEWORK: "framework",
		
		INSTANCE_BACKGROUND: "background"
	},
	DEFAULTS: {
		LIVES: 10,
		COINS: 80
	},
	UI: {
		MARGIN_X: 16,
		MARGIN_Y: 16,
		STATS: {
			WIDTH: 256,
			HEIGHT: 32
		},
		WIZARD_BUTTONS: {
			WIDTH: 128,
			HEIGHT: 128
		}
	}
	WIZARDS: {
		LEVEL_CAP: 3,
		GREY: new WizardData(
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
				spriteGreyWizard2,
				spriteGreyWizard3
			]
		)
	}
}