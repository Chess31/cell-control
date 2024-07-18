//type = "Brain"
action_points = 0;
action_point_rate = 0.10;
//action_timer = 0;
//action_cooldown = 5 * game_get_speed(gamespeed_fps);
state = 0; //growth mode (1 for attack mode)
actions_per_step = 4;

//Create the appropriate number of cores to start

enum ACTION_COSTS
{
    BASIC = 25,
    BARRIER = 30,
    SPAWNER = 50,
    HEALER = 35,
    HARVESTER = 40,
    ALARM = 30,
    VISION = 35,
	ENERGYDRAIN = 50,
	//ENERGYBANK = 100, //piece that drops from a new enemy type and then nearby enemies use energy to fill it and create a fort
	ENHANCER = 80,
	EXPANDER = 60,
	SHIELD = 45,
	FORTIFICATION = 100
}

function add_infection_piece(_piece_type, _cost) {
	//Choose a infection core to grow
	var _random_core = instance_find(obj_well, irandom(instance_number(obj_well) - 1))
	
	if (instance_exists(_random_core) && _random_core.branches < 5) {
		//Select where the piece will go
		var _length = irandom_range(50, 150);
		var _direction = choose(72, 144, 216, 288, 360);
		
		//var _core_branch_array = _random_core.available_branches;
		//var _direction = 0;
		
		var _x = _random_core.x + lengthdir_x(_length, _direction);
		var _y = _random_core.y + lengthdir_y(_length, _direction);
	
		var _new_piece = instance_create_layer(_x, _y, "InfectionLayer", _piece_type);
		_new_piece.sprite_index = s_infection_pieces;
		
		_random_core.branches++;
		action_points -= _cost;
	}
}