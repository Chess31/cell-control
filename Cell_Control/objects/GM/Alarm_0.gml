///@description Spawn Initial Objects
repeat (3) {
	instance_create_layer(x,y,"Instances",obj_well);
}
instance_create_layer(x,y,"Instances",obj_infection_brain);