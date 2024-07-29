draw_set_color(c_white);
draw_text(50,50,string(action_points));
draw_set_halign(fa_center);

if (attack_timer = time_between_attacks) {
	draw_set_color(c_red);
	draw_text_transformed(display_get_gui_width()/2, 20, "Next Wave: IS HERE!",1.5,1.5,0);
} else {
	draw_text_transformed(display_get_gui_width()/2, 20, "Next Wave:" + string(attack_timer div game_get_speed(gamespeed_fps)),1.5,1.5,0);
}
//draw_text(display_get_gui_width()/2, 20, string(attack_timer div game_get_speed(gamespeed_fps)));