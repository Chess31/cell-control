function mainUpgraderOptions()
{
	MenuCreate(display_get_gui_width()- 230, 100,
				[
					["20 Health",tenHealth],
					["Increase Max Buildings",increaseMaxBuild],
					["Develop Weapon",developWeapon]
				],
				"Select Upgrade"
			);
}

function tenHealth()
{
	obj_player.playerHealth += 20;
	//kill the upgrader
	with(global.current_upgrader){buildingHealth -= 10000};
}

function increaseMaxBuild()
{
	//select available upgrades (not upgrader)
	var _random_number = irandom(ds_list_size(global.buildingTypes) - 1);
	while ((_random_number = ds_list_find_index(global.buildingTypes, "Upgrader")) || (_random_number = ds_list_find_index(global.buildingTypes, "Feeder")) || (_random_number = ds_list_find_index(global.buildingTypes, "Destroy Nearest"))){
		_random_number = irandom(ds_list_size(global.buildingTypes) - 1);
	}
	var _random_building_1 = ds_list_find_value(global.buildingTypes, _random_number);
	global.random_building = _random_number;
	MenuCreate(x, y,
			[
				["Type: " + string(_random_building_1),addToMaxBuildings],
				["Back",mainUpgraderOptions]
			],
			"Increase Max Buildings"
		);
}

function addToMaxBuildings()
{
	ds_list_replace(global.buildingMaxNumber, global.random_building, ds_list_find_value(global.buildingMaxNumber, global.random_building) + 5);
	//kill the upgrader
	with(global.current_upgrader){buildingHealth -= 10000};
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
		_warning_text.message_text = "Insufficient Materials";
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
		_warning_text.message_text = "Insufficient Materials";
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
		_warning_text.message_text = "Insufficient Materials";
	}
}