// Draw collision masks for all instances of a specific object type
//var obj_type = obj_enemy; // Change this to the object type you want to visualize
//if(instance_exists(obj_type)){
//	with (obj_type) {
//	    // Set the transparency for the collision mask
//	    draw_set_alpha(0.5);
    
//	    // Draw the collision mask
//	    draw_self();
    
//	    // Reset the transparency
//	    draw_set_alpha(1);
//	}
//}

if (keyboard_check_pressed(ord("R"))){
	// Check for player collision when the gate is open
	if (room != Room_Outside)
	{
		// Teleport the player to the outside area
		room_goto(Room_Outside);
	} else {
		room_goto(Room_Core);	
	}
	show_debug_message("room restart");
}

//old theory for bug: killing the boss with enemies still in the room allows the purple enemies to slowly shrink their collision box
//bug updates: purple actially just loses track of its colision after switching rooms
//collisions remain at the last point enemies spawn from, red ball loses collision as well...
//final idea = if the cell structure generates when enemies exist in a non default state they break. But if it generates with either no enemies present or default ones, its fine