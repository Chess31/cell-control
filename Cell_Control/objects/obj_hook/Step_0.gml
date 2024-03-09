if (obj_player.arm_active = false){
	visible = false;
} else {
	visible = true;
}

var _nearest_target = instance_nearest(x,y,obj_collectible);

//if (_nearest_target != noone) && (point_distance(x, y, _nearest_target.x, _nearest_target.y) < 10){
//	//var _move_me = instance_place(x,y,obj_collectible)
//	var _dir = point_direction(_nearest_target.x, _nearest_target.y, obj_player.x, obj_player.y);
//	_nearest_target.x += lengthdir_x(10, _dir);
//	_nearest_target.y += lengthdir_y(10, _dir);
//	show_debug_message("moving ammo");
//}

if (_nearest_target != noone){
	with(_nearest_target){
		if (point_distance(x, y, other.x, other.y) < 100) {
		    direction = point_direction(x,y,obj_player.x,obj_player.y);
			speed = 12;
		}
	}
}