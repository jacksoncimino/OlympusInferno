draw_self()

var drawX = 0
if(object_index == obj_player1) {
	drawX = 15
} else {
	drawX = room_width - 300
}

draw_set_font(fnt_char_header)
draw_set_color(c_black)
draw_text(drawX, room_height - 250, name)

draw_set_font(fnt_health)
draw_set_color(c_blue)
draw_text(drawX, room_height - 225, string(hp))

draw_set_font(fnt_attack_meter)
draw_set_color(c_black)
if(special_meter > attacks_needed) {draw_set_color(c_green)}
draw_text(drawX, room_height - 125, "Special Attack: " + string(special_meter))