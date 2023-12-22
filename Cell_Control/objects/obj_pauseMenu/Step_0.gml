//Pause Menu Code
if (keyboard_check_pressed(vk_escape)){
    global.isPaused = !global.isPaused; // Toggle pause state
}

if (global.isPaused) {
    // Stop the game
    instance_deactivate_all(true);
	instance_activate_object(obj_menu);
    
    if (!instance_exists(obj_menu)) {
		pauseMenu();
		show_debug_message("menu called");
    }
	
} else {
    // Resume the game
    instance_activate_all();
}