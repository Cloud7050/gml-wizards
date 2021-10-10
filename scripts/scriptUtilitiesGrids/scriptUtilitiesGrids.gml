/* [Classes] */
function Indexes(rowIndex, columnIndex) constructor {
	self.rowIndex = rowIndex;
	self.columnIndex = columnIndex;
	
	function clone() {
		return new Indexes(self.rowIndex, self.columnIndex);
	}
	
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
	return (
		rowIndex >= 0
		&& rowIndex < array_length(array)
		&& columnIndex >= 0
		&& columnIndex < array_length(array[0])
	);
}