// Decrease the collectible spawn timer
spawnTimer -= 1;

// Check if it's time to spawn a new collectible
if (spawnTimer <= 0) {
    // Spawn a collectible at a random position
    instance_create_layer(random(room_width), random(room_height), "Collectibles",obj_collectible);
    
    // Reset the spawn timer
    spawnTimer = 10 * 5;
}
 
 if (keyboard_check_pressed(vk_enter))
 {
	game_restart()
 }
 
 //spawn a gate
 if (global.currentWave >= 1 && !instance_exists(obj_coreGate)) {
    var spawnX, spawnY;

    // Determine whether to spawn on the horizontal or vertical edge
    if (irandom(1) == 1) {
        // Spawn on the left or right edge
        spawnX = choose(0, room_width);
        spawnY = random(room_height);
    } else {
        // Spawn on the top or bottom edge
        spawnX = random(room_width);
        spawnY = choose(0, room_height);
    }

    // Create the gate
    instance_create_layer(spawnX, spawnY, "Instances", obj_coreGate);
}