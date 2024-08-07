if (obj_sliding_menu.tab = 0) {
	event_inherited();
	//draw building thumbnail
	draw_sprite(s_buildings_list, my_building_index, x, y);
	//draw unlocked building details
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	if (array_contains(obj_player.available_buildings, my_building_index + 1)) {
		draw_highlight();
		draw_max();
	}
}