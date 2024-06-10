//set cursor sprite
window_set_cursor(cr_none);
cursor_sprite = s_cursor;

// Set the timer for spawning collectibles
spawnTimer = 10; // Adjust this value to control spawn frequency

var i = 0;
while (i < 10)
{
	instance_create_layer(random(room_width), random(room_height), "Collectibles",obj_collectible);
	i += 1;
}

//set up cell core
instance_create_layer(room_width/2, room_height/2, "Instances", obj_cell_core);

//Lists for buildings

global.currentBuildingIndex = 0; //this number will determine which spot in each list to reference when placing a building

//Building Stats
global.buildingTypes = ds_list_create();
global.buildingHealths = ds_list_create();
global.buildingSprites = ds_list_create();
global.buildingCosts = ds_list_create();
global.buildingCount = ds_list_create();
global.buildingMaxNumber = ds_list_create();

// Add building types, healths, sprites, and costs
ds_list_add(global.buildingTypes, "Destroy Nearest");
ds_list_add(global.buildingHealths, 10);
ds_list_add(global.buildingSprites, s_DestroyNearest);
ds_list_add(global.buildingCosts, 0);
ds_list_add(global.buildingCount, 0);
ds_list_add(global.buildingMaxNumber, 1);

ds_list_add(global.buildingTypes, "Wall");
ds_list_add(global.buildingHealths, 75);
ds_list_add(global.buildingSprites, s_Wall);
ds_list_add(global.buildingCosts, 5);
ds_list_add(global.buildingCount, 0);
ds_list_add(global.buildingMaxNumber, 15);

ds_list_add(global.buildingTypes, "Turret");
ds_list_add(global.buildingHealths, 15);
ds_list_add(global.buildingSprites, s_Turret);
ds_list_add(global.buildingCosts, 15);
ds_list_add(global.buildingCount, 0);
ds_list_add(global.buildingMaxNumber, 3);

ds_list_add(global.buildingTypes, "Forge");
ds_list_add(global.buildingHealths, 20);
ds_list_add(global.buildingSprites, s_Forge);
ds_list_add(global.buildingCosts, 30);
ds_list_add(global.buildingCount, 0);
ds_list_add(global.buildingMaxNumber, 5);
	
ds_list_add(global.buildingTypes, "Upgrader");
ds_list_add(global.buildingHealths, 50);
ds_list_add(global.buildingSprites, s_Upgrader);
ds_list_add(global.buildingCosts, 50);
ds_list_add(global.buildingCount, 0);
ds_list_add(global.buildingMaxNumber, 1);

ds_list_add(global.buildingTypes, "Proximity Mine");
ds_list_add(global.buildingHealths, 5);
ds_list_add(global.buildingSprites, s_ProxMine);
ds_list_add(global.buildingCosts, 5);
ds_list_add(global.buildingCount, 0);
ds_list_add(global.buildingMaxNumber, 2);
	
ds_list_add(global.buildingTypes, "Feeder");
ds_list_add(global.buildingHealths, 300);
ds_list_add(global.buildingSprites, s_Feeder);
ds_list_add(global.buildingCosts, 150);
ds_list_add(global.buildingCount, 0);
ds_list_add(global.buildingMaxNumber, 1);
	
ds_list_add(global.buildingTypes, "Hive");
ds_list_add(global.buildingHealths, 100);
ds_list_add(global.buildingSprites, s_Hive);
ds_list_add(global.buildingCosts, 1);
ds_list_add(global.buildingCount, 0);
ds_list_add(global.buildingMaxNumber, 200);
	
//ds_list_add(global.buildingTypes, "Crafter");
//ds_list_add(global.buildingHealths, 20);
//ds_list_add(global.buildingSprites, s_Crafter);
//ds_list_add(global.buildingCosts, 1);
//ds_list_add(global.buildingCount, 0);
//ds_list_add(global.buildingMaxNumber, 5);

global.feeder_active = false;
global.enemy_kill_goal = 10;
global.feeders_complete = 0;

global.infections_destroyed = 0;

global.difficulty = 0;
global.difficulty_scalar = 0.05;

DefineEnemyPacks();
//Spawn Initial Enemy Well
alarm[0] = 1;