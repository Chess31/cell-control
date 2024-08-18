//Pause Menu Code
if (obj_sliding_menu.menu_up = false) {
	global.isPaused = !global.isPaused;

	if (global.isPaused) {
	    // Stop the game
		global.frozen = true;
		pauseMenu();
		obj_buildings_hotbar.menu_up = false;
	} else {
		global.frozen = false;
		with(obj_menu){
			instance_destroy();
		}
	}
} 

//if (obj_sliding_menu.menu_up = true) {
//	obj_sliding_menu.menu_up = false;
//}