draw_self();

// Get the direction towards the mouse
var playerDirection = point_direction(x, y, mouse_x, mouse_y);

// Placement Mode logic
if (isDeployingWall) {
    // Set the wall's position to be in front of the player
    var wallX = x + lengthdir_x(32, playerDirection);
    var wallY = y + lengthdir_y(32, playerDirection);

    // Draw a preview of the wall
    draw_sprite_ext(ds_list_find_value(global.buildingSprites, global.currentBuildingIndex), 0, wallX, wallY, 1, 1, playerDirection, c_white, .3);
	
	// Draw the current building type and cost on the screen as text
	draw_set_color(c_white);
	draw_text(x - 20, y + 40, ds_list_find_value(global.buildingTypes, global.currentBuildingIndex));
	draw_text(x - 20, y + 60, ds_list_find_value(global.buildingCosts, global.currentBuildingIndex));
}

// Function to draw the max building alert
if (show_max_built_message = true) {
    // Set the draw color, font, and size
    draw_set_color(c_red);
    
    // Calculate the position in the top right corner ?
    var alertX = display_get_width() - 250;
    var alertY = 10;
	var _text_time = 2000;
    for (var i = 0; i < _text_time; ++i) {
	    // Draw the alert text
		draw_text(x, y - 25, "Maximum number of " + string(ds_list_find_value(global.buildingTypes, global.currentBuildingIndex)) + " built!");
		if (i = _text_time)
		{
			show_max_built_message = false;
		}
	}
    //show_max_built_message = false;
    // Reset draw settings
    draw_set_color(c_white);
}