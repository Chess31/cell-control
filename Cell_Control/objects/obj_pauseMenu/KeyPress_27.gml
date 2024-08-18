//Pause Menu Code
if (obj_sliding_menu.menu_up = false) {
	global.isPaused = !global.isPaused;

	if (global.isPaused) {
	    // Stop the game
		global.frozen = true;
		pauseMenu();
	} else {
		global.frozen = false;
		with(obj_menu){
			instance_destroy();
		}
	}
} else {
	obj_sliding_menu.menu_up = true;
}