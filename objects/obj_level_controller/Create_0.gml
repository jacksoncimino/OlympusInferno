player1 = ""
player2 = ""
multiPlayer = true

if (room == r_Olympus_Multi) {
	multiPlayer = true
	
	player1 = obj_Zeus
	player2 = obj_Zeus
	
	//set player keys
	/*
	player1.move_left_key = ord("A")
	player1.move_right_key = ord("D")
	player1.jump_key = ord("W")
	player1.down_key = ord("S")
	player1.dodge_key = ord("Y")
	player1.quick_attack_key = ord("T")
	player1.special_attack_key = ord("R")
	
	player2.move_left_key = vk_left
	player2.move_right_key = vk_right
	player2.jump_key = vk_up
	player2.down_key = vk_down
	player2.dodge_key = ord("L")
	player2.quick_attack_key = ord("K")
	player2.special_attack_key = ord("J")
	*/
	

	
} else {
	multiPlayer = false
}

