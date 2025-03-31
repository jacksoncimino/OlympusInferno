// Values which differ by character on a surface level can be changed here.
// The function takes in the object_index of a player and returns a struct.
function get_player_values(char_name){
	switch (char_name) {
	case obj_Zeus:
		return {
			sprites: {
				basic: spr_zeus_idle,
				move: spr_zeus_walk,
				dodge: spr_zeus_idle,
				attack: spr_zeus_attack,
				parry: spr_zeus_idle
			},
			stats: {
				xspd_max: 5,
				xspd_acc: 1,
				frict: 0.5,
				jumps: 3,
				dodges: 1
			}
		};
	case obj_cyclops:
		return {
			sprites: {
				basic: spr_enemy_cyclops,
				move: spr_enemy_cyclops,
				dodge: spr_enemy_cyclops,
				attack: spr_enemy_cyclops,
				parry: spr_enemy_cyclops
			},
			stats: {
				xspd_max: 5,
				xspd_acc: 1,
				frict: 0.5,
				jumps: 3,
				dodges: 1
			}
		};	
	}
}