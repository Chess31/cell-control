// Decrease duration and fade out
duration -= 1;
image_alpha = duration / 300;

// Destroy the rift when duration ends
if (duration <= 0) {
	obj_player.player_color = c_white;
	global.damage_mod = 0;
    instance_destroy();
}