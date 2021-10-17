enum HEALTHBAR_ANCHORS {
	LEFT,
	RIGHT,
	TOP,
	BOTTOM
}

global.CONSTANTS = {
	LAYERS: {
		INSTANCE_DISPLAY: "display",
		INSTANCE_META: "meta",
		INSTANCE_WIZARDS: "wizards",
		INSTANCE_ENEMIES: "enemies",
		INSTANCE_ABOVEGROUND: "aboveground",
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
		},
		CHARGEUP_BARS: {
			WIDTH: 8,
			HEIGHT: 64
		},
		RANGE_OPACITY: 0.5,
		PANEL_OPACITY: 0.75,
		WIZARD_OUTLINES: {
			SELECTED: {
				THICKNESS: 4,
				COLOUR: c_white
			},
			CANDIDATE: {
				THICKNESS: 2,
				COLOUR: c_blue
			}
		}
	},
	WIZARDS: {
		LEVEL_CAP: 3,
		ONE: new WizardData(
			"Fire",
			30,

			3,
			1,
			1.25,

			1.65,
			0.9,
			1.25,

			[
				spriteWizard1L1,
				spriteWizard1L2,
				spriteWizard1L3
			],
			$0000da
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
			],
			$cec700
		),
		THREE: new WizardData(
			"Wind",
			50,

			2,
			0.7,
			2,

			1.5,
			0.85,
			1.15,

			[
				spriteWizard3L1,
				spriteWizard3L2,
				spriteWizard3L3
			],
			$00d300
		),
		FOUR: new WizardData(
			"Lightning",
			60,

			3,
			0.6,
			1.75,

			1.65,
			0.8,
			1.25,

			[
				spriteWizard4L1,
				spriteWizard4L2,
				spriteWizard4L3
			],
			$00d1ff
		)
	},
	ENEMIES: {
		ONE: new EnemyData(
			5,
			1,

			3,
			1,

			spriteEnemy1
		)
	},
	HINTS: {
		CANNOT_AFFORD_WIZARD: "[Hint] You cannot afford this wizard right now",
		CLICK_SELECT_WIZARD: "[Hint] Click this wizard to select him",
		NO_MERGE_UNSELECT_WIZARD: "[Hint] If you have another matching wizard in the same row or column, you can merge them!"
			+ "\nOr, click the wizard again to unselect him",
		MERGE_OR_UNSELECT_WIZARD: "[Hint] Click another outlined wizard to merge this wizard into him!"
			+ "\nOr, click the wizard again to unselect him"
	}
}