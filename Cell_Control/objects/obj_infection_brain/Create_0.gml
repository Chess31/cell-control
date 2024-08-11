//type = "Brain"
action_points = 1000; //allow the infection to set ip starting defences
action_point_rate = 0.10;
state = 0; //growth mode (1 for attack mode)
actions_per_step = 1;
enemy_types = noone;
global.attacks_survived = 0;
enemies_per_attack = 3 + global.attacks_survived;
attack_timer = (30 * game_get_speed(gamespeed_fps)) + (global.attacks_survived * 2);
time_between_attacks = attack_timer;
spawn_indicator = noone;
attacks_between_bosses = 5;
global.barrier_count = 0;

enum ACTION_COSTS
{
    //BASIC = 25,
    BARRIER = 30,
    SPAWNER = 20,
    HEALER = 35,
    //HARVESTER = 40,
    //ALARM = 30,
    //VISION = 35,
	//ENERGYDRAIN = 50,
	//ENERGYBANK = 100, //piece that drops from a new enemy type and then nearby enemies use energy to fill it and create a fort
	//ENHANCER = 80,
	//EXPANDER = 60,
	SHIELD = 45,
	TURRET = 50
	//FORTIFICATION = 100
}

function add_infection_piece(_piece_type, _cost, _image_index) {
	//Choose a infection core to grow
	var _random_core = instance_find(obj_well, irandom(instance_number(obj_well) - 1))
	
	if (instance_exists(_random_core) && _random_core.branches < 5) {
		//Select where the piece will go
		var _length = irandom_range(50, 150);
		//var _direction = choose(72, 144, 216, 288, 360);
		
		var _core_branch_array = _random_core.available_branches;
		
		var _direction_list = ds_list_create();
			
		for (var i = 0; i < array_length(_core_branch_array); i++) {
			// Loop through the array and add possible angles
			if (_core_branch_array[i][1] == true) {
			    ds_list_add(_direction_list,i)
			}
		}
		
		var _random_available_index = irandom(ds_list_size(_direction_list) - 1);
		var _random_index = ds_list_find_value(_direction_list,_random_available_index);
		var _selected_angle = _core_branch_array[_random_index][0];
		//set the branch to not available
		_core_branch_array[_random_index][1] = false;
		
		ds_list_destroy(_direction_list);
		
		var _x = _random_core.x + lengthdir_x(_length, _selected_angle);
		var _y = _random_core.y + lengthdir_y(_length, _selected_angle);
	
		var _new_piece = instance_create_layer(_x, _y, "InfectionLayer", _piece_type);
		_new_piece.sprite_index = s_infection_pieces;
		_new_piece.image_index = _image_index;
		//_new_piece.branch_angle = _selected_angle;
		_new_piece.parent_id = _random_core;
		_new_piece.branch_index = _random_index;
		
		_random_core.branches++;
		action_points -= _cost;
	}
}