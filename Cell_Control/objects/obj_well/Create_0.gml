//location setup
var _center_x = obj_cell_core.x;
var _center_y = obj_cell_core.y;

var _angle = random(360);
var _x = _center_x + lengthdir_x(1000,_angle);
var _y = _center_y + lengthdir_y(1000,_angle);

//spawn the target behind the first well
if (!instance_exists(obj_target)) {
	var _len = irandom_range(350, 500);
	var _target_x = _x + lengthdir_x(_len,_angle);
	var _target_y = _y + lengthdir_y(_len,_angle);
	instance_create_layer(_target_x, _target_y, "InfectionLayer",obj_target);
}

shot_cooldown = 30;
shot_interval = 20;

wall_delete_range = 200;

branches = 0;
available_branches = [[72,true],[144,true],[216,true],[288,true],[360,true]];

is_shielded = false;
node_health = 1000;
max_health = node_health;

time_to_draw = 0;
bar_alpha = 0;