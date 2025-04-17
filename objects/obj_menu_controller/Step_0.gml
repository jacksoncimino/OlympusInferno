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
			room_goto(r_Olympus_Single)	
		} else {
			room_goto(r_MultiplayerSelect)
		}
	}
}

if(room = r_MultiplayerSelect) {
	if(keyboard_check_pressed(vk_space) or keyboard_check_pressed(vk_enter)) {
		room_goto(r_MapSelect)	
	}
	if(keyboard_check_pressed(vk_backspace) or keyboard_check_pressed(vk_escape)) {
		room_goto(r_ModeSelect)	
	}
}

if(room = r_MapSelect) {
	if(keyboard_check_pressed(vk_right)) {
		map += 1
	} else if (keyboard_check_pressed(vk_left)) {
		map -= 1	
	}
	
	if(map > 3) {
		map = 0	
	} else if(map < 0) {
		map = 3
	}
	
	if(keyboard_check_pressed(vk_up) or keyboard_check_pressed(vk_down)) {
		if(map < 2) {
			map += 2
		} else {
			map -= 2
		}
	}
	
	if(map == 0) {
		obj_menu_arrow.x = 96
		obj_menu_arrow.y = 160
	} else if (map == 1) {
		obj_menu_arrow.x = 736
		obj_menu_arrow.y = 160
	} else if (map == 2) {
		obj_menu_arrow.x = 96
		obj_menu_arrow.y = 512
	} else if (map == 3) {
		obj_menu_arrow.x = 736
		obj_menu_arrow.y = 512
	}
	
	if(keyboard_check_pressed(vk_space) or keyboard_check_pressed(vk_enter)) {
		if(map == 0) {
			room_goto(r_Olympus_Multi)
		} else if (map == 1) {
			room_goto(r_Underworld_Multi)
		} else if (map == 2) {
			room_goto(r_SnowyPeak_Multi)
		} else if (map == 3) {
			map = 0	
		}
	}
}

if(room = r_Player1Win or room = r_Player2Win or room = r_SinglePlayer_Win or room = r_SinglePlayer_Lose) {
	if(keyboard_check_pressed(vk_space) or keyboard_check_pressed(vk_enter)) {
		single_player = -1
		room_goto(r_MainMenu)
	}
}