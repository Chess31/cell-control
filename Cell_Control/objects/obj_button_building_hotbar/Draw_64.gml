event_inherited();
//draw outline if selected
if (slot_index == obj_player.current_building_index and obj_buildings_hotbar.menu_up == true) {
	var _stretch_value = 2.1;
	draw_sprite_ext(sprite_index, image_index, x, y, _stretch_value, _stretch_value, 0, c_white, 1);
}
//draw building thumbnail
var _player_building_list = obj_player.available_buildings[slot_index];
draw_sprite(s_buildings_list_full, _player_building_list, x, y);
//find stats to display
var _placed = global.building_count[|_player_building_list];
var _max = global.building_max_number[|_player_building_list];
var _name = global.building_types[|_player_building_list];
var _level = global.building_levels[|_player_building_list];
var _cost = global.building_costs[|_player_building_list];
var _sep = 12;
var _width = 128;
//draw stats
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_text_ext(x + 48, y - 40, _name, _sep, _width);
draw_text_ext(x + 48, y - 10, "Cost: " + string(_cost), _sep, _width);
draw_text_ext(x + 48, y + 4, string(_placed) + " / " + string (_max), _sep, _width);
draw_text_ext(x + 48, y + 20, "Level: " + string(_level), _sep, _width);