/// @description Create a boss and an infection core/primary node

//instance_create_layer(x,y,"NodesLayer",obj_node_primary);

//at well 10, there is chance to spawn a second well
if (global.infections_destroyed >= 10) {
	if (irandom(1) == 1) {
		instance_create_layer(x,y,"Instances", obj_well);
		global.difficulty -= global.difficulty_scalar*5;
	}
}

global.infections_destroyed++;
//global.difficulty = 0; //reset difficuly
//global.difficulty_scalar += 0.1; //make difficulty scale faster
global.difficulty += global.difficulty_scalar;

var _warning_text = instance_create_layer(obj_player.x, obj_player.y - 30, "Instances", obj_message)
_warning_text.message_text = "Level " + string(global.infections_destroyed);