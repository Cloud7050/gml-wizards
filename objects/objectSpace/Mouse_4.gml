/// @description Place wizard



// If nothing selected
if (global.wizardData == undefined) return;

// If already have wizard placed
if (!isEmpty()) return;

// Unselect
var selectedWizard = global.wizardData;
global.wizardData = undefined;

// Place
var wizardPrice = selectedWizard.price;
if (global.coins >= wizardPrice) {
	global.coins -= wizardPrice;

	activeWizard = new createActiveWizard(
		selectedWizard,
		1
	);
}

//TODO cheat coin button, activeWizard spawn obj and put ref in here