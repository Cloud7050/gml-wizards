var fire = new WizardData(
	"Fire",
	25,

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
	$0000da
);
var ice = new WizardData(
	"Ice",
	40,

	4,
	0.8,
	1.5,

	1.75,
	0.9,
	1.3,

	[
		spriteWizard2L1,
		spriteWizard2L2,
		spriteWizard2L3
	],
	$cec700
);
var wind = new WizardData(
	"Wind",
	50,

	2,
	0.3,
	2,

	1.5,
	1,
	1.15,

	[
		spriteWizard3L1,
		spriteWizard3L2,
		spriteWizard3L3
	],
	$00d300
);
var lightning = new WizardData(
	"Lightning",
	70,

	3,
	0.4,
	1.25,

	2,
	0.95,
	1.25,

	[
		spriteWizard4L1,
		spriteWizard4L2,
		spriteWizard4L3
	],
	$00d1ff
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
	40,
	0.75,

	8,
	1,

	spriteEnemy4
);
var cavalier = new EnemyData(
	50,
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
			10,
			10000, 2
		)
	],
	[ fire ],
	7050
);
var one = new StageData(
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
			10,
			10, 1, 0.7
		),
		new WaveData(
			slime,
			5,
			15, 0.7, 0.4
		),
		new WaveData(
			slime,
			5,
			20, 0.5, 0.3
		)
	],
	[ fire ],
	80
);
var two = new StageData(
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
			10,
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
			10,
			40, 0.5, 0.3
		),
		new WaveData(
			snake,
			0,
			30, 0.6, 0.3
		),
		new WaveData(
			hunter,
			8,
			5, 1, 0.8
		),
		new WaveData(
			slime,
			5,
			15, 0.5, 0.3
		),
		new WaveData(
			snake,
			0,
			30, 0.6, 0.2
		),
		new WaveData(
			hunter,
			5,
			15, 0.5, 0.4
		)
	],
	[ fire, ice, wind ],
	110
);
var four = new StageData(
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
			10,
			30, 0.5, 0.3
		),
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
			5,
			10, 0.5, 0.3
		),
		new WaveData(
			snake,
			0,
			20, 0.7, 0.5
		),
		new WaveData(
			hunter,
			3,
			20, 0.8, 0.6
		),
		new WaveData(
			knight,
			0,
			20, 0.6, 0.3
		)
	],
	[ fire, ice, wind, lightning ],
	155
);
var five = new StageData(
	[
		[s, p, p, p, o, o, o, r, w],
		[o, o, o, p, o, o, r, w, w],
		[p, p, p, p, o, o, r, r, w],
		[p, o, r, r, o, o, o, r, o],
		[p, o, w, r, o, p, p, p, p],
		[p, o, o, o, o, p, o, r, p],
		[p, p, p, p, p, p, o, o, e]
	],
	[
		new WaveData(
			snake,
			10,
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
			5,
			10, 0.5, 0.3
		),
		new WaveData(
			cavalier,
			5,
			8, 0.6, 0.4
		),
		new WaveData(
			hunter,
			3,
			20, 0.8, 0.6
		),
		new WaveData(
			knight,
			0,
			20, 0.6, 0.3
		),
		new WaveData(
			slime,
			5,
			10, 0.5, 0.3
		),
		new WaveData(
			hunter,
			3,
			20, 0.8, 0.6
		),
		new WaveData(
			boss,
			10,
			1, 0
		),
		new WaveData(
			snake,
			0,
			20, 0.6, 0.3
		),
		new WaveData(
			cavalier,
			2,
			10, 0.3
		)
	],
	[ fire, ice, wind, lightning ],
	155
);

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
		STAGE_INDEX: 0,
		LIVES: 5,
		COINS: 0
	},
	UI: {
		MARGIN_X: 16,
		MARGIN_Y: 16,
		STAGE_BUTTONS: {
			WIDTH: 128,
			HEIGHT: 128
		},
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
	],
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

enum HEALTHBAR_ANCHORS {
	LEFT,
	RIGHT,
	TOP,
	BOTTOM
}