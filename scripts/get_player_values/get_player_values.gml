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
				attack2: spr_zeus_attack2,
				heavy_attack: spr_zeus_backhand_attack,
				parry: spr_zeus_idle,
				jump: spr_zeus_jump,
				special: spr_zeus_special
			},
			stats: {
				xspd_max: 5,
				xspd_acc: 1,
				frict: 0.5,
				jumps: 3,
				dodges: 1,
				name: "Zeus"
			},
			sounds: {
				running: running_sound,
				jumping: jumping_sound,
				light_attack_sound: sword_swing_lite,
				heavy_attack_sound: sword_swing_heavy,
				special: lightning_strike
			}
		};
	case obj_Kronos:
		return {
			sprites: {
				basic: spr_kronos_idle,
				move: spr_kronos_run,
				dodge: spr_kronos_idle,
				attack: spr_kronos_frontlash,
				attack2: spr_kronos_up_attack,
				heavy_attack: spr_kronos_backlash,
				parry: spr_kronos_idle,
				jump: spr_kronos_jump,
				special: spr_kronos_special
			},
			stats: {
				xspd_max: 5,
				xspd_acc: 1,
				frict: 0.5,
				jumps: 3,
				dodges: 1,
				name: "Kronos"
			},
			sounds: {
				running: running_sound,
				jumping: jumping_sound,
				light_attack_sound: sword_swing_lite,
				heavy_attack_sound: sword_swing_heavy,
				special: fire_whoosh
			}
		};
	case obj_Poseidon:
		return {
			sprites: {
				basic: spr_poseidon_idle,
				move: spr_poseidon_run,
				dodge: spr_poseidon_idle,
				attack: spr_poseidon_attack,
				attack2: spr_poseidon_combo,
				heavy_attack: spr_poseidon_heavy_attack,
				parry: spr_poseidon_idle,
				jump: spr_poseidon_jump,
				special: spr_poseidon_special
			},
			stats: {
				xspd_max: 5,
				xspd_acc: 1,
				frict: 0.5,
				jumps: 3,
				dodges: 1,
				name: "Poseidon"
			},
			sounds: {
				running: running_sound,
				jumping: jumping_sound,
				light_attack_sound: spear_stab,
				heavy_attack_sound: spear_stab,
				special: water_splash,
			}
		};
	case obj_Minotaur:
		return {
			sprites: {
				basic: spr_minotaur_idle,
				move: spr_minotaur_run,
				dodge: spr_minotaur_idle,
				attack: spr_minotaur_attack,
				attack2: spr_minotaur_attack_2,
				heavy_attack: spr_minotaur_attack_heavy,
				parry: spr_minotaur_idle,
				jump: spr_minotaur_jump,
				special: spr_minotaur_special
			},
			stats: {
				xspd_max: 5,
				xspd_acc: 1,
				frict: 0.5,
				jumps: 3,
				dodges: 1,
				name: "Minotaur"
			},
			sounds: {
				running: running_sound,
				jumping: jumping_sound,
				light_attack_sound: sword_swing_lite,
				heavy_attack_sound: sword_swing_heavy,
				special: water_splash,
			}
		};
	case obj_Cyclops:
		return {
			sprites: {
				basic: spr_cyclops_idle,
				move: spr_cyclops_run,
				dodge: spr_cyclops_idle,
				attack: spr_cyclops_attack,
				attack2: spr_cyclops_attack_2,
				heavy_attack: spr_cyclops_attack_heavy,
				parry: spr_cyclops_idle,
				jump: spr_cyclops_jump,
				special: spr_cyclops_special
			},
			stats: {
				xspd_max: 5,
				xspd_acc: 1,
				frict: 0.5,
				jumps: 3,
				dodges: 1,
				name: "Cyclops"
			},
			sounds: {
				running: running_sound,
				jumping: jumping_sound,
				light_attack_sound: sword_swing_lite,
				heavy_attack_sound: sword_swing_heavy,
				special: water_splash,
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
				basic: spr_zeus_idle,
				move: spr_zeus_walk,
				dodge: spr_zeus_idle,
				attack: spr_zeus_attack,
				attack2: spr_zeus_attack2,
				heavy_attack: spr_zeus_backhand_attack,
				parry: spr_zeus_idle,
				jump: spr_zeus_jump,
				special: spr_zeus_special
			},
			stats: {
				xspd_max: 5,
				xspd_acc: 1,
				frict: 0.5,
				jumps: 3,
				dodges: 1,
				name: "Zeus"
			}
		};
	}
}