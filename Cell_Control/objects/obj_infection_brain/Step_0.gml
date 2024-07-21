if (global.frozen = true) {
	exit;
}

switch (state) {
    case 0:
        // Growth Mode
		
        if (action_points > 100) {
			//try to place up to four pieces using action points
			for (var _actions_left = actions_per_step; _actions_left > 0; _actions_left--) {
				var _choosen_action = irandom(11); //Number of actions available
				//If a spawner does not exist, place one instead of a random piece
				if (instance_number(obj_infection_spawner) < 1) {_choosen_action = 2};
				
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
		
        break;
		
    default:
        // Do nothing if a state is not selected
        break;
}