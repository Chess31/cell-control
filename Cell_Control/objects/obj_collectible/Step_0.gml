//check if the player is close enough to collect
if (point_distance(x, y, obj_player.x, obj_player.y) < collectDistance) {
    direction = point_direction(x,y,obj_player.x,obj_player.y);
	speed = 8;
}

if (place_meeting(x,y,obj_player)){
	instance_destroy();
	if (obj_player.weaponTokens < 9999) {
		obj_player.AddAmmo(1);
	}
}