//enum UpgradeID
//{
//	speedboost,
//	bulletspeedboost,
//	reloadboost,
//	explosiveammo,
//	placeShield, //gain a shield after placing a building
//	killShield, //gain a shield after killing an enemy
//	shockwave,
//	buildingAmplifier, //gain damage boost based on how many buildings are placed
//	//This kind of thing where an attribute is activated by doing some small action like placing a building or something seems like the right way to go
//	sniper, //extra damage, slower reload
//	buildingCost, //drops building placement price
//	criticalStrike, //enables critical strikes
//	ricochetRounds, //choas bolt mechanics from dnd
//	magnet
//}

function Upgrade(_name, _image_index, _description, _effect_function, _cooldown, _duration) constructor
{
	upgrade_name = _name;
	texture = _image_index;
	description = _description
	effect_function = _effect_function
	cooldown = _cooldown //time until the ability can be used again
	duration = _duration //time until the ability effect wears off
}

// Upgrade effect functions
function effect_sprint_boost(_apply) {
	if (_apply) {
	    // Increase move speed by 20% for 5 seconds after killing an enemy
	    obj_player.walkSpeed += 3;
	} else {
		obj_player.walkSpeed -= 3;
	}
}

function effect_damage_boost(_apply) {
	if (_apply) {
		// Increase bullet damage by 5
		global.damage_mod += 5;
		obj_player.walkSpeed -= 3;
		obj_player.player_color = c_red;
	} else {
		global.damage_mod -= 5;
		obj_player.walkSpeed += 3;
		obj_player.player_color = c_white;
	}
}

function effect_fast_rounds(_apply) {
	if (_apply) {
		// Increase bullet damage by 5
		global.bullet_speed_mod += 8;
	} else {
		global.bullet_speed_mod -= 8;
	}
}

function effect_wall_blast(_apply) {
	if (_apply) {
		//clear the area of walls
		var _nearest_wall = instance_nearest(obj_player.x, obj_player.y,obj_cellWall);
		if (instance_exists(_nearest_wall)) && (point_distance(obj_player.x, obj_player.y, _nearest_wall.x, _nearest_wall.y) < 70) {
			with (obj_cellWall) {
				//check all walls for being to close to the well
				if (point_distance(x, y, obj_player.x, obj_player.y) < 70){instance_destroy()};
			}
		}
	} else {
		//No effect to remove
	}
}

function effect_infinite_bullets(_apply) {
	if (_apply) {
		global.primary_bullet_discount = 1;
		obj_player.player_color = c_aqua;
	} else {
		global.primary_bullet_discount = 0;
		obj_player.player_color = c_white;
	}
}

// Define other effect functions similarly...

//Lists for Upgrades

//global.upgrade_index = 0; //this number will determine which spot in each list to reference when using an upgrade

//Upgrade Lists
global.upgrade_name = ds_list_create();
global.upgrade_description = ds_list_create();
global.upgrade_function = ds_list_create();
global.upgrade_cooldown = ds_list_create();
global.upgrade_duration = ds_list_create();

ds_list_add(global.upgrade_name, "Dash");
ds_list_add(global.upgrade_description, "Quickly move for a short moment");
ds_list_add(global.upgrade_function, effect_sprint_boost);
ds_list_add(global.upgrade_cooldown, 120); // 2 seconds (60 * 2)
ds_list_add(global.upgrade_duration, 15);

ds_list_add(global.upgrade_name, "Power Shot");
ds_list_add(global.upgrade_description, "Temporarily shoot hight damage bullets");
ds_list_add(global.upgrade_function, effect_damage_boost);
ds_list_add(global.upgrade_cooldown, 120); // 2 seconds (60 * 2)
ds_list_add(global.upgrade_duration, 120);

ds_list_add(global.upgrade_name, "Quick Shot");
ds_list_add(global.upgrade_description, "Temporarily shoot fast bullets");
ds_list_add(global.upgrade_function, effect_fast_rounds);
ds_list_add(global.upgrade_cooldown, 120); // 2 seconds (60 * 2)
ds_list_add(global.upgrade_duration, 120);

ds_list_add(global.upgrade_name, "Wall Blast");
ds_list_add(global.upgrade_description, "Destroy nearby walls");
ds_list_add(global.upgrade_function, effect_wall_blast);
ds_list_add(global.upgrade_cooldown, 180); // 3 seconds (60 * 3)
ds_list_add(global.upgrade_duration, 0); //one time ability

ds_list_add(global.upgrade_name, "Infinite Ammo");
ds_list_add(global.upgrade_description, "Normal gun does not cost energy");
ds_list_add(global.upgrade_function, effect_infinite_bullets);
ds_list_add(global.upgrade_cooldown, 600); // 10 seconds (60 * 10)
ds_list_add(global.upgrade_duration, 360);