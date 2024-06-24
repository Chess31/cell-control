// Create a 5x5 array to hold the room data
global.cell = array_create(5);

// Initialize each cell
for (var i = 0; i < 5; i++) { //height
	
    global.cell[i] = array_create(5);
	
    for (var j = 0; j < 5; j++) { //width
        // Define the initial state of each room
        global.cell[i][j] = {
            locked: (j > 0), // Only the first column is unlocked initially
            cleared: false,
            player_is_here: (i == 0 && j == 0), // Player starts in the first room
			infection_cores: j + 1,
			energy_level: irandom_range(6 + j, 16 + j)
        };
    }
}

global.player_cell_x = -1;
global.player_cell_y = -1;

global.cell_path_coords = array_create(1,[50, display_get_gui_height()/2]);

global.core_power = 0;
global.true_core_power = 0;

//create cell buttons
var _button_width = 128;
var _button_height = 128;
var _start_x = 128;
var _start_y = 128;

for (var i = 0; i < 5; i++) { //grid height
    for (var j = 0; j < 5; j++) { //grid width
        var _btn_x = _start_x + j * _button_width;
        var _btn_y = _start_y + i * _button_height;
        var _button = instance_create_layer(_btn_x, _btn_y, "Instances", obj_button_cell_grid);
        _button.cell_row = i;
        _button.cell_col = j;
		_button.button_text = "Cell " + string((i+1)+(5*j));
    }
}

//Create core power shop

global.core_power_skill_tree = [
    { name: "Buildings", tier: 2, max_tier: 7},
    { name: "Health", tier: 0, max_tier: 5 },
    { name: "Rifts", tier: 0, max_tier: 3 }
];

global.available_buildings = global.core_power_skill_tree[0].tier;

//create power tree buttons
var _pbutton_width = 128;
var _pbutton_height = 64;
var _pstart_x = display_get_gui_width()*(3/4) - _pbutton_width;
var _pstart_y = display_get_gui_height()/2 + 15;

for (var a = 0; a < array_length(global.core_power_skill_tree); a++) { //grid width
    var _btn_x = _pstart_x + a * _pbutton_width;
    //var _btn_y = _pstart_y// + i * _pbutton_height;
    var _button = instance_create_layer(_btn_x, _pstart_y, "Instances", obj_button_corepower);
    _button.skill = a;
	_button.button_text = "Upgrade";
}