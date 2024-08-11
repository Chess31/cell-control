// Get the direction towards the mouse
var playerDirection = point_direction(x, y, mouse_x, mouse_y);

draw_sprite_ext(s_Player,image_index,x,y,1,1,playerDirection,player_color,1);
//draw_sprite_ext(s_Player,0,x,y,1,1,playerDirection,player_color,1);

// Placement Mode logic
if (isDeployingWall) {
    // Set the wall's position to be in front of the player
    var wallX = x + lengthdir_x(32, playerDirection);
    var wallY = y + lengthdir_y(32, playerDirection);

    // Draw a preview of the wall
    draw_sprite_ext(ds_list_find_value(global.building_sprites, available_buildings[current_building_index]), 0, wallX, wallY, 1, 1, playerDirection, c_white, .3);
	//draw_text(x,y-30, "Mode: Build");
} //else {
//	//draw_text(x,y-30, "Mode: Gun");
//}