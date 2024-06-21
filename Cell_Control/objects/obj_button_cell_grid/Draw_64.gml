event_inherited();

// obj_button Draw event

// Check if the mouse is hovering over this button
if (hovering) {
	draw_set_color(c_white);
    
    // Draw lines to the adjacent buttons in the next column
    if (cell_col < 4) { // Ensure we are not in the last column

        // Draw line to the button in the same row
        if (!global.cell_locked[cell_row][cell_col]) {
            draw_line_width(x, y, x + 128, y, 1);
			
			//also draw the player marker here
			draw_sprite_ext(s_Player,0,x,y,.5,.5,90,c_white,1);
        }

        // Draw line to the button in the row above
        if (cell_row > 0 && !global.cell_locked[cell_row][cell_col]) {
            draw_line_width(x, y, x + 128, y - 128, 1);
        }

        // Draw line to the button in the row below
        if (cell_row < 4 && !global.cell_locked[cell_row][cell_col]) {
            draw_line_width(x, y, x + 128, y + 128, 1);
        }
    }
}

if (global.cell_locked[cell_row][cell_col] = true) {
	//Draw lock indicator
	draw_sprite_ext(s_lock,0,x,y-16,1,1,0,c_white,1);
}