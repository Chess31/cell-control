// Reset Text to White
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

// Draw the HUD
draw_text_transformed(10, 10, "Core Power: " + string(global.attacks_survived),1.5,1.5,0);

y = ystart - (obj_buildings_hotbar.hotbar_y_visible - obj_buildings_hotbar.hotbar_y);

//Health Bar
// Set the coordinates for the health bar
var _bar_x = display_get_gui_width()/2;
var _bar_y = display_get_gui_height() - 115 - (obj_buildings_hotbar.hotbar_y_visible - obj_buildings_hotbar.hotbar_y);
// Calculate the width of the bar based on player's health
var health_percentage = clamp(obj_player.playerHealth / obj_player.initialHealth, 0, 2); // Calculate health percentage
var bar_width = 36 * health_percentage; //constant should be the default bar length
//draw the bar
draw_sprite_ext(s_HealthBar, 0, _bar_x, _bar_y, bar_width, 1.2, 0, c_white, 1);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text(_bar_x, _bar_y, string(obj_player.playerHealth));

//Energy Bar
// Set the coordinates for the health bar
var _ebar_x = _bar_x;//display_get_gui_width()/2;
var _ebar_y = display_get_gui_height() - 95 - (obj_buildings_hotbar.hotbar_y_visible - obj_buildings_hotbar.hotbar_y);
// Calculate the width of the bar based on player's health
var energy_percentage = clamp(obj_player.ammo / 200, 0, 2); // Calculate health percentage
var ebar_width = 36 * energy_percentage; //constant should be the default bar length
//draw the bar
draw_sprite_ext(s_energy_bar, 0, _ebar_x, _ebar_y, ebar_width, 1.2, 0, c_white, 1);
draw_set_color(c_black);
//draw_set_halign(fa_center);
//draw_set_valign(fa_middle);
draw_text(_ebar_x, _ebar_y, string(obj_player.ammo));

// Draw HUD in the top right corner
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

var display_x = display_get_gui_width() - string_width(" Primary Attack: " + string(obj_player.primarySlot));
var display_y = 10;

//Victory UI
if (!instance_exists(obj_target)) {//(global.infections_destroyed > global.win_level){
	draw_set_halign(fa_center);
	draw_set_color(c_aqua);
	draw_text(display_get_gui_width()/2, 10, "Victory");
	
	var _vx = display_get_gui_width();
	var _vy = display_get_gui_height();
	
	draw_rectangle(1,1,_vx-2,_vy-1,1); //screen boarder test rectangle
}