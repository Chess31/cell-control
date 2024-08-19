draw_self();

//Health Bar
if (time_to_draw > 0) {
	var _bar_x = x;
	var _bar_y = y - sprite_height/2 - 5;
	// Calculate the width of the bar based on player's health
	var _health_percentage = clamp(node_health / max_health, 0, 1); // Calculate health percentage
	var _bar_width = 30 * _health_percentage; //constant should be the default bar length
	//draw the bar
	draw_sprite_ext(s_enemy_health_bar, 0, _bar_x, _bar_y, _bar_width, 1, 0, c_green, bar_alpha);
	time_to_draw--;
}