function generate_terrain(){
	//select points in the room
	for (var i = 0; i < terrain_density; ++i) {
	    var _x = irandom_range(0, room_width);
	    var _y = irandom_range(0, room_height);
		//place terrain pieces on those points
		instance_create_layer(_x, _y, "Generated_Cell_Walls", obj_terrain_piece)
	}
	//remove points close to the center
	with (obj_terrain_piece) {
		if (point_distance(x, y, room_width/2, room_height/2) < 500) {
			instance_destroy();
		}
		image_angle = random_range(0,360);
		image_index = irandom_range(0,image_number);
	}
}