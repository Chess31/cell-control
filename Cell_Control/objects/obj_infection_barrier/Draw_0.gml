// Inherit the parent event
event_inherited();

if (instance_exists(parent_id)) {
	var _radius = point_distance(x,y,parent_id.x, parent_id.y);
	draw_set_circle_precision(48);
	draw_set_color(c_fuchsia);
	draw_circle(parent_id.x, parent_id.y, _radius + 25, true);

	//bouce player
	var _player_distance = point_distance(parent_id.x, parent_id.y, obj_player.x, obj_player.y);
	if (_player_distance <= _radius + 25) {
		with (obj_player) {
			if (other.parent_id.x >= x) { var _xspeed = -7 } else { var _xspeed = 7 };
			if (other.parent_id.y >= y) { var _yspeed = -7 } else { var _yspeed = 7 };
			move_and_collide(_xspeed, _yspeed, obj_cellWall);
		}
	}
}