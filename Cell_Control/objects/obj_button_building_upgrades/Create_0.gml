event_inherited();

button_text = noone;

my_building_index = 0;

upgrade_type = undefined;

activate_button = function()
{
	var _correct_tab = obj_sliding_menu.tab == 0;
	if (_correct_tab) {
		switch (upgrade_type) {
		    case 0: //maxup
				var _current_maxup_cost =  global.building_maxup_cost[|my_building_index + 1];
				if (global.core_power >= _current_maxup_cost) {
					global.building_max_number[|my_building_index + 1]++;
					global.core_power -= _current_maxup_cost;
					global.building_maxup_cost[|my_building_index + 1] = max(_current_maxup_cost + 1, floor(_current_maxup_cost * 1.5));
				}
				break;
			case 1: //levelup
				var _current_levelup_cost =  global.building_levelup_cost[|my_building_index + 1];
				if (global.core_power >= _current_levelup_cost) {
					global.building_levels[|my_building_index + 1]++;
					global.core_power -= _current_levelup_cost;
					global.building_levelup_cost[|my_building_index + 1] = _current_levelup_cost * 2;
				}
				break;
		    default:
		        // code here
		        break;
		}
	}
}