/// @description Insert description here

//at well 9, there is chance to spawn a second well
if (global.infections_destroyed >= 10) {
	if (irandom(1) == 1) {
		instance_create_layer(x,y,"Instances", obj_well);
	}
}

global.infections_destroyed++;
//global.difficulty = 0; //reset difficuly
//global.difficulty_scalar += 0.1; //make difficulty scale faster
global.difficulty += global.difficulty_scalar;