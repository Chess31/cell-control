//set cursor sprite
window_set_cursor(cr_none);
cursor_sprite = s_cursor;

//show_debug_overlay(true);

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



//Lists for buildings and enemies

global.currentBuildingIndex = 0; //this number will determine which spot in each list to reference when placing a building

//Building Stats
global.buildingTypes = ds_list_create();
global.buildingHealths = ds_list_create();
global.buildingSprites = ds_list_create();
global.buildingCosts = ds_list_create();
global.buildingCount = ds_list_create();
global.buildingMaxNumber = ds_list_create();

// Add building types, healths, sprites, and costs
ds_list_add(global.buildingTypes, "Wall");
ds_list_add(global.buildingHealths, 75);
ds_list_add(global.buildingSprites, s_Wall);
ds_list_add(global.buildingCosts, 5);
ds_list_add(global.buildingCount, 4);
ds_list_add(global.buildingMaxNumber, 30);

ds_list_add(global.buildingTypes, "Turret");
ds_list_add(global.buildingHealths, 15);
ds_list_add(global.buildingSprites, s_Turret);
ds_list_add(global.buildingCosts, 15);
ds_list_add(global.buildingCount, 0);
ds_list_add(global.buildingMaxNumber, 15);

forge_unlocked = false;
upgrader_unlocked = false;
proximity_mine_unlocked = false;
feeder_unlocked = false;

//Enemy Stats
global.enemyTypes = ds_list_create();
global.enemyHealths = ds_list_create();
global.enemySprites = ds_list_create();
global.enemySpeeds = ds_list_create();

//Add enemy types
ds_list_add(global.enemyTypes, "Red");
ds_list_add(global.enemyHealths, 3);
ds_list_add(global.enemySprites, s_enemy);
ds_list_add(global.enemySpeeds, 2);

//display wave one message after the message log object is created (it doesn't exist yet)
alarm[0] = 1;

blue_unlocked = false;
green_unlocked = false;

global.feeder_active = false;