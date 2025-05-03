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

if(room == r_Olympus_Single_Story) {
	draw_set_font(fnt_char_header)
	draw_set_color(c_black)
	draw_set_halign(fa_center)
	draw_text(room_width / 2, 200, "Zeus was enjoying his day off in the city of Mount Olympus, when suddenly\n" + 
	"the city fell under siege by an army of cyclopes, minotaurs, skeletons, and more monsters.\n" + 
	"Zeus quickly sprung into action, determined to save Olympus from these foul creatures.\n\n\n\n\n\n\n" + 
	"PRESS ENTER TO START")
}

if(room == r_Underworld_Single_Story) {
	draw_set_font(fnt_char_header)
	draw_set_color(c_white)
	draw_set_halign(fa_center)
	draw_text(room_width / 2, 200, "Olympus was saved from destruction\n The Gods held a meeting to get to the bottom of the source of the attack.\n" +
		"Suspicious of Hades, the God of the underworld, the Gods send Poseidon to confront Hades.\n" +
		"Unfortunately, before he is able to speak with Hades, he runs into a minotaur guarding \nthe entrance to Hades' fortress." +
		"\n\n\n\n\n\n\nPRESS ENTER TO START")
}

if(room == r_SnowyPeak_Single_Story) {
	draw_set_font(fnt_char_header)
	draw_set_color(c_black)
	draw_set_halign(fa_center)
	draw_text(room_width / 2, 200, "Poseidon was able to get inside the underworld fortress and interrogate Hades.\n" +
		"Hades claimed to not be the one who attacked Olympus,\nsaying instead that the titan Kronos had returned.\n" +
		"The Gods were suspicious of this answer, as Kronos had been sealed away for eternity.\n" +
		"To get more answers, Poseidon is sent deep into the northern mountains." +
		"\n\n\n\n\n\n\nPRESS ENTER TO START")
}

if(room == r_Mountain_Single_Story) {
	draw_set_font(fnt_char_header)
	draw_set_color(c_black)
	draw_set_halign(fa_center)
	draw_text(room_width / 2, 200, "In the mountains, Poseidon was able to uncover the truth.\n" +
		"The titan Kronos had indeed returned, and was planning another attack on Olympus.\n" +
		"Knowing that Olympus wasn't prepared for another attack, Zeus heads to confront Kronos,\n" +
		"hoping to end this conflict once and for all..." +
		"\n\n\n\n\n\n\nPRESS ENTER TO START")
}

if(room == r_SinglePlayer_Win) {
	draw_set_font(fnt_char_header)
	draw_set_color(c_white)
	draw_set_halign(fa_center)
	draw_text(room_width / 2, 300, "Thanks to the efforts of the Gods,\n" + 
	"Olympus and the entire world were safe for now.\n\n\nTHE END")
}