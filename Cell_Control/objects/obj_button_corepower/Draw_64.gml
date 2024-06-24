event_inherited();

if (skill = 0) { //buildings
	//draw list of buildings
	for (var i = 0; i < global.core_power_skill_tree[0].tier; ++i) {
		draw_sprite(s_buildings_list, i, x, y + 48 + i*48);
	}
	//draw_set_color(c_white);
	//draw_text(x,y+32,string(next_tier_cost))
} else if (skill = 1) { //health
	//draw the extra health "+number"
} else if (skill = 2) { //rifts
	//draw list of possible rifts
}