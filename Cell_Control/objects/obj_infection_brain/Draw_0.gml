draw_set_color(c_white);

var _timer = attack_timer div game_get_speed(gamespeed_fps);

if (spawn_indicator != noone) {
	//draw_circle(spawn_indicator[0], spawn_indicator[1], 32 * (current_time*0.005 mod 2), true);
	//draw_sprite(s_warning, 0, spawn_indicator[0], spawn_indicator[1]);
	draw_sprite_ext(s_effect_spawn, image_index, spawn_indicator[0], spawn_indicator[1], 1, 1, 90, c_white, 1);
	draw_sprite(s_effect_spawn, image_index, spawn_indicator[0], spawn_indicator[1]);
}