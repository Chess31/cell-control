//draw_self();

//if (enemyType = "Yellow"){
//	draw_set_color(c_black);
//} else {
//	draw_set_color(c_white);
//}

//draw_set_halign(fa_center);
//draw_set_valign(fa_middle);
//draw_text(x, y, enemyHealth);

//if (canBeHit = false){
//	flash_sprite();
//}

//Health Bar
if (time_to_draw > 0) {
	if (enemyHealth > max_health){
		var _bar_x = x;
		var _bar_y = y - sprite_height/2 - 5;
		
		var health_percentage = ((enemyHealth - max_health)/(30 - max_health)) + 1; // Calculate health percentage above max health
		var bar_width = 20 * health_percentage; //constant should be the default bar length
		//draw the bar
		draw_sprite_ext(s_enemy_health_bar, 0, _bar_x, _bar_y, bar_width, 1, 0, c_purple, bar_alpha);
		time_to_draw--;
	}
	
	var _bar_x = x;
	var _bar_y = y - sprite_height/2 - 5;
	// Calculate the width of the bar based on player's health
	var health_percentage = clamp(enemyHealth / max_health, 0, 1); // Calculate health percentage
	var bar_width = 20 * health_percentage; //constant should be the default bar length
	//draw the bar
	draw_sprite_ext(s_enemy_health_bar, 0, _bar_x, _bar_y, bar_width, 1, 0, c_green, bar_alpha);
	time_to_draw--;
}