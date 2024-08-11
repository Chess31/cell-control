/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

//create_infection_boarder();
var _radius = point_distance(x,y,parent_id.x, parent_id.y);
draw_set_circle_precision(48);
draw_set_color(c_fuchsia);
draw_circle(parent_id.x, parent_id.y, _radius + 25, true);

//bouce player
var _player_distance = point_distance(parent_id.x, parent_id.y, obj_player.x, obj_player.y);
if (_player_distance <= _radius + 25) {
	with (obj_player) {
		move_and_collide(-7,-7,obj_cellWall);
	}
}
//	obj_player.speed = -7;
//	obj_player.direction = -1 * (point_direction(parent_id.x, parent_id.y, obj_player.x, obj_player.y));
//}