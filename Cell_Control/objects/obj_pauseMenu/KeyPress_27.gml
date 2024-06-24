//Pause Menu Code
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