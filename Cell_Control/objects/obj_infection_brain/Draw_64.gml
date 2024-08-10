draw_set_color(c_white);
//draw_text(50,50,string(action_points));
draw_set_halign(fa_center);

var _next_wave_text = "Next Wave: "
var _first_line_length = string_width(_next_wave_text);

if (attack_timer = time_between_attacks) {
	draw_set_color(c_red);
	draw_text_ext_transformed(display_get_gui_width()/2, 20, _next_wave_text + "IS HERE!", 12, _first_line_length,1.5,1.5,0);
} else {
	draw_text_ext_transformed(display_get_gui_width()/2, 20, _next_wave_text + string(attack_timer div game_get_speed(gamespeed_fps)), 12, _first_line_length,1.5,1.5,0);
}