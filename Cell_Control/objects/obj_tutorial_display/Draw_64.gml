if (!loading) {
	draw_set_halign(fa_left);
	draw_set_color(c_white);
	
	// Draw first column
	var _x = start_x;
	var _y = start_y;

	for (var i = 0; i < ds_list_size(enemies); i++) {
	    // Get the current entity
	    var entity = ds_list_find_value(enemies, i);
    
	    // Draw the sprite
	    draw_sprite(entity.sprite, 0, _x, _y);
    
	    // Wrap the text
	    var wrapped_text = wrap_text(entity.description, text_width);
    
	    // Draw the wrapped text
	    var text_x = _x + max(sprite_get_width(entity.sprite), sprite_get_width(s_enemyR)) + 10;
	    var text_y = _y - max(sprite_get_width(entity.sprite), sprite_get_width(s_enemyR))/2 + 10;
	    for (var j = 0; j < ds_list_size(wrapped_text); j++) {
	        draw_text(text_x, text_y, ds_list_find_value(wrapped_text, j));
	        text_y += string_height(ds_list_find_value(wrapped_text, j)); // Move down to the next line
	    }
    
	    // Update the y position for the next item
	    _y += spacing_y;
    
	    // Clean up the wrapped text list
	    ds_list_destroy(wrapped_text);
	}

	//draw second column of things
	var _x2 = start_x + display_get_gui_width()/2;
	var _y2 = start_y;

	for (var i = 0; i < ds_list_size(buildings); i++) {
	    // Get the current entity
	    var _building = ds_list_find_value(buildings, i);
    
	    // Draw the sprite
	    draw_sprite(_building.sprite, 0, _x2, _y2);
    
	    // Wrap the text
	    var _wrapped_text = wrap_text(_building.description, text_width);
    
	    // Draw the wrapped text
	    var text_x = _x2 + max(sprite_get_width(_building.sprite), sprite_get_width(s_enemyR)) + 10;
	    var text_y = _y2 - max(sprite_get_width(_building.sprite), sprite_get_width(s_enemyR))/2;
	    for (var j = 0; j < ds_list_size(_wrapped_text); j++) {
	        draw_text(text_x, text_y, ds_list_find_value(_wrapped_text, j));
	        text_y += string_height(ds_list_find_value(_wrapped_text, j)); // Move down to the next line
	    }
    
	    // Update the y position for the next item
	    _y2 += spacing_y;
    
	    // Clean up the wrapped text list
	    ds_list_destroy(_wrapped_text);
	}
	
	draw_set_halign(fa_center);
	draw_set_color(c_aqua);
	draw_text(display_get_gui_width()/2,display_get_gui_height() - 40, "Press 'Space' to Continue");
	
} else {
	room_goto(Room_Loading);
}