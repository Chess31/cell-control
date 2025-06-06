if (global.frozen = true) {
	exit;
}

var _enemy_count = instance_number(obj_enemy);
if (attack_timer <= 0 and _enemy_count = 0) {
	state = 1; //attack mode
} else if (attack_timer > 0 and _enemy_count = 0){
	attack_timer--; //timer for switching to attack mode
}

if (attack_timer = 7 * game_get_speed(gamespeed_fps)) {
	//Select enemy spawn locations
	var _spawn = [0,1];
	var _dir = irandom(360);
	var _len = irandom_range(400,600);
	_spawn[0] = obj_cell_core.x + lengthdir_x(_len,_dir);
	_spawn[1] = obj_cell_core.y + lengthdir_y(_len,_dir);
	spawn_indicator = _spawn;
}

switch (state) {
    case 0:
        // Growth Mode (swtich between attack mode (just spawn enemies) and grow ("Stunned time" so the player can break through to the core))
		
        if (seed_timer > seed_spawn_interval) {
			add_infection_piece(obj_infection_seed, 100, 0);
			seed_timer = 0;
		}
		
		seed_timer++;
		
		break;
		
	case 1:
        // Attack Mode
		
		//select enemy types for the wave based on attacks survived
		if (enemy_types == noone) {
			if (global.attacks_survived = 0) {
				enemy_types = global.enemy_array_r;
			} else if (global.attacks_survived = 1) {
				enemy_types = global.enemy_array_rb;
			} else if (global.attacks_survived  = 2) {
				enemy_types = global.enemy_array_bg;
			} else if (global.attacks_survived = 3) {
				enemy_types = global.enemy_array_rp;
			} else if (global.attacks_survived = 4) {
				enemy_types = global.enemy_array_y;
			} else if (global.attacks_survived = 5) {
				enemy_types = global.enemy_array_rbgpy;
			} else {
				enemy_types = global.enemy_array_rbgpy;
			}
		}
		
		////Select enemy spawn locations
		//var _spawn = [0,1];
		//var _dir = irandom(360);
		//var _len = irandom_range(400,600);
		//_spawn[0] = obj_cell_core.x + lengthdir_x(_len,_dir);
		//_spawn[1] = obj_cell_core.y + lengthdir_y(_len,_dir);
		//spawn_indicator = _spawn;
		
		//spawn boss every 5 waves
		if (global.attacks_survived mod attacks_between_bosses = 0 and global.attacks_survived > 0) {
			instance_create_layer(spawn_indicator[0], spawn_indicator[1], "Instances", obj_boss_blue);
		} else {
			//spawn the enemies
			for (var i = 0; i < enemies_per_attack; ++i) {
			    // Spawn an enemy
				var _random_enemy = random(ds_list_size(enemy_types));
				var _enemy_to_spawn = ds_list_find_value(enemy_types, _random_enemy);
				var _offset = irandom_range(-75,75);
				instance_create_layer(spawn_indicator[0] + _offset, spawn_indicator[1] + _offset, "InfectionLayer", _enemy_to_spawn);
			}
		}
		
		//increase global wave counter and reset variables
		global.attacks_survived++;
		global.core_power += 5;
		enemies_per_attack = 3 + global.attacks_survived;
		enemy_types = noone;
		attack_timer = time_between_attacks;
		//go back to grow state
		state = 0;
		
        break;
		
    default:
        // Do nothing if a state is not selected
        break;
}