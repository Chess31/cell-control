event_inherited();

if (skill = 0) { //buildings
	//draw list of buildings
	for (var i = 0; i < global.core_power_skill_tree[0].tier; ++i) {
		draw_sprite(s_buildings_list, i, x, y + 60 + i*48);
	}
	
	//display next tier cost
	draw_set_color(c_white);
	draw_text(x, y + 32, "Cost: " + string(max(1,ceil((global.core_power_skill_tree[0].tier) * 1.5))));
	
} else if (skill = 1) { //health
	//draw the extra health "+number"
	for (var i = 0; i < global.core_power_skill_tree[1].tier; ++i) {
		draw_sprite(s_health_list, i, x, y + 60 + i*48);
	}
	
	//display next tier cost
	draw_set_color(c_white);
	draw_text(x, y + 32, "Cost: " + string(max(1,ceil((global.core_power_skill_tree[1].tier) * 1.5))));
	
} else if (skill = 2) { //rifts
	//draw list of possible rifts
	for (var i = 0; i < global.core_power_skill_tree[2].tier; ++i) {
		draw_sprite(s_rift_list, i, x, y + 60 + i*48);
	}
	
	//display next tier cost
	draw_set_color(c_white);
	draw_text(x, y + 32, "Cost: " + string(max(1,ceil((global.core_power_skill_tree[2].tier) * 1.5))));
}