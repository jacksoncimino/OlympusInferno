///@description Onto the next level
if(room == r_Olympus_Single) {
	room_goto(r_Underworld_Single_Story)
} else if (room == r_Underworld_Single) {
	room_goto(r_SnowyPeak_Single_Story)	
} else if (room == r_SnowyPeak_Single) {
	room_goto(r_Mountain_Single_Story)	
} else {
	room_goto(r_SinglePlayer_Win)	
}