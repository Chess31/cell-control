/// @description Strong wall
event_inherited();

node_health = 50;

target = obj_cell_core; // The player's core object
placement_radius = 150; // Distance from the infection core for subsequent barriers
angle_increment = 45;

// Calculate direction to the player's core
var _dir = point_direction(x, y, target.x, target.y);

// Move to the position facing the player's core
var _well = instance_nearest(x,y,obj_well);
var _dir_final = _dir + (angle_increment*global.barrier_count)
var _x = _well.x + lengthdir_x(placement_radius, _dir_final);
var _y = _well.y + lengthdir_y(placement_radius, _dir_final);

image_angle = _dir_final - 90;
image_index = 1;

global.barrier_count++;

x = _x;
y = _y;

barrier_position = [_x,_y];