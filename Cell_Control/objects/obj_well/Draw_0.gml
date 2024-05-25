draw_self();

draw_set_color(c_white);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text(x, y, waves_left);
draw_text(x, y + 20, ceil(wave_timer / game_get_speed(gamespeed_fps)));
draw_text(x + 40, y, ceil(boss_countdown / game_get_speed(gamespeed_fps)));
draw_text(x + 70, y, global.difficulty_scalar);
draw_text(x + 70, y + 20, global.difficulty);