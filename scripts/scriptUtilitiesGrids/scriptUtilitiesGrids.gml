/* [Classes] */

function Indexes(
	row,
	column
) constructor {
	self.row = row;
	self.column = column;

	function up() {
		return new Indexes(row, column - 1);
	}

	function down() {
		return new Indexes(row, column + 1);
	}

	function left() {
		return new Indexes(row - 1, column);
	}

	function right() {
		return new Indexes(row + 1, column);
	}
}



/* [Functions] */

/// @returns Whether the specified indexes are within the bounds of the specified 2D array
function checkGridBounds(
	array,
	indexes
) {
	var rowIndex = indexes.row;
	var columnIndex = indexes.column;
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

function markMergeCandidate(activeWizard, mergeDirection) {
	var currentIndexes = activeWizard.space.indexes;
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
				activeWizard.isMatches(potentialCandidate)
			) {
				potentialCandidate.isMergeCandidate = true;
				return;
			}
		}

		if (
			gridElement.isBlocksMerging()
		) return;
	}
}

function remarkMergeCandidates(activeWizard) {
	// Eg in case going from one set to another set, meaning no reset triggered
	clearMergeCandidates();

	if (activeWizard.isMaxLevel()) return;

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
		array = [];
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

function getGridElement(indexes) {
	return getGrid()[indexes.row][indexes.column];
}