draw_self();

// Get the direction towards the mouse
var playerDirection = point_direction(x, y, mouse_x, mouse_y);

// Placement Mode logic
if (isDeployingWall) {
    // Set the wall's position to be in front of the player
    var wallX = x + lengthdir_x(32, playerDirection);
    var wallY = y + lengthdir_y(32, playerDirection);

    // Draw a preview of the wall
    draw_sprite_ext(ds_list_find_value(global.buildingSprites, global.currentBuildingIndex), 0, wallX, wallY, 1, 1, playerDirection, c_white, .3);

	//// Draw the current building type and cost on the screen as text
	//draw_set_color(c_white);
	//draw_text(x - 20, y + 40, ds_list_find_value(global.buildingTypes, global.currentBuildingIndex));
	//draw_text(x - 20, y + 60, ds_list_find_value(global.buildingCosts, global.currentBuildingIndex));
}

var _spritetodraw = ds_list_find_value(global.buildingSprites, global.currentBuildingIndex);
var _halfspritewidth = sprite_get_width(_spritetodraw) / 2;
var _edgespacing = 10;

var scaleX = sprite_get_width(_spritetodraw) / sprite_get_width(s_Menu);
var scaleY = sprite_get_height(_spritetodraw) / sprite_get_height(s_Menu);

draw_set_color(c_white);
draw_set_halign(fa_left);
draw_sprite(_spritetodraw, 1, _halfspritewidth + _edgespacing, display_get_gui_height() - _halfspritewidth - _edgespacing);
draw_rectangle((_halfspritewidth + _edgespacing) - _halfspritewidth, (display_get_gui_height() - _halfspritewidth - _edgespacing) - _halfspritewidth, (_halfspritewidth + _edgespacing) + _halfspritewidth, (display_get_gui_height() - _halfspritewidth - _edgespacing) + _halfspritewidth, true);
draw_text((_halfspritewidth + _edgespacing) - _halfspritewidth, (display_get_gui_height() - _halfspritewidth*2 - _edgespacing*2.5), string(ds_list_find_value(global.buildingTypes, global.currentBuildingIndex)) + "(" + string(ds_list_find_value(global.buildingCosts, global.currentBuildingIndex)) + ")");
//draw_text((_halfspritewidth + _edgespacing) - _halfspritewidth, (display_get_gui_height() - _halfspritewidth*2 - _edgespacing*2), ds_list_find_value(global.buildingCosts, global.currentBuildingIndex));