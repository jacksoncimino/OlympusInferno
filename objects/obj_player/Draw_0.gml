var drawX = 0

if(object_index == obj_player1) {
	drawX = 70
} else {
	drawX = room_width - 240
}

draw_sprite_ext(spr_basic, 0, drawX, room_height-120, 2, 2, 0, c_white, 1)

draw_set_halign(fa_center)

draw_set_font(fnt_char_header)
draw_set_color(c_white)
draw_text(drawX, room_height - 75, name)

draw_set_font(fnt_health)
draw_set_color(c_white)
draw_text(drawX + 160, room_height - 225, string(hp))

draw_set_font(fnt_char_header)
draw_set_color(c_white)
if(special_meter > attacks_needed) {draw_set_color(c_green)}
draw_text(drawX+75, room_height - 45, "Special: " + string(special_meter) + "/" + string(attacks_needed + 1))

draw_set_color(c_white)
draw_text(drawX+160, room_height - 75, "Lives: " + string(life))
