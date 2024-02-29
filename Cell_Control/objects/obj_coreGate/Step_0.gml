// Check if the player is within a specific range
var distanceToPlayer = point_distance(x, y, obj_player.x, obj_player.y);

if (distanceToPlayer <= playerDetectionRange) {
	playerInRange = true;
    image_index = 1;
} else {
	playerInRange = false;
	image_index = 0;
}

if (playerInRange = true) and (keyboard_check_pressed(ord("F"))){
	if (room != target_room) {
		room_goto(target_room);
	} else {
		room_goto(Room_Core);	
	}
}