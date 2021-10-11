global.CONSTANTS = {
	LAYERS: {
		INSTANCE_DISPLAY: "display",
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
		WIZARD_BUTTONS: {
			WIDTH: 192,
			HEIGHT: 128
		},
		HEALTHBARS: {
			WIDTH: 64,
			HEIGHT: 8
		}
	},
	WIZARDS: {
		LEVEL_CAP: 3,
		ONE: new WizardData(
			"Fire",
			30,
			
			3,
			1,
			1,
			
			1.65,
			0.9,
			1.5,
			
			[
				spriteWizard1L1,
				spriteWizard1L2,
				spriteWizard1L3
			]
		),
		TWO: new WizardData(
			"Ice",
			40,
			
			4,
			0.8,
			1.5,
			
			1.6,
			0.9,
			1.3,
			
			[
				spriteWizard2L1,
				spriteWizard2L2,
				spriteWizard2L3
			]
		),
		THREE: new WizardData(
			"Wind",
			50,
			
			2,
			0.7,
			3,
			
			1.5,
			0.85,
			1.15,
			
			[
				spriteWizard3L1,
				spriteWizard3L2,
				spriteWizard3L3
			]
		),
		FOUR: new WizardData(
			"Lightning",
			60,
			
			3,
			0.6,
			2,
			
			1.65,
			0.8,
			1.25,
			
			[
				spriteWizard4L1,
				spriteWizard4L2,
				spriteWizard4L3
			]
		)
	},
	ENEMIES: {
		ONE: new EnemyData(
			5,
			1,
			
			4,
			1,
			
			spriteEnemy1
		)
	}
}