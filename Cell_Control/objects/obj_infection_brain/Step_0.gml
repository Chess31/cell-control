if (global.frozen = true) {
	exit;
}

switch (state) {
    case 0:
        // Growth Mode
		
		//action_timer--;
		
        if (action_points > 100) {
			//action_timer = action_cooldown;
			//try to place up to four pieces using action points
			for (var _actions_left = actions_per_step; _actions_left > 0; _actions_left--) {
				var _choosen_action = irandom(11); //Number of actions available
			
				if (_choosen_action = 0 && action_points >= ACTION_COSTS.BASIC) {
					//spawn a BASIC infection piece
					add_infection_piece(obj_infection_basic, ACTION_COSTS.BASIC);
				}
			
				if (_choosen_action = 1 && action_points >= ACTION_COSTS.BARRIER) {
					//spawn a BARRIER infection piece
					add_infection_piece(obj_infection_barrier, ACTION_COSTS.BARRIER);
				}
			
				if (_choosen_action = 2 && action_points >= ACTION_COSTS.SPAWNER) {
					//spawn a SPAWNER infection piece
					add_infection_piece(obj_infection_spawner, ACTION_COSTS.SPAWNER);
				}
			
				if (_choosen_action = 3 && action_points >= ACTION_COSTS.HEALER) {
					//spawn a HEALER infection piece
					add_infection_piece(obj_infection_healer, ACTION_COSTS.HEALER);
				}
			
				if (_choosen_action = 4 && action_points >= ACTION_COSTS.HARVESTER) {
					//spawn a HARVESTER infection piece
					add_infection_piece(obj_infection_harvester, ACTION_COSTS.HARVESTER);
				}
			
				if (_choosen_action = 5 && action_points >= ACTION_COSTS.ALARM) {
					//spawn a ALARM infection piece
					add_infection_piece(obj_infection_alarm, ACTION_COSTS.ALARM);
				}
			
				if (_choosen_action = 6 && action_points >= ACTION_COSTS.VISION) {
					//spawn a VISION infection piece
					add_infection_piece(obj_infection_vision, ACTION_COSTS.VISION);
				}
			
				if (_choosen_action = 7 && action_points >= ACTION_COSTS.ENERGYDRAIN) {
					//spawn a ENERGYDRAIN infection piece
					add_infection_piece(obj_infection_energydrain, ACTION_COSTS.ENERGYDRAIN);
				}
			
				if (_choosen_action = 8 && action_points >= ACTION_COSTS.ENHANCER) {
					//spawn a ENHANCER infection piece
					add_infection_piece(obj_infection_enhancer, ACTION_COSTS.ENHANCER);
				}
			
				if (_choosen_action = 9 && action_points >= ACTION_COSTS.EXPANDER) {
					//spawn a EXPANDER infection piece
					add_infection_piece(obj_infection_expander, ACTION_COSTS.EXPANDER);
				}
			
				if (_choosen_action = 10 && action_points >= ACTION_COSTS.SHIELD) {
					//spawn a SHIELD infection piece
					add_infection_piece(obj_infection_shield, ACTION_COSTS.SHIELD);
				}
			
				if (_choosen_action = 11 && action_points >= ACTION_COSTS.FORTIFICATION) {
					//spawn a FORTIFICATION infection piece
					add_infection_piece(obj_infection_fortification, ACTION_COSTS.FORTIFICATION);
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