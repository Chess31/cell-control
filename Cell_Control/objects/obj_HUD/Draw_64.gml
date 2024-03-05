// Reset Text to White
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

// Draw the HUD
draw_text(10, 10, "Ammo: " + string(obj_player.ammo) + " Health: " + string(obj_player.playerHealth) + " Wave: " + string(max(global.currentWave,1)));

// Draw the countdown timer in the HUD
if (obj_player.restartTimer > 0) and (global.playerAlive = 0) {
    var secondsLeft = ceil(obj_player.restartTimer / room_speed);
    draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_text_transformed(room_width / 2, room_height / 2, string(secondsLeft), 10, 10, 0);
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

// Draw the outline
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