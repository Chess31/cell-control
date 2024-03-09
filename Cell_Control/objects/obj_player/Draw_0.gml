draw_self();

//// Define the threshold for each frame transition
//var thresholds = [0, 50, 100, 150, 200, 250, 300, 350, 400];
//var currentFrame = 0; // Current frame index

//// Loop through the thresholds to find the appropriate frame
//for (var i = 0; i < array_length_1d(thresholds); i++) {
//    if (ammo >= thresholds[i]) {
//        currentFrame = i; // Set the current frame index
//    }
//}

//image_index = currentFrame;


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


////Arm Controller


//// Find the nearest building
//var _target = obj_collectible;
//var nearestTarget = instance_nearest(x, y, _target);

//var maxLength = 100; // Maximum length of the line, effective the collection distance

//if (nearestTarget != noone){
//    // Calculate direction towards the nearest building
//    var dirToTarget = point_direction(x, y, nearestTarget.x, nearestTarget.y);
    
//	if (dirToTarget < maxLength){
//		arm_active = true;
//	    // Initialize line position to player's position
//	    var lineStartX = x;
//	    var lineStartY = y;
    
//	    // Draw the line
//	    draw_set_color(c_white);
//	    repeat (maxLength / 10) { // Increase line length in steps of 10 pixels
//	        // Calculate end position of the line
//	        var lineEndX = lineStartX + lengthdir_x(10, dirToTarget);
//	        var lineEndY = lineStartY + lengthdir_y(10, dirToTarget);
        
//			arm_end_x = lineEndX;
//			arm_end_y = lineEndY;
		
//	        // Check if the line intersects with a building
//	        if (place_meeting(lineEndX, lineEndY, _target)) {
//	            // Stop extending the line if it hits a building
//	            break;
//	        }
        
//	        // Draw the line segment
//	        draw_line(lineStartX, lineStartY, lineEndX, lineEndY);
        
//	        // Update line position for the next segment
//	        lineStartX = lineEndX;
//	        lineStartY = lineEndY;
//	    }
//	} else {
//		arm_active = false;
//	}
//}

//hook_1.x = arm_end_x;
//hook_1.y = arm_end_y;

////show_debug_message(arm_end_x);
////show_debug_message(arm_end_y);