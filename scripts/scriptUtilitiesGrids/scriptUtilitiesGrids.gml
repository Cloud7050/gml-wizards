/* [Classes] */

function Indexes(
	rowIndex,
	columnIndex
) constructor {
	self.rowIndex = rowIndex;
	self.columnIndex = columnIndex;

	function up() {
		return new Indexes(self.rowIndex, self.columnIndex - 1);
	}

	function down() {
		return new Indexes(self.rowIndex, self.columnIndex + 1);
	}

	function left() {
		return new Indexes(self.rowIndex - 1, self.columnIndex);
	}

	function right() {
		return new Indexes(self.rowIndex + 1, self.columnIndex);
	}
}



/* [Functions] */

/// @returns Whether the specified indexes are within the bounds of the specified 2D array
function checkGridBounds(array, indexes) {
	var rowIndex = indexes.rowIndex;
	var columnIndex = indexes.columnIndex;
	//FIXME
	// l(rowIndex);
	// l(columnIndex);
	// l(array_length(array));
	// l(array_length(array[0]));
	return (
		rowIndex >= 0
		&& rowIndex < array_length(array)
		&& columnIndex >= 0
		&& columnIndex < array_length(array[0])
	);
}

function clearMergeCandidates() {
	with (objectActiveWizard) {
		isMergeCandidate = false;
	}
}

enum MERGE_DIRECTIONS {
	RIGHT,
	DOWN,
	LEFT,
	UP
}

function isElementBlocksMerging(gridElement) {
	// Only empty spaces let merging proceed
	return (
		!(
			gridElement.object_index == objectSpace
			&& gridElement.isEmpty()
		)
	);
	//FIXME
	// != || !=
}

function markMergeCandidate(activeWizard, mergeDirection) {
	var startingSpace = activeWizard.space;
	var currentIndexes = new Indexes(
		startingSpace.rowIndex,
		startingSpace.columnIndex
	);
	var grid = getGrid();
	while (true) {
		if (mergeDirection == MERGE_DIRECTIONS.RIGHT) {
			currentIndexes = currentIndexes.right();
		} else if (mergeDirection == MERGE_DIRECTIONS.DOWN) {
			currentIndexes = currentIndexes.down();
		} else if (mergeDirection == MERGE_DIRECTIONS.LEFT) {
			currentIndexes = currentIndexes.left();
		} else {
			currentIndexes = currentIndexes.up();
		}

		if (
			!checkGridBounds(
				grid,
				currentIndexes
			)
		) return;

		var gridElement = getGridElement(currentIndexes);
		if (
			gridElement.object_index == objectSpace
			&& !gridElement.isEmpty()
		) {
			var potentialCandidate = gridElement.activeWizard;
			if (
				potentialCandidate.wizardData == activeWizard.wizardData
				&& potentialCandidate.level == activeWizard.level
			) {
				gridElement.activeWizard.isMergeCandidate = true;
				return;
			}
		}

		if (
			isElementBlocksMerging(gridElement)
		) return;
	}
}

function markMergeCandidates(activeWizard) {
	// Eg in case going from one set to another set, meaning no reset triggered
	clearMergeCandidates();
	
	markMergeCandidate(activeWizard, MERGE_DIRECTIONS.RIGHT);
	markMergeCandidate(activeWizard, MERGE_DIRECTIONS.DOWN);
	markMergeCandidate(activeWizard, MERGE_DIRECTIONS.LEFT);
	markMergeCandidate(activeWizard, MERGE_DIRECTIONS.UP);
}

// [Instances Grid]

/// @returns The reset instances 2D array
function resetGrid() {
	var array;
	if (!variable_global_exists("grid")) {
		array = [[]];
		global.grid = array;
	} else {
		array = getGrid();
		array_delete(
			array,
			0,
			array_length(array)
		);
	}
	return array;
}

function getGrid() {
	return global.grid;
}

function setGridElement(
	rowIndex,
	columnIndex,
	gridElement
) {
	// Getting and setting by external @ accessor does not automatically create when out of bounds
	global.grid[rowIndex][columnIndex] = gridElement;
}

function getGridElement(indexes) {
	// Getting by reference does not reflect updates externally when array changes
	return getGrid()[indexes.rowIndex][indexes.columnIndex];
}