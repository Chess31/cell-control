///@description Spawn Initial Objects
repeat (3) {
	script_spawn_well(obj_well);
	//instance_create_layer(x,y,"Instances",obj_well);
}

instance_create_layer(x,y,"Instances",obj_infection_brain);

//play soundtrack
audio_play_sound(soundtrack_0, 1, true);