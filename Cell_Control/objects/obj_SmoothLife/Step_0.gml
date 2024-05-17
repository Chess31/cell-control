					//// Check for space bar press to advance one step
					//if (keyboard_check_pressed(vk_space)) {
					//    update_grid(); // Advance simulation by one step
					//}
					//update_grid();
					
// Update grid based on player interaction
if (mouse_check_button(mb_left)) {
    var _mouse_x = mouse_x div cell_size;
    var _mouse_y = mouse_y div cell_size;
    if (_mouse_x >= 0 && _mouse_x < grid_width && _mouse_y >= 0 && _mouse_y < grid_height) {
        grid[_mouse_x, _mouse_y] = 1; // Set cell to alive at mouse position
    }
}

if (mouse_check_button(mb_right)) {
    var _mouse_x = mouse_x div cell_size;
    var _mouse_y = mouse_y div cell_size;
    if (_mouse_x >= 0 && _mouse_x < grid_width && _mouse_y >= 0 && _mouse_y < grid_height) {
        grid[_mouse_x, _mouse_y] = 0; // Set cell to alive at mouse position
    }
}

// Check for space bar press to advance one step
if (keyboard_check(vk_space)) {
    update_grid(); // Advance simulation by one step
	
	// Introduce live cells based on probability
	for (var _x = 0; _x < grid_width; _x++) {
	    for (var _y = 0; _y < grid_height; _y++) {
	        if (random(1) < initial_alive_probability) {
	            grid[_x, _y] = 1; // Set cell to alive
	        }
	    }
	}
	// Introduce dead cells based on probability
	for (var _x = 0; _x < grid_width; _x++) {
	    for (var _y = 0; _y < grid_height; _y++) {
	        if (random(1) < initial_dead_probability) {
	            grid[_x, _y] = 0; // Set cell to alive
	        }
	    }
	}
}

