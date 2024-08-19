if (global.frozen = true) {
	exit;
}

//clear the area of walls when summoned
var _nearest_wall = instance_nearest(x,y,obj_cellWall);

if (instance_exists(_nearest_wall)) && (point_distance(x,y, _nearest_wall.x, _nearest_wall.y) < wall_delete_range) {
	with (obj_cellWall) {
		//check all walls for being to close to the well
		if (point_distance(x, y, other.x, other.y) < 200){instance_destroy()};
	}
}

//if (node_health <= 0) {
//	instance_destroy();
//}

//health bar things
if (time_to_draw < 30) {
	bar_alpha = lerp(bar_alpha, 0, 0.02);
} else {
	bar_alpha = 1;
}