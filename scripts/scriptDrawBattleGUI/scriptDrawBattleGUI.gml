function onDrawBattleGUI() {
	// [Stats]
	
	// Draw background
	
	var marginX = global.CONSTANTS.UI.MARGIN_X;
	var marginY = global.CONSTANTS.UI.MARGIN_Y;
	var statsWidth = global.CONSTANTS.UI.STATS.WIDTH;
	var statsHeight = global.CONSTANTS.UI.STATS.HEIGHT;
	
	var endX = room_width - marginX;
	var startX = endX - statsWidth;
	// Left align
	var textX = startX + (statsWidth / 10);
	
	var startY = marginY;
	var endY = startY + statsHeight;
	// Middle align
	var textY = startY + (statsHeight / 2);

	draw_set_color(c_white);
	draw_rectangle(
		startX,
		startY,
		endX,
		endY,
		false
	);
	
	// Draw text
	
	draw_set_color(c_black);
	draw_set_font(fontGUI);
	draw_set_halign(fa_left);
	draw_set_valign(fa_middle);
	draw_text(
		textX,
		textY,
		"Coins: $" + string(getCoins())
	);
}