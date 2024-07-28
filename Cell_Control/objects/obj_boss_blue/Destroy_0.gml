/// @description Spawn Target Key
if (instance_exists(obj_well)) {
	instance_create_layer(x,y,"Instances", obj_target_key);
}

// Inherit the parent event
event_inherited();

