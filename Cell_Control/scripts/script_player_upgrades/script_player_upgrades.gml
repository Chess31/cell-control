enum UpgradeID
{
	speedboost,
	bulletspeedboost,
	reloadboost,
	explosiveammo,
	placeShield, //gain a shield after placing a building
	killShield, //gain a shield after killing an enemy
	shockwave,
	buildingAmplifier, //gain damage boost based on how many buildings are placed
	//This kind of thing where an attribute is activated by doing some small action like placing a building or something seems like the right way to go
	sniper, //extra damage, slower reload
	buildingCost, //drops building placement price
	criticalStrike, //enables critical strikes
	ricochetRounds, //choas bolt mechanics from dnd
	magnet
}

function Upgrade(_type, _image_index, _description, _effect_function, _cooldown, _duration) constructor
{
	upgrade_id = _type;
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

function effect_precision_rounds(_apply) {
	if (_apply) {
		// Increase bullet damage by 5
		global.damage_mod = 5;
	} else {
		global.damage_mod = 0;
	}
}

function effect_fast_rounds(_apply) {
	if (_apply) {
		// Increase bullet damage by 5
		global.bullet_speed_mod = 8;
	} else {
		global.bullet_speed_mod = 0;
	}
}

// Define other effect functions similarly...

//Lists for Upgrades

global.upgrade_index = 0; //this number will determine which spot in each list to reference when using an upgrade

//Upgrade Lists
global.upgrade_index = ds_list_create();
global.upgrade_description = ds_list_create();
global.upgrade_function = ds_list_create();
global.upgrade_cooldown = ds_list_create();
global.upgrade_duration = ds_list_create();