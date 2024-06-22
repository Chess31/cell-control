event_inherited();

cell_row = -1;
cell_col = -1;

activate_button = function()
{
	if (!global.cell[cell_row][cell_col].locked) {
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
		
		//set player cell location and selected cell as cleared
		global.cell[cell_row][cell_col].cleared = true;
		global.cell[cell_row][cell_col].player_is_here = true;
		
		//go to selected cell
	    alarm[0] = 1;
	} else {
	    show_debug_message("Room is locked!");
	}
}