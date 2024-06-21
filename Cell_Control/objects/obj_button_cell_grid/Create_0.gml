event_inherited();

cell_row = -1;
cell_col = -1;

activate_button = function()
{
	if (!global.cell_locked[cell_row][cell_col]) {
		// Unlock cell in the same row
        if (global.cell_locked[cell_row][cell_col + 1]) {
            global.cell_locked[cell_row][cell_col + 1] = false;
        }

        // Unlock cell in the row above
        if (cell_row > 0 && global.cell_locked[cell_row - 1][cell_col + 1]) {
            global.cell_locked[cell_row - 1][cell_col + 1] = false;
        }

        // Unlock cell in the row below
        if (cell_row < 4 && global.cell_locked[cell_row + 1][cell_col + 1]) {
            global.cell_locked[cell_row + 1][cell_col + 1] = false;
			//show_message(string(global.cell_locked[cell_row + 1][cell_col + 1]))
        }
		
		//set player cell location and selected cell as cleared
		global.cell_cleared[cell_row][cell_col] = true;
		//global.player_cell = [cell_row][cell_col];
		
		//go to selected cell
	    alarm[0] = 1;
	} else {
	    show_debug_message("Room is locked!");
	}
}