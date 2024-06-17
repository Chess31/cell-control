function mainUpgraderOptions()
{
	MenuCreate(display_get_gui_width()- 230, 100,
				[
					["20 Health",gainHealth],
					["Develop Buildings",increaseMaxBuild],
					["Develop Weapon",developWeapon]
				],
				"Select Upgrade"
			);
}

function gainHealth()
{
	obj_player.playerHealth += 20;
	//kill the upgrader
	with(global.current_upgrader){buildingHealth -= 10000};
}

function increaseMaxBuild()
{
	////select available upgrades (not upgrader)
	//var _random_number = irandom(ds_list_size(global.buildingTypes) - 1);
	//while ((_random_number = ds_list_find_index(global.buildingTypes, "Upgrader")) || (_random_number = ds_list_find_index(global.buildingTypes, "Feeder")) || (_random_number = ds_list_find_index(global.buildingTypes, "Destroy Nearest"))){
	//	_random_number = irandom(ds_list_size(global.buildingTypes) - 1);
	//}
	//var _random_building_1 = ds_list_find_value(global.buildingTypes, _random_number);
	//global.random_building = _random_number;
	MenuCreate(x, y,
			[
				["Wall (" + string(global.next_wall_cost) + ")", inc_wall],
				["Turret (" + string(global.next_turret_cost) + ")" ,inc_turret],
				["Forge (" + string (global.next_forge_cost) + ")", inc_forge],
				["Proximity Mine (" + string (global.next_proxmine_cost) + ")", inc_proxmine],
				["Hive (" + string (global.next_hive_cost) + ")", inc_hive],
				["Back",mainUpgraderOptions]
			],
			"Increase Max Buildings"
		);
}

//function addToMaxBuildings()
//{
//	ds_list_replace(global.buildingMaxNumber, global.random_building, ds_list_find_value(global.buildingMaxNumber, global.random_building) + 5);
//	//kill the upgrader
//	with(global.current_upgrader){buildingHealth -= 10000};
//}

function inc_wall()
{
	var _index = ds_list_find_index(global.buildingTypes, "Wall");
	if (obj_player.weaponTokens >= global.next_wall_cost){
		ds_list_replace(global.buildingMaxNumber, _index, ds_list_find_value(global.buildingMaxNumber, _index) + 1);
		obj_player.weaponTokens -= global.next_wall_cost;
		global.next_wall_cost = 1;//ceil(global.next_wall_cost * global.wall_cost_multiplier);
		increaseMaxBuild();//with(global.current_upgrader){buildingHealth -= 10000};
	} else {
		increaseMaxBuild();
		var _warning_text = instance_create_layer(obj_player.x, obj_player.y - 30, "Instances", obj_message);
		_warning_text.message_text = "Special Energy Needed";
	}
}
function inc_turret()
{
	var _index = ds_list_find_index(global.buildingTypes, "Turret");
	if (obj_player.weaponTokens >= global.next_turret_cost){
		ds_list_replace(global.buildingMaxNumber, _index, ds_list_find_value(global.buildingMaxNumber, _index) + 1);
		obj_player.weaponTokens -= global.next_turret_cost;
		global.next_turret_cost = max(global.next_turret_cost + 1, floor(global.next_turret_cost * global.turret_cost_multiplier));
		increaseMaxBuild();//with(global.current_upgrader){buildingHealth -= 10000};
	} else {
		increaseMaxBuild();
		var _warning_text = instance_create_layer(obj_player.x, obj_player.y - 30, "Instances", obj_message);
		_warning_text.message_text = "Special Energy Needed";
	}
}
function inc_forge()
{
	var _index = ds_list_find_index(global.buildingTypes, "Forge");
	if (obj_player.weaponTokens >= global.next_forge_cost){
		ds_list_replace(global.buildingMaxNumber, _index, ds_list_find_value(global.buildingMaxNumber, _index) + 1);
		obj_player.weaponTokens -= global.next_forge_cost;
		global.next_forge_cost = floor(global.next_forge_cost * global.forge_cost_multiplier);
		increaseMaxBuild();//with(global.current_upgrader){buildingHealth -= 10000};
	} else {
		increaseMaxBuild();
		var _warning_text = instance_create_layer(obj_player.x, obj_player.y - 30, "Instances", obj_message);
		_warning_text.message_text = "Special Energy Needed";
	}
}
function inc_proxmine()
{
	var _index = ds_list_find_index(global.buildingTypes, "Proximity Mine");
	if (obj_player.weaponTokens >= global.next_proxmine_cost){
		ds_list_replace(global.buildingMaxNumber, _index, ds_list_find_value(global.buildingMaxNumber, _index) + 1);
		obj_player.weaponTokens -= global.next_proxmine_cost;
		global.next_proxmine_cost = floor(global.next_proxmine_cost * global.proxmine_cost_multiplier);
		increaseMaxBuild();//with(global.current_upgrader){buildingHealth -= 10000};
	} else {
		increaseMaxBuild();
		var _warning_text = instance_create_layer(obj_player.x, obj_player.y - 30, "Instances", obj_message);
		_warning_text.message_text = "Special Energy Needed";
	}
}
function inc_hive()
{
	var _index = ds_list_find_index(global.buildingTypes, "Hive");
	if (obj_player.weaponTokens >= global.next_hive_cost){
		ds_list_replace(global.buildingMaxNumber, _index, ds_list_find_value(global.buildingMaxNumber, _index) + 1);
		obj_player.weaponTokens -= global.next_hive_cost;
		global.next_hive_cost = floor(global.next_hive_cost * global.hive_cost_multiplier);
		increaseMaxBuild();//with(global.current_upgrader){buildingHealth -= 10000};
	} else {
		increaseMaxBuild();
		var _warning_text = instance_create_layer(obj_player.x, obj_player.y - 30, "Instances", obj_message);
		_warning_text.message_text = "Special Energy Needed";
	}
}

function developWeapon()
{
	MenuCreate(x, y,
			[
				["Disk Whisk (10)", equipDiskWhisk],
				["Gravity Globber (20)",equipGravityGlobber],
				["Tripler Crippler (15)",equipTriplerCrippler],
				["Back",mainUpgraderOptions]
			],
			"Select Weapon to Build"
		);
}

function equipDiskWhisk()
{
	if (obj_player.weaponTokens >= 10){
		obj_player.shiftSlot = "shift1";
		obj_player.weaponTokens -= 10;
		with(global.current_upgrader){buildingHealth -= 10000};
	} else {
		developWeapon();
		var _warning_text = instance_create_layer(obj_player.x, obj_player.y - 30, "Instances", obj_message);
		_warning_text.message_text = "Special Energy Needed";
	}
}

function equipGravityGlobber()
{
	if (obj_player.weaponTokens >= 20){
		obj_player.altSlot = "alt1";
		obj_player.weaponTokens -= 20;
		with(global.current_upgrader){buildingHealth -= 10000};
	} else {
		developWeapon();
		var _warning_text = instance_create_layer(obj_player.x, obj_player.y - 30, "Instances", obj_message);
		_warning_text.message_text = "Special Energy Needed";
	}
}

function equipTriplerCrippler()
{
	if (obj_player.weaponTokens >= 15){
		obj_player.comboSlot = "combo1";
		obj_player.weaponTokens -= 15;
		with(global.current_upgrader){buildingHealth -= 10000};
	} else {
		developWeapon();
		var _warning_text = instance_create_layer(obj_player.x, obj_player.y - 30, "Instances", obj_message);
		_warning_text.message_text = "Special Energy Needed";
	}
}