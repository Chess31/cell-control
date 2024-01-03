//Pause Menu Code
if (keyboard_check_pressed(vk_escape)){
    global.isPaused = true; // Toggle pause state
}

if (global.isPaused) {
    // Stop the game
    instance_deactivate_all(true);
	instance_activate_object(obj_menu);
    //call the pause menu
    if (!instance_exists(obj_menu)) {
		pauseMenu();
}
	
} else {
    // Resume the game
    instance_activate_all();
}