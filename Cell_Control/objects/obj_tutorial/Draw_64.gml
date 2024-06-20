draw_sprite_stretched(s_Menu, 0, x-margin, y-margin, width_full, height_full + line_height*2);

draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

var _desc = !(description == -1);

if (_desc) {
	draw_text(x, y, description);
	draw_text_ext(x, y + line_height*2,text,line_height,wrap_width);
} else {
	draw_text_ext(x, y + line_height,text,line_height,wrap_width);
}

if (current_time - creation_time > 3000) {
	draw_set_halign(fa_center);
	draw_text(display_get_gui_width()/2, 20, "Press 'Enter' to Continue");
}