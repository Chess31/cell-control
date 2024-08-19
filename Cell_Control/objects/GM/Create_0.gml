//set cursor sprite
window_set_cursor(cr_none);
cursor_sprite = s_cursor;

// Set the timer for spawning collectibles
spawnTimer = 16; // Initial energy timer
//spawn_frequency = global.energy_rate; //frames between energy spawns

var i = 0;
while (i < 30)
{
	instance_create_layer(random(room_width), random(room_height), "Collectibles",obj_collectible);
	i += 1;
}

//set up cell core
instance_create_layer(room_width/2, room_height/2, "Instances", obj_cell_core);

//Create global building lists
global.building_types = ds_list_create();
global.building_healths = ds_list_create();
global.building_sprites = ds_list_create();
global.building_costs = ds_list_create();
global.building_count = ds_list_create();
global.building_max_number = ds_list_create();
global.building_maxup_cost = ds_list_create();
global.building_levels = ds_list_create();
global.building_levelup_cost = ds_list_create();
global.building_level_max = ds_list_create();

//ds_list_add(global.building_types,"Destroy Nearest", "Wall", "Turret", "Forge", "Upgrader", "Proximity Mine", "Feeder", "Hive"); //type
//ds_list_add(global.building_healths,		     10,	 75,	   15,		20,			50,				   5,      150,    100); //health
//ds_list_add(global.building_sprites,s_DestroyNearest,s_Wall, s_Turret, s_Forge, s_Upgrader,       s_ProxMine, s_Feeder, s_Hive); //sprite
//ds_list_add(global.building_costs,			      0,	  5,	   15,		30,			50,				   5,      300,    150); //cost
//ds_list_add(global.building_count,			      0,	  0,	    0,		 0,			 0,				   0,        0,      0); //number placed
//ds_list_add(global.building_max_number,			  1,	 20,		6,		 5,			 1,				   4,        1,      3); //max
//ds_list_add(global.building_maxup_cost,			  1,	  1,		3,		 3,			12,				   2,       20,     30); //maxup cost
//ds_list_add(global.building_levels,			      1,	  1,		1,		 1,			 1,				   1,        1,      1); //maxup cost
//ds_list_add(global.building_levelup_cost,		  1,	  5,		8,		15,			10,				   6,       25,     30); //levelup cost

ds_list_add(global.building_types,"Destroy Nearest", "Wall", "Turret", "Forge", "Proximity Mine", "Feeder",     "Hive"); //type
ds_list_add(global.building_healths,		      1,	 75,	   15,		20,				   5,      150,        100); //health
ds_list_add(global.building_sprites,s_DestroyNearest,s_Wall, s_Turret, s_Forge,       s_ProxMine, s_Feeder, s_Upgrader); //sprite
ds_list_add(global.building_costs,			      0,	  5,	   15,		30,				   5,      300,        150); //cost
ds_list_add(global.building_count,			      0,	  0,	    0,		 0,				   0,        0,          0); //number placed
ds_list_add(global.building_max_number,			  1,	 20,		6,		 5,			 	   4,        1,          3); //max
ds_list_add(global.building_maxup_cost,			  1,	  1,		3,		 3,				   2,       20,         30); //maxup cost
ds_list_add(global.building_levels,			      1,	  1,		1,		 1,				   1,        1,          1); //maxup cost
ds_list_add(global.building_levelup_cost,		  1,	  5,		8,		15,				   6,       25,         30); //levelup cost
ds_list_add(global.building_level_max,			  1,	  3,		3,		 8,				   6,        5,          3); //maxlevel

//Rifts
global.rift_types = ds_list_create();

//set up feeder building

global.feeder_active = false;
global.enemy_kill_goal = 10;
global.feeders_complete = 0;

//global.infections_destroyed = 0;

//global.difficulty = 0;
//global.difficulty_scalar = 0.05;

DefineEnemyPacks();
//Spawn Initial Enemy Well
alarm[0] = 1;
alarm[1] = 1 * game_get_speed(gamespeed_fps);