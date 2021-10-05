function onDrawBattleGUI() {
	marginX = global.CONSTANTS.UI.MARGIN_X;
	marginY = global.CONSTANTS.UI.MARGIN_Y;
	
	
	
	// Draw background
	
	var textWidth = marginX * 10;
	var textHeight = marginY * 2;
	var halfTextHeight = textHeight / 2;
	
	var endX = room_width;
	var textX = room_width - marginX - textWidth;
	var startX = textX - marginX;
	
	var startY = 0;
	var textY = startY + marginY + halfTextHeight;
	var endY = textY + halfTextHeight + marginY;

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
	draw_set_valign(fa_middle);
	draw_set_halign(fa_left);
	draw_text(
		textX,
		textY,
		"Coins: " + string(global.coins)
	);
}