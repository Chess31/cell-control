if (fired = false) {
    var _distance_to_player = point_distance(x, y, player.x, player.y);
    
	image_angle = _distance_to_player;
	
    if (_distance_to_player <= follow_distance) {
        player_found = true;
    }
	
	if (player_found = true) {
		// Move towards the player
		var _key_index = 0;
		if (instance_number(obj_target_key) > 1) {
			for (var i = 0; i < instance_number(obj_target_key); i++) {
				if (instance_find(obj_target_key, i) = id) {
					if (i = 0) {is_next = true;}
					_key_index = i;
				}
			}
		} else {
			is_next = true;
		}
	
		var _speed = follow_speed * ((_distance_to_player - (follow_distance + (_key_index * 48))) / 300);
	
		var _direction_to_player = point_direction(x, y, player.x, player.y);
		var _new_x = x + lengthdir_x(_speed, _direction_to_player);
		var _new_y = y + lengthdir_y(_speed, _direction_to_player);
        
		// Set new position
		x = _new_x;
		y = _new_y;
	}
} else {
	//fired = true
	var _new_x = x + lengthdir_x(fired_speed, direction_to_launch);
	var _new_y = y + lengthdir_y(fired_speed, direction_to_launch);
        
	// Move
	x = _new_x;
	y = _new_y;
	
	while (!place_empty(x,y,obj_cellWall)) {
		var _wall = instance_place(x,y,obj_cellWall);
		instance_destroy(_wall);
	}
	
	destroy_offscreen();
}

if (mouse_check_button_pressed(mb_right) and fired = false and is_next = true) {
	fired = true;
	direction_to_launch = point_direction(x, y, mouse_x, mouse_y);
}

// Check for collision with the well object
if (place_meeting(x, y, obj_infection) and fired = true) {
    var _infection_instance = instance_place(x, y, obj_infection);
    if (_infection_instance != noone) {
        instance_destroy(_infection_instance);
		instance_destroy();
    }
}