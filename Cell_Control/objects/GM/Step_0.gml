// Decrease the collectible spawn timer
spawnTimer -= 1;

// Check if it's time to spawn a new collectible
if (spawnTimer <= 0) {
    // Spawn a collectible at a random position
    instance_create_layer(random(room_width), random(room_height), "Collectibles",obj_collectible);
    
    // Reset the spawn timer
    spawnTimer = 10 * 5;
}
 
 //restart game hotkey
 if (keyboard_check_pressed(vk_backspace))
 {
	game_restart();
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

//Unlock enemies on specific waves
if (global.currentWave = 2 && blue_unlocked = false){
	ds_list_add(global.enemyTypes, "Blue");
	ds_list_add(global.enemyHealths, 5);
	ds_list_add(global.enemySprites, s_enemy2);
	ds_list_add(global.enemySpeeds, 1);
	
	blue_unlocked = true;
	
	var _message_text = "Wave 3 Reached:\nCell Warrior Unlocked";
    obj_message_log.add_message(_message_text);
}

if (global.currentWave = 4 && green_unlocked = false){
	ds_list_add(global.enemyTypes, "Green");
	ds_list_add(global.enemyHealths, 8);
	ds_list_add(global.enemySprites, s_enemy3);
	ds_list_add(global.enemySpeeds, 2);
	
	green_unlocked = true;
	
	var _message_text = "Wave 5 Reached:\nCell Berserker Unlocked";
    obj_message_log.add_message(_message_text);
}