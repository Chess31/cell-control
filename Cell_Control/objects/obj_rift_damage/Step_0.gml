if (point_distance(obj_player.x, obj_player.y, x, y) < effect_radius) {
	global.damage_mod = damage_mod;
	obj_player.player_color = c_red;
} else {
	global.damage_mod = 0;
	obj_player.player_color = c_white;
}

event_inherited();