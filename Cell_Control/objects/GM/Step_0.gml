if (global.frozen = true) {
	exit;
}

// Decrease the collectible spawn timer
if (instance_number(obj_collectible) < 5000) {
	spawnTimer -= 1;

	// Check if it's time to spawn a new collectible
	if (spawnTimer <= 0) {
	    // Spawn a collectible at a random position
	    instance_create_layer(random(room_width), random(room_height), "Collectibles",obj_collectible);
    
	    // Reset the spawn timer
	    spawnTimer = global.energy_rate;
	}
}