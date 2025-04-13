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
				basic: spr_cyclops_idle,
				move: spr_cyclops_idle,
				dodge: spr_cyclops_idle,
				attack: spr_cyclops_idle,
				parry: spr_cyclops_idle
			},
			stats: {
				xspd_max: 5,
				xspd_acc: 1,
				frict: 0.5,
				jumps: 3,
				dodges: 1
			}
		};	
	case obj_player1:
		with(obj_level_controller) {
			return get_player_values(obj_level_controller.player1)
		}
	case obj_player2:
		with(obj_level_controller) {
			return get_player_values(obj_level_controller.player2)
		}
	default:
		return {
			sprites: {
				basic: spr_temp,
				move: spr_temp,
				dodge: spr_temp,
				attack: spr_temp,
				parry: spr_temp
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