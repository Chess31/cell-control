draw_self();

draw_set_color(c_white);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text(x, y, waves_left);
draw_text(x, y + 20, ceil(wave_timer/100));
draw_text(x + 40, y, boss_countdown);