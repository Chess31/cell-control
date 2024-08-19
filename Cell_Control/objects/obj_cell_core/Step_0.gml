if (global.frozen = true) {
	exit;
}

// Defeat logic
if (cellHealth = 0){ //reset game
	alarm[0] = 3 * game_get_speed(gamespeed_fps);
}

if (cellHealth <= 0) {
	image_index = image_number - 1;
	cellHealth = -1;
    obj_player.playerHealth -= 1;
}

// Check if the core can create a new rift
if (ds_list_size(global.rift_types) > 0) {
	rift_cooldown--;
	if (rift_cooldown <= 0) {
		var _pos = irandom(ds_list_size(global.rift_types) - 1)
	    var _rift_type = ds_list_find_value(global.rift_types,_pos); 
		var _dist = irandom_range(100,create_rift_radius);
		var _dir = irandom(360);
	    var _rift_x = lengthdir_x(_dist,_dir);
	    var _rift_y = lengthdir_y(_dist,_dir);
	    instance_create_layer(x + _rift_x, y + _rift_y, "Instances", _rift_type);
    
	    rift_cooldown = 500; // Reset cooldown
	}
}

if (draw_time < 30) {
	draw_alpha = lerp(draw_alpha, 0, 0.02);
} else {
	draw_alpha = 1;
}