// Decrease the collectible spawn timer
spawnTimer -= 1;

// Check if it's time to spawn a new collectible
if (spawnTimer <= 0) {
    // Spawn a collectible at a random position
    instance_create_layer(random(room_width), random(room_height), "Collectibles",obj_collectible);
    
    // Reset the spawn timer
    spawnTimer = 20;//50;
}

//restart game hotkey
if (keyboard_check_pressed(vk_backspace))
{
	game_restart();
}