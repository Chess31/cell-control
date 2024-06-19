// Reset Text to White
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

// Draw the HUD
//draw_text(300, 10, instance_number(obj_collectible));
//draw_text(10, 30, "Special Energy: " + string(obj_player.weaponTokens));
//draw_text(10, 50, "Level: " + string(global.infections_destroyed) + " / " + string(global.win_level));
draw_text_transformed(10, 10, "Level: " + string(global.infections_destroyed) + " / " + string(global.win_level),1.5,1.5,0);

//Health Bar
// Set the coordinates for the health bar
var _bar_x = display_get_gui_width()/2;
var _bar_y = display_get_gui_height() - 35;
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
var _ebar_y = display_get_gui_height() - 15;
// Calculate the width of the bar based on player's health
var energy_percentage = clamp(obj_player.ammo / 200, 0, 2); // Calculate health percentage
var ebar_width = 36 * energy_percentage; //constant should be the default bar length
//draw the bar
draw_sprite_ext(s_energy_bar, 0, _ebar_x, _ebar_y, ebar_width, 1.2, 0, c_white, 1);
draw_set_color(c_black);
//draw_set_halign(fa_center);
//draw_set_valign(fa_middle);
draw_text(_ebar_x, _ebar_y, string(obj_player.ammo));

//Special Bar
// Set the coordinates for the health bar
if (instance_exists(obj_player) && obj_player.weaponTokens > 0){
	var _sbar_x = 10 + sprite_get_width(s_special_bar)/2;//display_get_gui_width()/2;
	var _sbar_y = display_get_gui_height()/2;
	// Calculate the width of the bar based on player's health
	var senergy_percentage = clamp(obj_player.weaponTokens / 100, 0, 2); // Calculate health percentage
	var sbar_width = 33 * senergy_percentage; //constant should be the default bar length
	//draw the bar
	draw_sprite_ext(s_special_bar, 0, _sbar_x, _sbar_y, 1.2, sbar_width, 0, c_white, 1);
	draw_set_color(c_white);
	//draw_set_halign(fa_center);
	//draw_set_valign(fa_middle);
	draw_text(_sbar_x, _sbar_y, string(obj_player.weaponTokens));
}

// Draw HUD in the top right corner
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

var display_x = display_get_gui_width() - string_width(" Primary Attack: " + string(obj_player.primarySlot));
var display_y = 10;

// Draw primary weapon
draw_text(display_x, display_y, "Primary Attack: " + string(obj_player.primarySlot));

// Draw shift weapon
if (obj_player.shiftSlot != -1) {
    draw_text(display_x, display_y + 20, "Shift Attack: " + string(obj_player.shiftSlot));
}

// Draw alt weapon
if (obj_player.altSlot != -1) {
    draw_text(display_x, display_y + 40, "Alt Attack: " + string(obj_player.altSlot));
}

// Draw combo weapon
if (obj_player.comboSlot != -1) {
    draw_text(display_x, display_y + 60, "Combo Attack: " + string(obj_player.comboSlot));
}

if (global.extra_info = true){
	//Draw the number of currently placed buildings for each type
	var margin = 25; // Margin from the screen edge
	var text_offset = 5; // Offset for text positioning
	var text_size = 16; // Font size for the text
	var line_height = text_size + 2; // Height of each line

	var _x = display_get_gui_width() - margin - 170; // X-coordinate for the text
	var _y = display_get_gui_height() - margin; // Initial Y-coordinate for the text

	// Calculate the width and height of the rectangle based on the text size
	var rect_width = 200; // Adjust as needed
	var rect_height = ds_list_size(global.buildingTypes) * line_height + 2 * text_offset;

	// Draw the outline of the building count box
	var _rec_y = _y - line_height*(ds_list_size(global.buildingTypes)-2) - 2
	draw_rectangle(_x - 2, _rec_y, display_get_gui_width() - 2, display_get_gui_height() - 2, true);

	// Loop through each building type
	for (var i = 1; i < ds_list_size(global.buildingTypes); i++) {
		var buildingType = ds_list_find_value(global.buildingTypes, i);
		var currentCount = ds_list_find_value(global.buildingCount, i);
		var maxCount = ds_list_find_value(global.buildingMaxNumber, i);
    
		// Draw the building type and its current count
		draw_text(_x, _y, string(buildingType) + ": " + string(currentCount) + "/" + string(maxCount));
    
		// Update Y-coordinate for the next line
		_y -= line_height;
	
	}
}

//Currently Selected Building Type (Bottom Left)
var _spritetodraw = ds_list_find_value(global.buildingSprites, global.currentBuildingIndex);
var _halfspritewidth = sprite_get_width(_spritetodraw) / 2;
var _edgespacing = 10;

var scaleX = sprite_get_width(_spritetodraw) / sprite_get_width(s_Menu);
var scaleY = sprite_get_height(_spritetodraw) / sprite_get_height(s_Menu);

draw_set_color(c_white);
draw_set_halign(fa_left);
draw_sprite(_spritetodraw, 1, _halfspritewidth + _edgespacing, display_get_gui_height() - _halfspritewidth - _edgespacing);
draw_rectangle((_halfspritewidth + _edgespacing) - _halfspritewidth, (display_get_gui_height() - _halfspritewidth - _edgespacing) - _halfspritewidth, (_halfspritewidth + _edgespacing) + _halfspritewidth, (display_get_gui_height() - _halfspritewidth - _edgespacing) + _halfspritewidth, true);
draw_text((_halfspritewidth + _edgespacing) - _halfspritewidth, (display_get_gui_height() - _halfspritewidth*2 - _edgespacing*3), string(ds_list_find_value(global.buildingTypes, global.currentBuildingIndex)) + " (" + string(ds_list_find_value(global.buildingCosts, global.currentBuildingIndex)) + ")");

//Victory UI
if (global.infections_destroyed > global.win_level){
	draw_set_halign(fa_center);
	draw_set_color(c_aqua);
	draw_text(display_get_gui_width()/2, 10, "Victory");
	
	var _vx = display_get_gui_width();
	var _vy = display_get_gui_height();
	
	draw_rectangle(1,1,_vx-2,_vy-1,1); //screen boarder test rectangle
}

//Pointers for wells (reference for converting Room Coords to GUI Coords) (subtract _cx and _cy to get screen coords)
if (instance_exists(obj_well)) {
	
	var _vx = display_get_gui_width();
	var _vy = display_get_gui_height();

	var _cx = obj_camera.x - obj_camera.view_w_half;
	var _cy = obj_camera.y - obj_camera.view_h_half;
	
	for (var i = 0; i < instance_number(obj_well); i++) {
		
		var _well = instance_find(obj_well, i);
		//draw_rectangle(1,1,_vx-2,_vy-1,1); //screen boarder test rectangle
		
		if (!point_in_rectangle(_well.x - _cx, _well.y - _cy, 0, 0, _vx, _vy)) {
			////well offscreen so draw the arrows
			
			var _arrow_angle = point_direction(obj_player.x - _cx, obj_player.y - _cy, _well.x - _cx, _well.y - _cy);
			var _goal_x = _well.x - _cx; //still needs to be clamped to screen bounds
			var _goal_y = _well.y - _cy; //still needst to be clamled to screen bounds
			
			//var _goal_x = ((_well.x - _cx) + (obj_player.x - _cx)) * (0.5); //still needs to be clamped to screen bounds
			//var _goal_y = ((_well.y - _cy) + (obj_player.y - _cy)) * (0.5);; //still needst to be clamled to screen bounds
			
			var _arrow_x = clamp(_goal_x, 0 + 50, _vx - 50);
			var _arrow_y = clamp(_goal_y, 0 + 50, _vy - 50);

			draw_sprite_ext(s_arrow, image_index/10, _arrow_x, _arrow_y, 1, 1, _arrow_angle, c_white,1);
			
			//Test Lines and Arrows
			//draw_line(_well.x - _cx, _well.y - _cy, obj_player.x - _cx, obj_player.y - _cy);
			//draw_arrow(obj_player.x - _cx, obj_player.y - _cy, _well.x - _cx, _well.y - _cy, 100);
		}
	}
}