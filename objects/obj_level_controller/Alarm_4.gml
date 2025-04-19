///@description Onto the next level
if(room == r_Olympus_Single) {
	room_goto(r_Underworld_Single)
} else if (room == r_Underworld_Single) {
	room_goto(r_SnowyPeak_Single)	
} else {
	room_goto(r_Mountain_Single)	
}