// Inherit the parent event
event_inherited();

if (instance_exists(target)) {
	target.is_shielded = false;
}