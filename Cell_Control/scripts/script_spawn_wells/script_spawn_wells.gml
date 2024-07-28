// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function script_spawn_well(){
	var object_to_place = argument0;
	var room_center_x = room_width / 2;
	var room_center_y = room_height / 2;
	var safe_margin = 200;
	var center_exclusion_radius = 950;
	var object_placed = false;
	var pos_x, pos_y;

	while (!object_placed) {
	    // Generate random positions
	    pos_x = irandom_range(safe_margin, room_width - safe_margin);
	    pos_y = irandom_range(safe_margin, room_height - safe_margin);

	    // Check distance from the center
	    if (point_distance(pos_x, pos_y, room_center_x, room_center_y) > center_exclusion_radius) {
	        // Place the object
	        instance_create_layer(pos_x, pos_y, "Instances", object_to_place);
	        object_placed = true;
	    }
	}
}