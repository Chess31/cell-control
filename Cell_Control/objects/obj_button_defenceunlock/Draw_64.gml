if (obj_sliding_menu.tab = 2) {
	if (show_button) {
		event_inherited();
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		//draw cost
		draw_text(x + 152, y, "(" + string(price) + ")")
	}
}