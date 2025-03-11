// Values which differ by character on a surface level can be changed here.
// The function takes in the object_index of a player and returns a struct.
function get_player_values(char_name){
	switch (char_name) {
	case obj_tempEnemy:
		return {
			sprites: {
				basic: spr_enemy_temp,
				move: spr_enemy_temp_move,
				dodge: spr_enemy_temp_dodge,
				attack: spr_enemy_temp_atk,
				parry: spr_enemy_temp_parry
			},
			stats: {
				xspd_max: 3,
				xspd_acc: 1,
				frict: 0.7,
				jumps: 4,
				dodges: 1
			}
		};
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
	case obj_tempPlayer:
	default:
		return {
			sprites: {
				basic: spr_temp,
				move: spr_temp_move,
				dodge: spr_temp_dodge,
				attack: spr_temp_atk,
				parry: spr_temp_parry
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