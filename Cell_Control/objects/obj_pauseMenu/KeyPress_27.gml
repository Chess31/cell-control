//Pause Menu Code
global.isPaused = !global.isPaused;

if (global.isPaused) {
    // Stop the game
	//room_set_persistent(Room_Core,true);
	room_goto(Room_Pause);
    //instance_deactivate_all(true);
	//instance_activate_object(obj_menu);
    //call the pause menu
	//pauseMenu();
	
} else {
    // Resume the game
	room_goto(Room_Core);
}



