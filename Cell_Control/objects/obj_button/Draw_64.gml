draw_self();

if (button_text != noone) {
	//draw_set_font(fnt_button);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_set_color(text_color);

	draw_text(x, y, button_text);
}