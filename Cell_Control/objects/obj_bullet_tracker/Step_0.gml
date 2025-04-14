event_inherited()

//var _direction_to_target = point_direction(x,y,target_x,target_y);
//var _angle_difference = angle_difference(_direction_to_target, direction);

//if (_angle_difference > 45) {
//	direction += _angle_difference * 0.1;
//}

var _nearest_enemy = instance_nearest(x, y, obj_enemy);

if (instance_exists(_nearest_enemy)) {
	var _distance_to_enemy = point_distance(x, y, _nearest_enemy.x, _nearest_enemy.y);
	
	if (_distance_to_enemy < infection_homing_distance) {
		var _direction_to_infection = point_direction(x, y, _nearest_enemy.x, _nearest_enemy.y);
		var _angle_difference = angle_difference(direction_to_launch, _direction_to_infection);

		if abs(_angle_difference) < turning_speed {
			direction_to_launch = _direction_to_infection;
		} else {
			// Turn towards the target
			if _angle_difference > 0 {
			    direction_to_launch -= turning_speed;
			} else {
			    direction_to_launch += turning_speed;
			}
		}
	}
}

motion_set(direction_to_launch, speed);
