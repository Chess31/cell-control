//combine these into a struct ? (maybe in a script so this room doesn't need to be persistent)

// Create a 5x5 array to hold the room data
global.cell = array_create(5);

// Initialize each row in the array
for (var i = 0; i < 5; i++) {
    global.cell[i] = array_create(5);
    
    for (var j = 0; j < 5; j++) {
        // Define the initial state of each room
        global.cell[i][j] = {
            locked: (j > 0), // Only the first column is unlocked initially
            cleared: false,
            player_is_here: (i == 0 && j == 0), // Player starts in the first room
			infection_cores: 1,
			energy_level: 100
        };
    }
}

//// Example reference
//global.cell[0][0].locked = false;





//global.cell_locked = [
//    [false, true, true, true, true],
//    [false, true, true, true, true],
//    [false, true, true, true, true],
//    [false, true, true, true, true],
//    [false, true, true, true, true]
//];

//global.cell_cleared = [
//    [false, false, false, false, false],
//    [false, false, false, false, false],
//	[false, false, false, false, false],
//    [false, false, false, false, false],
//    [false, false, false, false, false]
//];

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