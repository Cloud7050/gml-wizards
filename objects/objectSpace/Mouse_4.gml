/// @description Place wizard



// If already have wizard placed
if (!isEmpty()) return;

// If nothing selected
var selectedWizard = global.wizardData;
if (selectedWizard == undefined) return;

// Unselect
unselectWizardData();

// Place
var wizardPrice = selectedWizard.price;
if (spendOnWizard(wizardPrice)) {
	activeWizard = new ActiveWizard(
		selectedWizard,
		1
	);
}