event_inherited();

cell_row = -1;
cell_col = -1;

activate_button = function()
{
	//must be unlocked and in the next column from the player in order to move here
	if (!global.cell[cell_row][cell_col].locked && (cell_col > global.player_cell_x)) {
		if (cell_col < 4){
			// Unlock cell in the same row
	        if (global.cell[cell_row][cell_col + 1].locked) {
	            global.cell[cell_row][cell_col + 1].locked = false;
	        }

	        // Unlock cell in the row above
	        if (cell_row > 0 && global.cell[cell_row - 1][cell_col + 1].locked) {
	            global.cell[cell_row - 1][cell_col + 1].locked = false;
	        }

	        // Unlock cell in the row below
	        if (cell_row < 4 && global.cell[cell_row + 1][cell_col + 1].locked) {
	            global.cell[cell_row + 1][cell_col + 1].locked = false;
	        }
		}
		
		//set player cell location and selected cell as cleared
		global.cell[cell_row][cell_col].cleared = true;
		//global.cell[cell_row][cell_col].player_is_here = true;
		global.player_cell_x = cell_col;
		global.player_cell_y = cell_row;
		
		array_push(global.cell_path_coords, [x, y]);
		
		//go to selected cell
	    alarm[0] = 1;
	} else {
	    //show_debug_message("Room is locked!");
	}
}