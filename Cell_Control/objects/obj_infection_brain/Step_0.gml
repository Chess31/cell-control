if (global.frozen = true) {
	exit;
}

var _enemy_count = instance_number(obj_enemy);
if (attack_timer <= 0 and _enemy_count = 0) {
	state = 1; //attack mode
} else if (attack_timer > 0 and _enemy_count = 0){
	attack_timer--; //timer for switching to attack mode
}

switch (state) {
    case 0:
        // Growth Mode (swtich between attack mode (just spawn enemies) and grow ("Stunned time" so the player can break through to the core))
		
		//if (action_points > 150) {
		//	var _random_basic_index = irandom(instance_number(obj_infection_basic) - 1);
		//	var _basic_node = instance_find(obj_infection_basic, _random_basic_index);
		//	with (_basic_node) {
		//		if (branches < 2) {
		//			branches++;
		//			// Spawn a new piece off of the basic node
		//			var _dir = parent_id.available_branches[branch_index][0];
		//			var _len = irandom(150);
		//			var _x = lengthdir_x(_len,_dir);
		//			var _y = lengthdir_y(_len,_dir);
		//			var _new_piece = instance_create_layer(_x,_y,"InfectionLayer",obj_infection_healer);
		//			_new_piece.sprite_index = s_infection_pieces;
		//			_new_piece.image_index = 3;
		//			//_new_piece.branch_angle = _selected_angle;
		//			_new_piece.parent_id = id;
		//		}
		//	}
		//}
		
        if (action_points > 100) {
			//try to place up to four pieces using action points
			for (var _actions_left = actions_per_step; _actions_left > 0; _actions_left--) {
				var _choosen_action = irandom(11); //Number of actions available
				//If a spawner does not exist, place one instead of a random piece
				if (instance_number(obj_infection_spawner) < instance_number(obj_well)) {_choosen_action = 2};
				if (instance_number(obj_infection_basic) < 1) {_choosen_action = 0};
				
				if (_choosen_action = 0 && action_points >= ACTION_COSTS.BASIC) {
					//spawn a BASIC infection piece
					add_infection_piece(obj_infection_basic, ACTION_COSTS.BASIC, 0);
				}
			
				if (_choosen_action = 1 && action_points >= ACTION_COSTS.BARRIER) {
					//spawn a BARRIER infection piece
					add_infection_piece(obj_infection_barrier, ACTION_COSTS.BARRIER, 1);
				}
			
				if (_choosen_action = 2 && action_points >= ACTION_COSTS.SPAWNER) {
					//spawn a SPAWNER infection piece
					add_infection_piece(obj_infection_spawner, ACTION_COSTS.SPAWNER, 2);
				}
			
				if (_choosen_action = 3 && action_points >= ACTION_COSTS.HEALER) {
					//spawn a HEALER infection piece
					add_infection_piece(obj_infection_healer, ACTION_COSTS.HEALER, 3);
				}
			
				if (_choosen_action = 4 && action_points >= ACTION_COSTS.HARVESTER) {
					//spawn a HARVESTER infection piece
					add_infection_piece(obj_infection_harvester, ACTION_COSTS.HARVESTER, 4);
				}
			
				if (_choosen_action = 5 && action_points >= ACTION_COSTS.ALARM) {
					//spawn a ALARM infection piece
					add_infection_piece(obj_infection_alarm, ACTION_COSTS.ALARM, 5);
				}
			
				if (_choosen_action = 6 && action_points >= ACTION_COSTS.VISION) {
					//spawn a VISION infection piece
					add_infection_piece(obj_infection_vision, ACTION_COSTS.VISION, 6);
				}
			
				if (_choosen_action = 7 && action_points >= ACTION_COSTS.ENERGYDRAIN) {
					//spawn a ENERGYDRAIN infection piece
					add_infection_piece(obj_infection_energydrain, ACTION_COSTS.ENERGYDRAIN, 7);
				}
			
				if (_choosen_action = 8 && action_points >= ACTION_COSTS.ENHANCER) {
					//spawn a ENHANCER infection piece
					add_infection_piece(obj_infection_enhancer, ACTION_COSTS.ENHANCER, 8);
				}
			
				if (_choosen_action = 9 && action_points >= ACTION_COSTS.EXPANDER) {
					//spawn a EXPANDER infection piece
					add_infection_piece(obj_infection_expander, ACTION_COSTS.EXPANDER, 9);
				}
			
				if (_choosen_action = 10 && action_points >= ACTION_COSTS.SHIELD) {
					//spawn a SHIELD infection piece
					add_infection_piece(obj_infection_shield, ACTION_COSTS.SHIELD, 10);
				}
			
				if (_choosen_action = 11 && action_points >= ACTION_COSTS.FORTIFICATION) {
					//spawn a FORTIFICATION infection piece
					add_infection_piece(obj_infection_fortification, ACTION_COSTS.FORTIFICATION, 11);
				}
			}
		}
		
		action_points += action_point_rate;
		
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
		
		//Select enemy spawn locations
		var _spawn = [0,1];
		var _dir = irandom(360);
		var _len = irandom_range(400,600);
		_spawn[0] = obj_cell_core.x + lengthdir_x(_len,_dir);
		_spawn[1] = obj_cell_core.y + lengthdir_y(_len,_dir);
		spawn_indicator = _spawn;
		
		//spawn boss every 5 waves
		if (global.attacks_survived mod attacks_between_bosses = 0 and global.attacks_survived > 0) {
			instance_create_layer(_spawn[0], _spawn[1], "Instances", obj_boss_blue);
		} else {
		
			//spawn the enemies
			for (var i = 0; i < enemies_per_attack; ++i) {
			    // Spawn an enemy
				var _random_enemy = random(ds_list_size(enemy_types));
				var _enemy_to_spawn = ds_list_find_value(enemy_types, _random_enemy);
				var _offset = irandom_range(-75,75);
				instance_create_layer(_spawn[0] + _offset, _spawn[1] + _offset, "Instances", _enemy_to_spawn);
			}
		
		}
		
		//increase global wave counter and reset variables
		global.attacks_survived++;
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