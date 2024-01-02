function tenHealth()
{
	obj_player.playerHealth += 20;
	//with (self){instance_destroy()}
	//add code here so that each option will destroy the building it was created from
	//maybe a variable called optionSelected which is set to be true here and is what destroys the upgrader
}

function increaseMaxBuild()
{
	//select available upgrades (not upgrader)
	var _random_number = irandom(ds_list_size(global.buildingTypes) - 1);
	while (_random_number = ds_list_find_index(global.buildingTypes, "Upgrader")){
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
}