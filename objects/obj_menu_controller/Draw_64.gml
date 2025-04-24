if(room == r_MultiplayerSelect) {
	if(p1_lock and p2_lock) {
		draw_set_font(fnt_char_header)
		draw_set_color(c_black)
		draw_set_halign(fa_center)
		draw_text(room_width / 2, room_height / 2 - 150, string(ceil(alarm[1] / 60)))
	}	
}

if(room == r_MapSelect) {
	if(alarm[2] >= 0) {
		draw_set_font(fnt_char_header)
		draw_set_color(c_black)
		draw_set_halign(fa_center)
		draw_text(room_width / 2, room_height / 2 - 150, string(ceil(alarm[2] / 60)))
	}	
}

if(room == r_HowToPlay) {
	draw_set_font(fnt_char_header)
	draw_set_color(c_black)
	draw_set_halign(fa_center)
	draw_text(256, 250, "\nMove - Arrow Keys\n\nLight Attack - X\n\nHeavy Attack - Z\n\nDodge - C\n\nSpecial Attack - S")
	draw_text(704, 250, "\nMove - Arrow Keys\n\nLight Attack - K\n\nHeavy Attack - J\n\nDodge - L\n\nSpecial Attack - I")
	draw_text(1124, 250, "\nMove - WASD\n\nLight Attack - T\n\nHeavy Attack - R\n\nDodge - Y\n\nSpecial Attack - 5")
	//256, 704, 1124
}