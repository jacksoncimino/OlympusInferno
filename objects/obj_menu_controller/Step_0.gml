if(room = r_MainMenu) {
	if keyboard_check_pressed(vk_anykey) {
		room_goto(r_ModeSelect)	
	}
}

if(room = r_ModeSelect) {
	if(keyboard_check_pressed(vk_up) or keyboard_check_pressed(vk_down)) {
		single_player *= -1
		obj_menu_arrow.y += (194 * single_player)
	}
	
	if(keyboard_check_pressed(vk_space) or keyboard_check_pressed(vk_enter) or mouse_check_button_pressed(mb_left)) {
		if(single_player = 1) {
			room_goto(r_ModeSelect)	
		} else {
			room_goto(r_MultiplayerSelect)	
		}
	}
}

if(room = r_MultiplayerSelect) {
	if(keyboard_check_pressed(vk_space) or keyboard_check_pressed(vk_enter)) {
		room_goto(r_Olympus)	
	}
}