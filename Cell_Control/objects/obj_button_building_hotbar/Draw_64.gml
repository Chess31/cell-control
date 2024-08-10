event_inherited();

if (slot_index == obj_player.current_building_index and obj_buildings_hotbar.menu_up == true) {
	var _stretch_value = 2.1;
	draw_sprite_ext(sprite_index, image_index, x, y, _stretch_value, _stretch_value, 0, c_white, 1);
}

draw_sprite(s_buildings_list_full, slot_index, x, y);
//find stats to display
var _placed = global.building_count[|slot_index];
var _max = global.building_max_number[|slot_index];
var _name = global.building_types[|slot_index];
var _level = global.building_levels[|slot_index];
var _cost = global.building_costs[|slot_index];
var _sep = 12;
var _width = 128;

draw_set_halign(fa_left);

draw_text_ext(x + 48, y - 32, _name, _sep, _width);
draw_text_ext(x + 48, y - 8, "Cost: " + string(_cost), _sep, _width);
draw_text_ext(x + 48, y + 6, string(_placed) + " / " + string (_max), _sep, _width);
draw_text_ext(x + 48, y + 22, "Level: " + string(_level), _sep, _width);