/// @description Insert description here

//at well 9, there is chance to spawn a second well
if (global.infections_destroyed >= 9) {
	if (irandom(1) == 1) {
		instance_create_layer(x,y,"Instances", obj_well);
	}
}

global.infections_destroyed++;
global.difficulty += global.difficulty_scalar;