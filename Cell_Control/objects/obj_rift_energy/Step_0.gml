if (point_distance(obj_player.x, obj_player.y, x, y) < effect_radius) {
	
	if (random(5) < 1) { // % chance every step
	    // Spawn Energy
		var _dir = irandom(360);
		var _len = irandom_range(0,effect_radius);
	    instance_create_layer(x + lengthdir_x(_len, _dir), y + lengthdir_y(_len, _dir), "Collectibles", obj_collectible);
	}
	
	obj_player.player_color = c_aqua;
} else {
	obj_player.player_color = c_white;
}

event_inherited();