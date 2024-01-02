if (global.currentWave >= 1) //eventually make this so it reopens every x waves
{
    isGateOpen = true;
}

// Check for player collision when the gate is open
if (isGateOpen) && (place_meeting(x, y, obj_player)) && (room != Room_Outside) && (obj_player.canTeleport = true)
{
	// Teleport the player to the outside area
	room_goto(Room_Outside);
}

// Timer for exploring the outside area
if (room == Room_Outside){
	if (timer > 0) {
	    timer--;
	} else {
	    // Time is up, transition back to Room_Core
	    timer = timeLimit;
		obj_player.canTeleport = false;
		obj_player.x = x;
		obj_player.y = y;
		alarm[0] = room_speed * 2; //time until the player can enter the portal again
		room_goto(Room_Core);
	}
}