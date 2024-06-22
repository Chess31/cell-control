event_inherited();

// obj_button Draw event

// Check if the mouse is hovering over this button
if (hovering) {
	draw_set_color(c_white);
    
    // Draw lines to the adjacent buttons in the next column
    if (cell_col < 4) { // Ensure we are not in the last column

        // Draw line to the button in the same row
        if (!global.cell[cell_row][cell_col].locked) {
            draw_line_width(x, y, x + 128, y, 1);
			
			//also draw the player marker here
			draw_sprite_ext(s_Player,0,x,y,.5,.5,90,c_white,1);
        }

        // Draw line to the button in the row above
        if (cell_row > 0 && !global.cell[cell_row][cell_col].locked) {
            draw_line_width(x, y, x + 128, y - 128, 1);
        }

        // Draw line to the button in the row below
        if (cell_row < 4 && !global.cell[cell_row][cell_col].locked) {
            draw_line_width(x, y, x + 128, y + 128, 1);
        }
    }
	
	//Draw side menu
	// Menu position
    var menu_x = display_get_gui_width()*(3/4); // Adjust as needed
    var menu_y = 100; // Adjust as needed
    var menu_width = 180;
    var menu_height = 100;

    //// Draw menu background
    //draw_set_color(c_black);
    //draw_rectangle(menu_x, menu_y, menu_x + menu_width, menu_y + menu_height, false);

    // Draw menu text
    draw_set_color(c_white);
    draw_text(menu_x, menu_y + 10, "Room Data:");
    draw_text(menu_x, menu_y + 30, "Locked: " + string(global.cell[cell_row][cell_col].locked));
    draw_text(menu_x, menu_y + 50, "Infection Cores: " + string(global.cell[cell_row][cell_col].infection_cores));
    draw_text(menu_x, menu_y + 70, "Energy Level: " + string(global.cell[cell_row][cell_col].energy_level));
}

if (global.cell[cell_row][cell_col].locked = true) {
	//Draw lock indicator
	draw_sprite_ext(s_lock,0,x,y-16,1,1,0,c_white,1);
}