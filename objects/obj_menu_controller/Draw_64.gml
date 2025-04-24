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