event_inherited();

button_text = noone;

my_building_index = 0;

activate_button = function()
{
	// Add building types, healths, sprites, and costs
	
	if (my_building_index = 0 and global.wall_unlocked = false) {
		ds_list_add(global.buildingTypes, "Wall");
		ds_list_add(global.buildingHealths, 75);
		ds_list_add(global.buildingSprites, s_Wall);
		ds_list_add(global.buildingCosts, 5);
		ds_list_add(global.buildingCount, 0);
		ds_list_add(global.buildingMaxNumber, 20 + (6 - global.gamemode*3));
		
		global.wall_unlocked = true;
	}

	if (my_building_index = 1 and global.turret_unlocked = false) {
		ds_list_add(global.buildingTypes, "Turret");
		ds_list_add(global.buildingHealths, 15);
		ds_list_add(global.buildingSprites, s_Turret);
		ds_list_add(global.buildingCosts, 15);
		ds_list_add(global.buildingCount, 0);
		ds_list_add(global.buildingMaxNumber, 3 + (2 - global.gamemode));
		
		global.turret_unlocked = true;
	}

	if (my_building_index = 2 and global.forge_unlocked = false) {
		ds_list_add(global.buildingTypes, "Forge");
		ds_list_add(global.buildingHealths, 20);
		ds_list_add(global.buildingSprites, s_Forge);
		ds_list_add(global.buildingCosts, 30);
		ds_list_add(global.buildingCount, 0);
		ds_list_add(global.buildingMaxNumber, 5 + (2 - global.gamemode));
		
		global.forge_unlocked = true;
	}

	if (my_building_index = 3 and global.upgrader_unlocked = false) {
		ds_list_add(global.buildingTypes, "Upgrader");
		ds_list_add(global.buildingHealths, 50);
		ds_list_add(global.buildingSprites, s_Upgrader);
		ds_list_add(global.buildingCosts, 50);
		ds_list_add(global.buildingCount, 0);
		ds_list_add(global.buildingMaxNumber, 1);
		
		global.upgrader_unlocked = true;
	}

	if (my_building_index = 4 and global.proxmine_unlocked = false) {
		ds_list_add(global.buildingTypes, "Proximity Mine");
		ds_list_add(global.buildingHealths, 5);
		ds_list_add(global.buildingSprites, s_ProxMine);
		ds_list_add(global.buildingCosts, 5);
		ds_list_add(global.buildingCount, 0);
		ds_list_add(global.buildingMaxNumber, 2);
		
		global.proxmine_unlocked = true;
	}

	if (my_building_index = 5 and global.feeder_unlocked = false) {
		ds_list_add(global.buildingTypes, "Feeder");
		ds_list_add(global.buildingHealths, 300);
		ds_list_add(global.buildingSprites, s_Feeder);
		ds_list_add(global.buildingCosts, 150);
		ds_list_add(global.buildingCount, 0);
		ds_list_add(global.buildingMaxNumber, 1);
		
		global.feeder_unlocked = true;
	}

	if (my_building_index = 6 and global.hive_unlocked = false) {
		ds_list_add(global.buildingTypes, "Hive");
		ds_list_add(global.buildingHealths, 100);
		ds_list_add(global.buildingSprites, s_Hive);
		ds_list_add(global.buildingCosts, 200);
		ds_list_add(global.buildingCount, 0);
		ds_list_add(global.buildingMaxNumber, 1);
		
		global.hive_unlocked = true;
	}
}