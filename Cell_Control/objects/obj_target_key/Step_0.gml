if (instance_exists(player)) {
    var _distance_to_player = point_distance(x, y, player.x, player.y);
    
	image_angle = _distance_to_player;
	
    if (_distance_to_player <= follow_distance) {
        player_found = true;
    }
	
	if (player_found = true) {
	// Move towards the player
	var _speed = follow_speed * (_distance_to_player/300);
	
	var _direction_to_player = point_direction(x, y, player.x, player.y);
	var _new_x = x + lengthdir_x(_speed, _direction_to_player);
	var _new_y = y + lengthdir_y(_speed, _direction_to_player);
        
	// Set new position
	x = _new_x;
	y = _new_y;
	}
}

// Check for collision with the well object
if (place_meeting(x, y, obj_well)) {
    var well_instance = instance_place(x, y, obj_well);
    if (well_instance != noone) {
        instance_destroy(well_instance);
		instance_destroy();
    }
}