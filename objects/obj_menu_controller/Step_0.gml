var _gp = undefined
_gp = global.gamepad_main

	var _Stick = keyboard_check_pressed(vk_control)
	var _B = keyboard_check_pressed(vk_backspace)
	var _X = keyboard_check_pressed(vk_space)
	var _Y = keyboard_check_pressed(vk_escape)
	var _A = keyboard_check_pressed(vk_enter)
	var _dUp = keyboard_check_pressed(vk_up)
	var _dDown = keyboard_check_pressed(vk_down)
	var _dLeft = keyboard_check_pressed(vk_left)
	var _dRight = keyboard_check_pressed(vk_right)

if(_gp != undefined) {
	_Stick = ceil(gamepad_axis_value(_gp, gp_axislh))
	_B = gamepad_button_check_pressed(_gp, gp_face2)
	_X = gamepad_button_check_pressed(_gp, gp_face3)
	_Y = gamepad_button_check_pressed(_gp, gp_face4)
	_A = gamepad_button_check_pressed(_gp, gp_face1)
	_dUp = gamepad_button_check_pressed(_gp, gp_padu)
	_dDown = gamepad_button_check_pressed(_gp, gp_padd)
	_dLeft = gamepad_button_check_pressed(_gp, gp_padl)
	_dRight = gamepad_button_check_pressed(_gp, gp_padr)
}

if(room = r_MainMenu) {
	if keyboard_check_pressed(vk_anykey) {
		audio_play_sound(Menu_Select, 1, false)
		room_goto(r_ModeSelect)
	} else if(_B or _A or _Stick or _X or _Y or _dDown or _dLeft or _dRight or _dUp) {
		audio_play_sound(Menu_Select, 1, false)
		room_goto(r_ModeSelect)
	}
	if(not audio_is_playing(OI_Menu_bkgnd)) {
		audio_play_sound(OI_Menu_bkgnd, 1, true)
	}
}

if(room = r_ModeSelect) {
	if(keyboard_check_pressed(vk_up) or _dUp) {
		single_player -= 1
		audio_stop_sound(Menu_Click)
		audio_stop_sound(Menu_Select)
		audio_play_sound(Menu_Click, 1, false)
	} else if (_gp != undefined and gamepad_axis_value(_gp, gp_axislv) > 0 and not controller_stick_cooldown) {
		audio_stop_sound(Menu_Click)
		audio_stop_sound(Menu_Select)
		audio_play_sound(Menu_Click, 1, false)
		single_player -= 1
		controller_stick_cooldown = true
		alarm[0] = game_get_speed(gamespeed_fps) * 0.22
	}
	
	if(keyboard_check_pressed(vk_down) or _dDown) {
		single_player += 1
		audio_stop_sound(Menu_Click)
		audio_stop_sound(Menu_Select)
		audio_play_sound(Menu_Click, 1, false)
	} else if (_gp != undefined and gamepad_axis_value(_gp, gp_axislv) < 0 and not controller_stick_cooldown) {
		audio_stop_sound(Menu_Click)
		audio_stop_sound(Menu_Select)
		audio_play_sound(Menu_Click, 1, false)
		single_player += 1
		controller_stick_cooldown = true
		alarm[0] = game_get_speed(gamespeed_fps) * 0.22
	}
	
	if(single_player > 2) {
		single_player = 0
	} else if (single_player < 0) {
		single_player = 2	
	}
	
	if(single_player = 0) {
		obj_menu_arrow.y = 256	
	} else if (single_player = 1) {
		obj_menu_arrow.y = 416	
	} else {
		obj_menu_arrow.y = 576	
	}
	
	if(keyboard_check_pressed(vk_space) or keyboard_check_pressed(vk_enter) or _A or _X) {
		if(single_player == 1) {
			audio_stop_sound(Menu_Click)
			audio_stop_sound(Menu_Select)
			audio_play_sound(Menu_Select, 1, false)
			audio_stop_sound(OI_Menu_bkgnd)
			room_goto(r_Olympus_Single_Story)
		} else if (single_player == 0) {
			room_goto(r_MultiplayerSelect)
			audio_stop_sound(Menu_Click)
			audio_stop_sound(Menu_Select)
			audio_play_sound(Menu_Select, 1, false)
		} else {
			audio_stop_sound(Menu_Click)
			audio_stop_sound(Menu_Select)
			audio_play_sound(Menu_Select, 1, false)
			room_goto(r_HowToPlay)
		}
	}
}

if(room = r_MultiplayerSelect) {
	//display character choice
	switch player1 {
		case 0:
			obj_p1_char.sprite_index = spr_zeus_idle
		break;
		case 1:
			obj_p1_char.sprite_index = spr_kronos_idle
		break;
		case 2:
			obj_p1_char.sprite_index = spr_poseidon_idle
		break;
		case 3:
			obj_p1_char.sprite_index = spr_cyclops_idle
		break;
		case 4:
			obj_p1_char.sprite_index = spr_minotaur_idle
		break;
	}
	switch player2 {
		case 0:
			obj_p2_char.sprite_index = spr_zeus_idle
		break;
		case 1:
			obj_p2_char.sprite_index = spr_kronos_idle
		break;
		case 2:
			obj_p2_char.sprite_index = spr_poseidon_idle
		break;
		case 3:
			obj_p2_char.sprite_index = spr_cyclops_idle
		break;
		case 4:
			obj_p2_char.sprite_index = spr_minotaur_idle
		break;
	}
	
	if(keyboard_check_pressed(vk_right) or _dRight) {
		if(not p1_lock) {
			player1 += 1	
		} else if (not p2_lock) {
			player2 += 1	
		}
		audio_stop_sound(Menu_Click)
		audio_stop_sound(Menu_Select)
		audio_play_sound(Menu_Click, 1, false)
	} else if (keyboard_check_pressed(vk_left) or _dLeft) {
		if(not p1_lock) {
			player1 -= 1	
		} else if (not p2_lock) {
			player2 -= 1
		}
		audio_stop_sound(Menu_Click)
		audio_stop_sound(Menu_Select)
		audio_play_sound(Menu_Click, 1, false)
	} else if (_gp != undefined and gamepad_axis_value(_gp, gp_axislh) > 0 and not controller_stick_cooldown) {
		if(not p1_lock) {
			player1 += 1	
		} else if (not p2_lock) {
			player2 += 1	
		}
		controller_stick_cooldown = true
		alarm[0] = game_get_speed(gamespeed_fps) * 0.22
		audio_stop_sound(Menu_Click)
		audio_stop_sound(Menu_Select)
		audio_play_sound(Menu_Click, 1, false)
	} else if (_gp != undefined and gamepad_axis_value(_gp, gp_axislh) < 0 and not controller_stick_cooldown) {
		if(not p1_lock) {
			player1 += 1	
		} else if (not p2_lock) {
			player2 += 1	
		}
		controller_stick_cooldown = true
		alarm[0] = game_get_speed(gamespeed_fps) * 0.22
		audio_stop_sound(Menu_Click)
		audio_stop_sound(Menu_Select)
		audio_play_sound(Menu_Click, 1, false)
	}
	
	if(keyboard_check_pressed(vk_space) or keyboard_check_pressed(vk_enter) or _A or _X) {
		if (not p1_lock) {
			p1_lock = true	
			obj_menu_arrow.x = 832
		} else if (not p2_lock) {
			p2_lock = true
			obj_menu_arrow.x = room_width + 1000
			alarm[1] = game_get_speed(gamespeed_fps) * 3
		}
		audio_stop_sound(Menu_Click)
		audio_stop_sound(Menu_Select)
		audio_play_sound(Menu_Select, 1, false)
	}
	
	if(player1 > 4) {
		player1 = 0
	} else if(player1 < 0) {
		player1 = 4
	}
	if(player2 > 4) {
		player2 = 0
	} else if(player2 < 0) {
		player2 = 4
	}
	
	if(keyboard_check_pressed(vk_backspace) or keyboard_check_pressed(vk_escape) or _B or _Y) {
		if (alarm[1] > 0) {
			alarm[1] = -1
			obj_menu_arrow.x = 832
			p2_lock = false
		} else if (p1_lock) {
			p1_lock = false
			obj_menu_arrow.x = 288
		} else {
			room_goto(r_ModeSelect)
		}
		audio_stop_sound(Menu_Click)
		audio_stop_sound(Menu_Select)
		audio_play_sound(Menu_Back, 1, false)
	}
}

if(room = r_MapSelect) {
	if(keyboard_check_pressed(vk_right) or _dRight) {
		map += 1
		audio_stop_sound(Menu_Click)
		audio_stop_sound(Menu_Select)
		audio_play_sound(Menu_Click, 1, false)
	} else if (keyboard_check_pressed(vk_left) or _dLeft) {
		map -= 1	
		audio_stop_sound(Menu_Click)
		audio_stop_sound(Menu_Select)
		audio_play_sound(Menu_Click, 1, false)
	} else if (_gp != undefined and gamepad_axis_value(_gp, gp_axislh) > 0 and not controller_stick_cooldown) {
		map += 1
		controller_stick_cooldown = true
		alarm[0] = game_get_speed(gamespeed_fps) * 0.22
		audio_stop_sound(Menu_Click)
		audio_stop_sound(Menu_Select)
		audio_play_sound(Menu_Click, 1, false)
	} else if (_gp != undefined and gamepad_axis_value(_gp, gp_axislh) < 0 and not controller_stick_cooldown) {
		map -= 1
		controller_stick_cooldown = true
		alarm[0] = game_get_speed(gamespeed_fps) * 0.22
		audio_stop_sound(Menu_Click)
		audio_stop_sound(Menu_Select)
		audio_play_sound(Menu_Click, 1, false)
	}
	
	if(map > 3) {
		map = 0	
	} else if(map < 0) {
		map = 3
	}
	
	if(keyboard_check_pressed(vk_up) or keyboard_check_pressed(vk_down) or _dDown or _dUp) {
		if(map < 2) {
			map += 2
		} else {
			map -= 2
		}
		audio_stop_sound(Menu_Click)
		audio_stop_sound(Menu_Select)
		audio_play_sound(Menu_Click, 1, false)
	} else if (_gp != undefined and gamepad_axis_value(_gp, gp_axislv) != 0 and not controller_stick_cooldown) {
		controller_stick_cooldown = true
		alarm[0] = game_get_speed(gamespeed_fps) * 0.22
		if (map < 2) {
			map += 2
		} else {
			map -= 2	
		}
		audio_stop_sound(Menu_Click)
		audio_stop_sound(Menu_Select)
		audio_play_sound(Menu_Click, 1, false)
	}
	
	if(map == 0) {
		//+32 +32
		obj_menu_arrow.x = 128
		obj_menu_arrow.y = 192
	} else if (map == 1) {
		obj_menu_arrow.x = 768
		obj_menu_arrow.y = 192
	} else if (map == 2) {
		obj_menu_arrow.x = 128
		obj_menu_arrow.y = 544
	} else if (map == 3) {
		obj_menu_arrow.x = 768
		obj_menu_arrow.y = 544
	}
	
	if(keyboard_check_pressed(vk_space) or keyboard_check_pressed(vk_enter) or _A or _X) {
		alarm[2] = game_get_speed(gamespeed_fps) * 3
		audio_stop_sound(Menu_Click)
		audio_stop_sound(Menu_Select)
		audio_play_sound(Menu_Select, 1, false)
	}
	
	if(keyboard_check_pressed(vk_backspace) or keyboard_check_pressed(vk_escape) or _B or _Y) {
		if (alarm[2] > 0) {
			alarm[2] = -1
		} else {
			room_goto(r_MultiplayerSelect)
		}
		audio_stop_sound(Menu_Click)
		audio_stop_sound(Menu_Select)
		audio_play_sound(Menu_Back, 1, false)
	}
}

if(room = r_Player1Win or room = r_Player2Win or room = r_SinglePlayer_Win or room = r_SinglePlayer_Lose) {
	if(not audio_is_playing(OI_Menu_bkgnd)) {
		audio_play_sound(OI_Menu_bkgnd, 1, true)
	}
	if(keyboard_check_pressed(vk_space) or keyboard_check_pressed(vk_enter) or _A or _X) {
		single_player = -1
		room_goto(r_MainMenu)
		audio_stop_sound(Menu_Click)
		audio_stop_sound(Menu_Select)
		audio_play_sound(Menu_Select, 1, false)
	}
}

if(room == r_HowToPlay) {
	if(keyboard_check_pressed(vk_space) or keyboard_check_pressed(vk_enter) or _A or _X or keyboard_check_pressed(vk_backspace) or keyboard_check_pressed(vk_escape) or _B or _Y) {
		audio_stop_sound(Menu_Click)
		audio_stop_sound(Menu_Select)
		audio_play_sound(Menu_Select, 1, false)
		room_goto(r_ModeSelect)
	}
}

if(room == r_Olympus_Single_Story) {
	if(keyboard_check_pressed(vk_space) or keyboard_check_pressed(vk_enter) or _A or _X) {
		audio_stop_sound(Menu_Click)
		audio_stop_sound(Menu_Select)
		audio_play_sound(Menu_Select, 1, false)
		
		room_goto(r_Olympus_Single)
	}	
}

if(room == r_Underworld_Single_Story) {
	if(keyboard_check_pressed(vk_space) or keyboard_check_pressed(vk_enter) or _A or _X) {
		audio_stop_sound(Menu_Click)
		audio_stop_sound(Menu_Select)
		audio_play_sound(Menu_Select, 1, false)
		
		room_goto(r_Underworld_Single)
	}	
}

if(room == r_SnowyPeak_Single_Story) {
	if(keyboard_check_pressed(vk_space) or keyboard_check_pressed(vk_enter) or _A or _X) {
		audio_stop_sound(Menu_Click)
		audio_stop_sound(Menu_Select)
		audio_play_sound(Menu_Select, 1, false)
		
		room_goto(r_SnowyPeak_Single)
	}	
}

if(room == r_Mountain_Single_Story) {
	if(keyboard_check_pressed(vk_space) or keyboard_check_pressed(vk_enter) or _A or _X) {
		audio_stop_sound(Menu_Click)
		audio_stop_sound(Menu_Select)
		audio_play_sound(Menu_Select, 1, false)
		
		room_goto(r_Mountain_Single)
	}	
}