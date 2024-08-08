if (obj_sliding_menu.tab = 0) {
	if (show_button) {
		event_inherited();
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		draw_text(x + 84, y, "(10)")
	}
	//draw building thumbnail
	draw_sprite(s_buildings_list, my_building_index, x, y);
	//draw unlocked building details
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	if (array_contains(obj_player.available_buildings, my_building_index + 1)) {
		//draw_highlight();
		draw_max();
		draw_level();
	}
}