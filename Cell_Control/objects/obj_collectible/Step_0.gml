//check if the player is close enough to collect
if (point_distance(x, y, obj_player.x, obj_player.y) < collectDistance) {
    // Collectible is close to the player, destroy it and increment a score variable
    direction = point_direction(x,y,obj_player.x,obj_player.y);
	speed = 8;
}

if (place_meeting(x,y,obj_player)){
	instance_destroy();
	obj_player.AddAmmo(1); // Call a function in the player object to add ammo
}