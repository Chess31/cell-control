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
	while ((_random_number = ds_list_find_index(global.buildingTypes, "Upgrader")) || (_random_number = ds_list_find_index(global.buildingTypes, "Feeder"))){
		_random_number = irandom(ds_list_size(global.buildingTypes) - 1);
	}
	var _random_building_1 = ds_list_find_value(global.buildingTypes, _random_number);
	global.random_building = _random_number;
	MenuCreate(x, y,
			[
				["Type: " + string(_random_building_1),addToMaxBuildings]
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