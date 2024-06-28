if (point_distance(x, y, obj_player.x, obj_player.y) < effect_radius) {
	obj_player.player_color = c_green
}

heal_timer--;
if (heal_timer <= 0){
	heal_timer = heal_delay;
	with (obj_player) {
	    if (point_distance(x, y, other.x, other.y) < other.effect_radius) {
	        playerHealth += other.healing_rate;
	        // Limit health to maximum value
	        playerHealth = min(playerHealth, other.max_health);
			player_color = c_green
	    } else {
			player_color = c_white;
		}
	}
}

event_inherited();