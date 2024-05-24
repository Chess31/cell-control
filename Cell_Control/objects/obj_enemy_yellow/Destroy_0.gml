//Spawn Extra Enemies
for (var i = 0; i < splitCount; i++) {
	instance_create_layer(x, y, "Instances", splitEnemyType);
}

///@description Inherited from Parent
// Inherit the parent event
event_inherited();

