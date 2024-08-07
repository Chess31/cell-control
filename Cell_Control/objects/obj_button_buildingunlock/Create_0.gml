event_inherited();

button_text = noone;

my_building_index = 0;

draw_highlight = function()
{
	//draw a box around the unlocked row
	draw_rectangle(x - 50, y - 20, x + 400, y + 18, true);
}
draw_max = function()
{
	//draw max placed building in the second column
	var _current_max = ds_list_find_value(global.building_max_number, my_building_index + 1);
	draw_text(x + 174, y, string(_current_max));
}

activate_button = function()
{
	array_push(obj_player.available_buildings, my_building_index + 1);
	
	//if (my_building_index = 0 and global.wall_unlocked = false) {
	//	ds_list_add(global.buildingTypes, ds_list_find_value(global.all_building_types, my_building_index+1));
	//	ds_list_add(global.buildingHealths, ds_list_find_value(global.all_building_healths, my_building_index+1));
	//	ds_list_add(global.buildingSprites, ds_list_find_value(global.all_building_sprites, my_building_index+1));
	//	ds_list_add(global.buildingCosts, ds_list_find_value(global.all_building_costs, my_building_index+1));
	//	ds_list_add(global.buildingCount, 0);
	//	ds_list_add(global.buildingMaxNumber, ds_list_find_value(global.all_building_max_number, my_building_index+1)); //+ (6 - global.gamemode*3));
		
	//	global.wall_unlocked = true;
	//}

	//if (my_building_index = 1 and global.turret_unlocked = false) {
	//	ds_list_add(global.buildingTypes, ds_list_find_value(global.all_building_types, my_building_index+1));
	//	ds_list_add(global.buildingHealths, ds_list_find_value(global.all_building_healths, my_building_index+1));
	//	ds_list_add(global.buildingSprites, ds_list_find_value(global.all_building_sprites, my_building_index+1));
	//	ds_list_add(global.buildingCosts, ds_list_find_value(global.all_building_costs, my_building_index+1));
	//	ds_list_add(global.buildingCount, 0);
	//	ds_list_add(global.buildingMaxNumber, ds_list_find_value(global.all_building_max_number, my_building_index+1)); // + (2 - global.gamemode));
		
	//	global.turret_unlocked = true;
	//}

	//if (my_building_index = 2 and global.forge_unlocked = false) {
	//	ds_list_add(global.buildingTypes, ds_list_find_value(global.all_building_types, my_building_index+1));
	//	ds_list_add(global.buildingHealths, ds_list_find_value(global.all_building_healths, my_building_index+1));
	//	ds_list_add(global.buildingSprites, ds_list_find_value(global.all_building_sprites, my_building_index+1));
	//	ds_list_add(global.buildingCosts, ds_list_find_value(global.all_building_costs, my_building_index+1));
	//	ds_list_add(global.buildingCount, 0);
	//	ds_list_add(global.buildingMaxNumber, ds_list_find_value(global.all_building_max_number, my_building_index+1)); // + (2 - global.gamemode));
		
	//	global.forge_unlocked = true;
	//}

	//if (my_building_index = 3 and global.upgrader_unlocked = false) {
	//	ds_list_add(global.buildingTypes, ds_list_find_value(global.all_building_types, my_building_index+1));
	//	ds_list_add(global.buildingHealths, ds_list_find_value(global.all_building_healths, my_building_index+1));
	//	ds_list_add(global.buildingSprites, ds_list_find_value(global.all_building_sprites, my_building_index+1));
	//	ds_list_add(global.buildingCosts, ds_list_find_value(global.all_building_costs, my_building_index+1));
	//	ds_list_add(global.buildingCount, 0);
	//	ds_list_add(global.buildingMaxNumber, ds_list_find_value(global.all_building_max_number, my_building_index+1));
		
	//	global.upgrader_unlocked = true;
	//}

	//if (my_building_index = 4 and global.proxmine_unlocked = false) {
	//	ds_list_add(global.buildingTypes, ds_list_find_value(global.all_building_types, my_building_index+1));
	//	ds_list_add(global.buildingHealths, ds_list_find_value(global.all_building_healths, my_building_index+1));
	//	ds_list_add(global.buildingSprites, ds_list_find_value(global.all_building_sprites, my_building_index+1));
	//	ds_list_add(global.buildingCosts, ds_list_find_value(global.all_building_costs, my_building_index+1));
	//	ds_list_add(global.buildingCount, 0);
	//	ds_list_add(global.buildingMaxNumber, ds_list_find_value(global.all_building_max_number, my_building_index+1));
		
	//	global.proxmine_unlocked = true;
	//}

	//if (my_building_index = 5 and global.feeder_unlocked = false) {
	//	ds_list_add(global.buildingTypes, ds_list_find_value(global.all_building_types, my_building_index+1));
	//	ds_list_add(global.buildingHealths, ds_list_find_value(global.all_building_healths, my_building_index+1));
	//	ds_list_add(global.buildingSprites, ds_list_find_value(global.all_building_sprites, my_building_index+1));
	//	ds_list_add(global.buildingCosts, ds_list_find_value(global.all_building_costs, my_building_index+1));
	//	ds_list_add(global.buildingCount, 0);
	//	ds_list_add(global.buildingMaxNumber, ds_list_find_value(global.all_building_max_number, my_building_index+1));
		
	//	global.feeder_unlocked = true;
	//}

	//if (my_building_index = 6 and global.hive_unlocked = false) {
	//	ds_list_add(global.buildingTypes, ds_list_find_value(global.all_building_types, my_building_index+1));
	//	ds_list_add(global.buildingHealths, ds_list_find_value(global.all_building_healths, my_building_index+1));
	//	ds_list_add(global.buildingSprites, ds_list_find_value(global.all_building_sprites, my_building_index+1));
	//	ds_list_add(global.buildingCosts, ds_list_find_value(global.all_building_costs, my_building_index+1));
	//	ds_list_add(global.buildingCount, 0);
	//	ds_list_add(global.buildingMaxNumber, ds_list_find_value(global.all_building_max_number, my_building_index+1));
		
	//	global.hive_unlocked = true;
	//}
}