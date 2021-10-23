/* [Functions] */

/// @returns The steps per second the game is set to run at. Different from fps & fps_real
function getStepsPerSecond() {
	return game_get_speed(gamespeed_fps);
}

function joinArray(array, glue = "\n") {
	var outputString = "";
	for (var index = 0; index < array_length(array); index++) {
		if (index != 0) outputString += glue;
		outputString += string(array[index]);
	}
	return outputString;
}

function mid(a, b) {
	return lerp(a, b, 0.5);
}