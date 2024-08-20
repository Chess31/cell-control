event_inherited();

button_text = noone;

show_button = true;

my_building_index = 0;

draw_max = function()
{
	//draw max placed building in the second column
	var _current_max = ds_list_find_value(global.building_max_number, my_building_index + 1);
	draw_text(x + 174, y, string(_current_max) + " (" + string(global.building_maxup_cost[|my_building_index + 1]) + ")");
}
draw_level = function()
{
	//draw level and cost in the third column
	var _current_level = ds_list_find_value(global.building_levels, my_building_index + 1);
	var _level_max =  global.building_level_max[|my_building_index + 1];
	if (_current_level != _level_max) {
		draw_text(x + 354, y, string(_current_level) + " (" + string(global.building_levelup_cost[|my_building_index + 1]) + ")");
	} else {
		draw_text_color(x + 354, y, string(_current_level) + " (max)", c_aqua, c_aqua, c_aqua, c_aqua, 1);
	}
}

activate_button = function()
{
	var _points_check = global.core_power >= 10; //unlock price
	var _not_unlocked_check = !array_contains(obj_player.available_buildings, my_building_index + 1);
	var _correct_tab = obj_sliding_menu.tab == 0;
	if (_points_check and _not_unlocked_check and _correct_tab) {
		array_push(obj_player.available_buildings, my_building_index + 1);
		global.core_power -= 10;
		//create other buttons for the row
		var _maxup_button = instance_create_layer(x + 174, y, "UI", obj_button_building_upgrades);
		var _levelup_button = instance_create_layer(x + 354, y, "UI", obj_button_building_upgrades);
		_maxup_button.upgrade_type = 0;
		_maxup_button.my_building_index = my_building_index;
		_levelup_button.upgrade_type = 1;
		_levelup_button.my_building_index = my_building_index;
		switch (my_building_index) {
		    //case 0:
		    //    // Wall
			//	_levelup_button.tooltip_text = "Increase wall durability";
		    //    break;
			//case 1:
		    //    // Turret
			//	_levelup_button.tooltip_text = "Increase turret bullet damage";
		    //    break;
			case 2:
		        // Forge
				_levelup_button.tooltip_text = "Increase energy generation rate";
		        break;
			case 3:
		        // Bomb
				_levelup_button.tooltip_text = "Increase blast radius";
		        break;
			case 4:
		        // Feeder
				_levelup_button.tooltip_text = "Increase power generation";
		        break;
			case 5:
		        // Hive
				_levelup_button.tooltip_text = "Increase drone maximum";
		        break;
		    default:
		        // code here
		        break;
		}
		show_button = false;
		recalculate_hotbar_spacing();
	}
}

generate_starting_buttons = function()
{
	//create other buttons for the row
	var _maxup_button = instance_create_layer(x + 174, y, "UI", obj_button_building_upgrades);
	var _levelup_button = instance_create_layer(x + 354, y, "UI", obj_button_building_upgrades);
	_maxup_button.upgrade_type = 0;
	_maxup_button.my_building_index = my_building_index;
	_levelup_button.upgrade_type = 1;
	_levelup_button.my_building_index = my_building_index;
	switch (my_building_index) {
		    case 0:
		        // Wall
				_levelup_button.tooltip_text = "Increase wall durability";
		        break;
			case 1:
		        // Turret
				_levelup_button.tooltip_text = "Increase turret bullet damage";
		        break;
	}
	show_button = false;
}