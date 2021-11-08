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