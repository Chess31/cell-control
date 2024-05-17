var _nearest_wall = instance_nearest(x,y,obj_cellWall);

if (point_distance(x,y, _nearest_wall.x, _nearest_wall.y) < wall_delete_range) {
	with (obj_cellWall) {
		//check all walls for being to close to the well
		if (point_distance(x, y, other.x, other.y) < 200){instance_destroy()};
	}
}


	
if (keyboard_check_pressed(vk_space)) {
	x += irandom_range(-50,50);
	y += irandom_range(-50,50);
}
