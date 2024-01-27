//Pause Menu Code
global.isPaused = !global.isPaused;

if (global.isPaused) {
    // Stop the game
    instance_deactivate_all(true);
	instance_activate_object(obj_menu);
    //call the pause menu
		pauseMenu();
	
} else {
    // Resume the game
    instance_activate_all();
}



