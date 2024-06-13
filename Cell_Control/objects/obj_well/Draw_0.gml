draw_self();

draw_set_color(c_white);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

if (waves_left > 0) {
	draw_text(x, y, "Waves: " + string(waves_left));
	draw_text(x, y + 20, ceil(wave_timer / game_get_speed(gamespeed_fps)));
} else {
	draw_text(x, y, "Boss summons in: " + string(ceil(boss_countdown / game_get_speed(gamespeed_fps))));
}
//draw_text(x + 70, y, global.difficulty_scalar);
//draw_text(x + 70, y + 20, global.difficulty);