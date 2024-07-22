// Inherit the parent event
event_inherited();

if (target == noone) {
    // Find a random obj_infection instance
	var _random_index = irandom(instance_number(obj_infection)-1);
    target = instance_find(obj_infection, _random_index);
	if (target = id) {target = noone}; //don't select yourself
}

// If there's a target, check if it's within range and apply the shield
if (target != noone) {
	//Rotate to face target
	image_angle = point_direction(x, y, target.x, target.y) - 90;
    // Ensure the target is within a reasonable range
    if (point_distance(x, y, target.x, target.y) <= shield_range) {
        // Apply shield to the target
        target.is_shielded = true;
    } else {
        // If the target is out of range, remove the shield and find a new target
        target.is_shielded = false;
        target = noone;
    }
}