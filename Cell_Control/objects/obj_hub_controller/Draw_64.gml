draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);

draw_text(10,10,"Select Cell");

draw_set_halign(fa_center);

draw_text(display_get_gui_width()*(3/4), display_get_gui_height()/2 - 50, "Core Power: " + string(global.core_power));
draw_text(display_get_gui_width()*(3/4) - 128, display_get_gui_height()/2 - 30, "Buildings:");
draw_text(display_get_gui_width()*(3/4), display_get_gui_height()/2 - 30, "Core Health:");
draw_text(display_get_gui_width()*(3/4) + 128, display_get_gui_height()/2 - 30, "Rifts:");

//Draw player path
if (array_length(global.cell_path_coords) > 1) {
    draw_set_color(c_green); // Set the color for the path line

    // Iterate through the list and draw lines between consecutive points
    for (var i = 0; i < array_length(global.cell_path_coords) - 1; i++) {
        var start_x = global.cell_path_coords[i][0];
        var start_y = global.cell_path_coords[i][1];
        var end_x = global.cell_path_coords[i + 1][0];
        var end_y = global.cell_path_coords[i + 1][1];

        draw_line_width(start_x, start_y, end_x, end_y,3);
    }
}

//Draw player in starting position if not in a cell yet
if (global.player_cell_x = -1 and global.player_cell_y = -1) {
	draw_sprite_ext(s_Player,0, 50, display_get_gui_height()/2, .5, .5, 90, c_white, 1);
} else if (global.player_cell_x = 4) {
	draw_set_color(c_aqua);
	draw_set_halign(fa_center);
	draw_text(display_get_gui_width()/2, 20, "You Win!");
}