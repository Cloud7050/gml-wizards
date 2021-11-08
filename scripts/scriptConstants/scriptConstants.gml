var fire = new WizardData(
	"Fire Wizard",
	25,
	joinArray(
		[
			"Damage: Average",
			"Fire rate: Poor",
			"Range: Poor"
		]
	),

	3,
	1,
	1.25,

	2,
	0.9,
	1.25,

	[
		spriteWizard1L1,
		spriteWizard1L2,
		spriteWizard1L3
	],
	$0000da,
	$9898d9
);
var ice = new WizardData(
	"Ice Wizard",
	40,
	joinArray(
		[
			"Damage: Good",
			"Fire rate: Average",
			"Range: Average"
		]
	),

	3.75,
	0.8,
	1.5,

	1.75,
	0.8,
	1.3,

	[
		spriteWizard2L1,
		spriteWizard2L2,
		spriteWizard2L3
	],
	$cec700,
	$cfcc91
);
var wind = new WizardData(
	"Wind Wizard",
	50,
	joinArray(
		[
			"Damage: Poor",
			"Fire rate: Excellent",
			"Range: Great"
		]
	),

	2,
	0.375,
	2,

	1.5,
	0.7,
	1.15,

	[
		spriteWizard3L1,
		spriteWizard3L2,
		spriteWizard3L3
	],
	$00d300,
	$94d494
);
var lightning = new WizardData(
	"Lightning Wizard",
	70,
	joinArray(
		[
			"Damage: Good",
			"Fire rate: Great",
			"Range: Poor"
		]
	),

	3.75,
	0.425,
	1.25,

	2,
	0.925,
	1.35,

	[
		spriteWizard4L1,
		spriteWizard4L2,
		spriteWizard4L3
	],
	$00d1ff,
	$b3f1ff
);

var slime = new EnemyData(
	5,
	0.75,

	1,
	1,

	spriteEnemy1
);
var snake = new EnemyData(
	12,
	0.75,

	3,
	1,

	spriteEnemy2
);
var hunter = new EnemyData(
	20,
	1,

	5,
	1,

	spriteEnemy3
);
var knight = new EnemyData(
	50,
	0.75,

	8,
	1,

	spriteEnemy4
);
var cavalier = new EnemyData(
	60,
	1.25,

	10,
	1,

	spriteEnemy5
);
var boss = new EnemyData(
	800,
	0.5,

	50,
	7050,

	spriteEnemyBoss
);

var s = objectStart;
var p = objectPath;
var e = objectEnd;
var o = objectSpace;
var r = objectRock;
var w = objectPond;

var tutorial = new StageData(
	"Tutorial Sandbox",
	[
		[o, w, r, o, w, o],
		[w, s, p, p, p, w],
		[w, o, w, o, p, w],
		[w, o, r, o, p, w],
		[w, e, p, p, p, w],
		[o, w, w, o, r, o]
	],
	[
		new WaveData(
			slime,
			0,
			50, 2, 0.5
		),
		new WaveData(
			slime,
			0,
			7050, 0.5
		)
	],
	[ fire ],
	400,
	joinArray(
		[
			"Place wizards to attack enemies before they reach the purple portal! Pick a wizard on the right, then click an empty square to place him there.",
			"Identical wizards can be merged! Click a wizard, then another in the same row or column, to merge them.",
			"Merging is blocked if rocks or other wizards are in the way, but works across everything else, such as paths & ponds.",
			"Use the flag at the top to bring on this stage's enemies. Feel free to test out the Fire Wizard!",
			"Exit this sandbox to play a real stage when you're ready!"
		],
		"\n\n"
	)
);
var one = new StageData(
	"Stage 1",
	[
		[s, p, p, p, p, p, p, p, p],
		[o, o, o, o, o, o, o, o, p],
		[w, w, o, o, o, o, o, o, p],
		[o, o, w, w, w, o, o, o, p],
		[o, o, o, o, o, w, o, o, p],
		[o, o, o, o, o, o, o, o, p],
		[e, p, p, p, p, p, p, p, p]
	],
	[
		new WaveData(
			slime,
			0,
			10, 1.2, 1
		),
		new WaveData(
			slime,
			5,
			15, 1, 0.9
		),
		new WaveData(
			slime,
			5,
			20, 0.9, 0.7
		)
	],
	[ fire ],
	80
);
var two = new StageData(
	"Stage 2",
	[
		[s, p, p, p, p, p, o, o, o],
		[w, o, o, o, o, p, o, o, o],
		[o, o, o, o, r, p, r, o, o],
		[w, w, o, o, o, p, p, p, p],
		[w, o, o, o, o, o, o, o, p],
		[o, o, r, o, r, o, o, o, p],
		[e, p, p, p, p, p, p, p, p]
	],
	[
		new WaveData(
			slime,
			0,
			15, 0.7, 0.4
		),
		new WaveData(
			snake,
			3,
			30, 1, 0.7
		),
		new WaveData(
			slime,
			5,
			20, 0.5, 0.3
		),
		new WaveData(
			snake,
			0,
			30, 0.7, 0.3
		),
	],
	[ fire, ice ],
	80
);
var three = new StageData(
	"Stage 3",
	[
		[s, p, p, p, p, p, p, p, p],
		[o, o, o, o, r, r, o, o, p],
		[o, r, o, o, r, w, o, o, p],
		[p, p, p, p, p, p, p, p, p],
		[p, o, o, o, o, w, r, o, o],
		[p, r, o, o, o, r, w, o, o],
		[p, p, p, p, p, p, p, p, e]
	],
	[
		new WaveData(
			slime,
			0,
			40, 0.7, 0.5
		),
		new WaveData(
			snake,
			0,
			30, 0.7, 0.4
		),
		new WaveData(
			hunter,
			15,
			5, 1, 0.8
		),
		new WaveData(
			slime,
			15,
			15, 0.5, 0.3
		),
		new WaveData(
			snake,
			0,
			30, 0.7, 0.5
		),
		new WaveData(
			hunter,
			15,
			15, 0.5, 0.4
		)
	],
	[ fire, ice, wind ],
	110
);
var four = new StageData(
	"Stage 4",
	[
		[w, o, o, r, r, o, o, o, e],
		[o, o, p, p, p, p, r, o, p],
		[o, o, p, o, o, p, o, o, p],
		[s, p, p, o, p, p, o, r, p],
		[o, o, o, r, p, r, o, o, p],
		[w, w, w, o, p, o, o, o, p],
		[r, r, w, o, p, p, p, p, p]
	],
	[
		new WaveData(
			slime,
			0,
			30, 0.5, 0.3
		),
		new WaveData(
			snake,
			0,
			20, 0.7, 0.5
		),
		new WaveData(
			hunter,
			15,
			15, 0.8, 0.6
		),
		new WaveData(
			knight,
			0,
			5, 0.8, 0.6
		),
		new WaveData(
			slime,
			15,
			10, 0.5, 0.3
		),
		new WaveData(
			snake,
			0,
			20, 0.7, 0.5
		),
		new WaveData(
			hunter,
			15,
			20, 0.8, 0.5
		),
		new WaveData(
			knight,
			0,
			20, 1, 0.6
		)
	],
	[ fire, ice, wind, lightning ],
	155
);
var five = new StageData(
	"Final Stage",
	[
		[s, p, p, p, w, o, o, r, w],
		[o, o, o, p, o, o, r, w, w],
		[p, p, p, p, w, o, r, r, w],
		[p, o, r, r, o, o, o, r, o],
		[p, o, w, r, o, p, p, p, p],
		[p, o, o, w, o, p, o, r, p],
		[p, p, p, p, p, p, o, o, e]
	],
	[
		new WaveData(
			snake,
			0,
			20, 0.7, 0.5
		),
		new WaveData(
			hunter,
			3,
			15, 0.9, 0.7
		),
		new WaveData(
			knight,
			0,
			5, 1, 0.8
		),
		new WaveData(
			slime,
			15,
			10, 0.5, 0.3
		),
		new WaveData(
			cavalier,
			4,
			8, 1, 0.8
		),
		new WaveData(
			hunter,
			3,
			20, 0.8, 0.6
		),
		new WaveData(
			knight,
			0,
			20, 0.9, 0.7
		),
		new WaveData(
			slime,
			15,
			10, 0.5, 0.3
		),
		new WaveData(
			hunter,
			2,
			20, 0.8, 0.6
		),
		new WaveData(
			boss,
			15,
			1, 0
		),
		new WaveData(
			snake,
			0,
			20, 0.6, 0.3
		),
		new WaveData(
			cavalier,
			10,
			10, 0.9, 0.6
		)
	],
	[ fire, ice, wind, lightning ],
	170
);

global.C = {
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
	PRIORITIES: {
		EFFECT: 75,
		GENERAL: 50,
		MUSIC: 25
	},
	DEFAULTS: {
		LIVES: 5
	},
	MARGINS: {
		X: 16,
		Y: 16
	},
	COLOURS: {
		TEXT: c_black,
		TEXT_ERROR: c_red,

		BACKGROUND: c_white,
		BACKGROUND_HOVER: c_silver,
		BACKGROUND_SELECTED: $aaffaa,
		BACKGROUND_SELECTED_HOVER: $6bc06b,

		OUTLINE: c_black,
		OUTLINE_FLAG: $0000aa,

		FOG: c_white,

		RANGE_PREVIEW: c_grey,
		RANGE_INNER: c_green,
		RANGE_OUTER: c_white
	},
	OPACITIES: {
		RANGE: 0.5,
		PANEL: 0.75
	},
	BUTTONS: {
		MENU: {
			DIMENSIONS: new Dimensions(192, 128)
		},
		WIZARD: {
			DIMENSIONS: new Dimensions(288, 128)
		},
		NAVIGATION: {
			DIMENSIONS: new Dimensions(96, 96)
		}
	},
	BARS: {
		HEALTH: {
			DIMENSIONS: new Dimensions(64, 8),
			COLOURS: {
				START: c_green,
				END: c_red
			}
		},
		CHARGEUP: {
			DIMENSIONS: new Dimensions(8, 64),
			COLOURS: {
				START: c_blue,
				END: c_aqua
			}
		}
	},
	TEXT: {
		MENUS: {
			PLAY: "PLAY",
			CREDITS: "CREDITS",
			BACK: "Back"
		},
		CREDITS: joinArray(
			[
				"CREATED 2021",
				"Producer/Artist: Redacted",
				"Designer: Redacted",
				"Programmer: ☁",
				"QA/Tester: Redacted",
				"",
				"GRAPHICS",
				"Danieloov",
				"FunwithPixels",
				"KELGE Fonts",
				"Mavadee",
				"PixElthen",
				"Reemax",
				"Ross McConnell",
				"You're Perfect Studio",
				"",
				"SOUNDS",
				"Alexander Nakarada",
				"Mixkit",
				"Random Mind",
				"",
				"Special thanks to our playtesters"
			]
		),
		RESULTS: {
			WIN: "VICTORY!",
			LOSE: "OVERWHELMED..."
		}
	},
	MUSIC: [
		soundMusicMenus,
		soundMusicStage
	],
	WIZARDS: {
		LEVEL_CAP: 3,
		OUTLINES: {
			SELECTED: {
				COLOUR: c_white,
				THICKNESS: 4
			},
			CANDIDATE: {
				COLOUR: c_blue,
				THICKNESS: 2
			}
		},

		ONE: fire,
		TWO: ice,
		THREE: wind,
		FOUR: lightning
	},
	ENEMIES: {
		ONE: slime,
		TWO: snake,
		THREE: hunter,
		FOUR: knight,
		FIVE: cavalier,
		BOSS: boss
	},
	STAGES: [
		tutorial,
		one,
		two,
		three,
		four,
		five
	]
}