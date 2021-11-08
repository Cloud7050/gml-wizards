/* [Functions] */

function playSoleSound(
	sound,
	priority = undefined,
	isLoop = undefined
) {
	if (audio_is_playing(sound)) return;
	
	playSound(
		sound,
		priority,
		isLoop
	);
}

function playSound(
	sound,
	priority = global.C.PRIORITIES.GENERAL,
	isLoop = false
) {
	audio_play_sound(
		sound,
		priority,
		isLoop
	);
}

function switchMusic(newMusic) {
	// Stop all music except new music (do not restart if playing)
	var allMusic = global.C.MUSIC;
	for (var index = 0; index < array_length(allMusic); index++) {
		var stopMusic = allMusic[index];
		if (stopMusic == newMusic) continue;
		
		audio_stop_sound(stopMusic);
	}
	
	// Start if not already playing
	playSoleSound(
		newMusic,
		global.C.PRIORITIES.MUSIC,
		true
	);
}