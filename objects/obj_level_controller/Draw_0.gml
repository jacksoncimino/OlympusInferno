draw_set_font(fnt_attack_meter)
draw_set_color(c_black)
if(obj_player.special_meter > obj_player.attacks_needed) {draw_set_color(c_green)}
draw_text(25, 25, "Special Attack Meter: " + string(obj_player.special_meter))