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
		INSTANCE_PARTICLES: "particles",
		INSTANCE_WIZARDS: "wizards",
		INSTANCE_ENEMIES: "enemies",
		INSTANCE_ABOVEGROUND: "aboveground",
		INSTANCE_FRAMEWORK: "framework",

		BACKGROUND: "background"
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
		),
		TWO: new EnemyData(
			8,
			1,

			5,
			2,

			spriteEnemy2
		),
		THREE: new EnemyData(
			15,
			2,

			10,
			4,

			spriteEnemy3
		),
		FOUR: new EnemyData(
			30,
			1,

			18,
			6,

			spriteEnemy4
		),
		FIVE: new EnemyData(
			40,
			1.5,

			25,
			8,

			spriteEnemy5
		),
		BOSS: new EnemyData(
			400,
			0.5,

			300,
			10,

			spriteEnemyBoss
		)
	},
	HINTS: {
		CANNOT_AFFORD_WIZARD: "[Hint] You cannot afford this wizard right now",
		CLICK_SELECT_WIZARD: "[Hint] Click this wizard to select him",
		NO_MERGE_UNSELECT_WIZARD: "[Hint] If you have another matching wizard in the same row or column, you can merge them!"
			+ "\nOr, click the wizard again to unselect him",
		MERGE_OR_UNSELECT_WIZARD: "[Hint] Click another outlined wizard to merge this wizard into him!"
			+ "\nOr, click the wizard again to unselect him",
		MAX_LEVEL_UNSELECT_WIZARD: "[Hint] The wizard is at max level and cannot be merged further. Click him again to unselect"
	}
}

var s = objectStart;
var p = objectPath;
var e = objectEnd;
var o = objectSpace;

var slime = global.CONSTANTS.ENEMIES.ONE;
var snake = global.CONSTANTS.ENEMIES.TWO;
var hunter = global.CONSTANTS.ENEMIES.THREE;
var knight = global.CONSTANTS.ENEMIES.FOUR;
var cavalier = global.CONSTANTS.ENEMIES.FIVE;
var boss = global.CONSTANTS.ENEMIES.BOSS;

var fire = global.CONSTANTS.WIZARDS.ONE;
var ice = global.CONSTANTS.WIZARDS.TWO;
var wind = global.CONSTANTS.WIZARDS.THREE;
var lightning = global.CONSTANTS.WIZARDS.FOUR;

global.CONSTANTS.LEVELS = {
	ONE: new LevelData(
		[
			[s, p, p, p, p, p, p, p, p],
			[o, o, o, o, o, o, o, o, p],
			[o, o, o, o, o, o, o, o, p],
			[o, o, o, o, o, o, o, o, p],
			[o, o, o, o, o, o, o, o, p],
			[o, o, o, o, o, o, o, o, p],
			[e, p, p, p, p, p, p, p, p]
		],
		[
			new WaveData(
				slime,
				10,
				15, 1, 0.7
			),
			new WaveData(
				slime,
				5,
				15, 0.7, 0.4
			),
			new WaveData(
				snake,
				5,
				15, 0.6, 0.4
			),
			new WaveData(
				snake,
				5,
				15, 0.4, 0.2
			),
			new WaveData(
				hunter,
				5,
				10, 0.8, 0.7
			),
			new WaveData(
				hunter,
				5,
				10, 0.7, 0.6
			),
			new WaveData(
				knight,
				10,
				10, 1, 0.8
			),
			new WaveData(
				hunter,
				3,
				5, 0.2
			),
			new WaveData(
				knight,
				5,
				10, 0.8, 0.6
			),
			new WaveData(
				cavalier,
				5,
				8, 0.8, 0.6
			),
			new WaveData(
				cavalier,
				5,
				8, 0.6, 0.4
			),
			new WaveData(
				boss,
				5,
				2, 5
			),
			new WaveData(
				cavalier,
				10,
				10, 0.3
			)
		],
		[ fire, ice, wind, lightning ],
	),
	TWO: new LevelData(
		[
			[s, p, p, p, p, p, o, o, o],
			[o, o, o, o, o, p, o, o, o],
			[o, o, o, o, o, p, o, o, o],
			[o, o, o, o, o, p, p, p, p],
			[o, o, o, o, o, o, o, o, p],
			[o, o, o, o, o, o, o, o, p],
			[e, p, p, p, p, p, p, p, p]
		],
		[
			new WaveData(
				hunter,
				3,
				30, 1, 0.2
			)
		],
		[ fire ]
	),
	THREE: new LevelData(
		[
			[s, p, p, p, p, p, p, p, p],
			[o, o, o, o, o, o, o, o, p],
			[o, o, o, o, o, o, o, o, p],
			[p, p, p, p, p, p, p, p, p],
			[p, o, o, o, o, o, o, o, o],
			[p, o, o, o, o, o, o, o, o],
			[p, p, p, p, p, p, p, p, e]
		],
		[
			new WaveData(
				hunter,
				3,
				30, 1, 0.2
			)
		],
		[ fire ]
	),
	FOUR: new LevelData(
		[
			[o, o, o, o, o, o, o, o, e],
			[o, o, p, p, p, p, o, o, p],
			[o, o, p, o, o, p, o, o, p],
			[s, p, p, o, p, p, o, o, p],
			[o, o, o, o, p, o, o, o, p],
			[o, o, o, o, p, o, o, o, p],
			[o, o, o, o, p, p, p, p, p]
		],
		[
			new WaveData(
				hunter,
				3,
				30, 1, 0.2
			)
		],
		[ fire ]
	),
	FIVE: new LevelData(
		[
			[s, p, p, p, o, o, o, o, o],
			[o, o, o, p, o, o, o, o, o],
			[p, p, p, p, o, o, o, o, o],
			[p, o, o, o, o, o, o, o, o],
			[p, o, o, o, o, p, p, p, p],
			[p, o, o, o, o, p, o, o, p],
			[p, p, p, p, p, p, o, o, e]
		],
		[
			new WaveData(
				hunter,
				3,
				30, 1, 0.2
			)
		],
		[ fire ]
	)
}