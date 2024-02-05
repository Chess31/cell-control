// Decrease the collectible spawn timer
spawnTimer -= 1;

// Check if it's time to spawn a new collectible
if (spawnTimer <= 0) {
    // Spawn a collectible at a random position
    instance_create_layer(random(room_width), random(room_height), "Collectibles",obj_collectible);
    
    // Reset the spawn timer
    spawnTimer = 50;
}

//restart game hotkey
if (keyboard_check_pressed(vk_backspace))
{
	game_restart();
}

//Unlock enemies and buildings on specific waves (enemy types should be added the wave before they need to show up)
if (global.currentWave >= 2 && blue_unlocked = false){
	ds_list_add(global.enemyTypes, "Blue");
	ds_list_add(global.enemyHealths, 5);
	ds_list_add(global.enemySprites, s_enemyB);
	ds_list_add(global.enemySpeeds, 1);

	blue_unlocked = true;
	
	ds_list_add(global.buildingTypes, "Forge");
	ds_list_add(global.buildingHealths, 20);
	ds_list_add(global.buildingSprites, s_Forge);
	ds_list_add(global.buildingCosts, 30);
	ds_list_add(global.buildingCount, 0);
	ds_list_add(global.buildingMaxNumber, 8);
	
	forge_unlocked = true;
	
	var _message_text = "Cell Forge Unlocked";
    obj_message_log.add_message(_message_text);
	var _message_text_2 = "Wave 2 Reached:";
    obj_message_log.add_message(_message_text_2);
}

if (global.currentWave >= 3 && upgrader_unlocked = false){
	ds_list_add(global.buildingTypes, "Upgrader");
	ds_list_add(global.buildingHealths, 50);
	ds_list_add(global.buildingSprites, s_Upgrader);
	ds_list_add(global.buildingCosts, 50);
	ds_list_add(global.buildingCount, 0);
	ds_list_add(global.buildingMaxNumber, 1);
	
	upgrader_unlocked = true;
	
	var _message_text_3 = "Cell Warrior's are attacking!";
    obj_message_log.add_message(_message_text_3);
	var _message_text = "Upgrader Unlocked";
    obj_message_log.add_message(_message_text);
	var _message_text_2 = "Wave 3 Reached";
    obj_message_log.add_message(_message_text_2);
}

if (global.currentWave >= 4 && green_unlocked = false){
	ds_list_add(global.enemyTypes, "Green");
	ds_list_add(global.enemyHealths, 8);
	ds_list_add(global.enemySprites, s_enemyG);
	ds_list_add(global.enemySpeeds, 2);
	
	green_unlocked = true;
}

if (global.currentWave >= 5 && proximity_mine_unlocked = false){
	ds_list_add(global.buildingTypes, "Proximity Mine");
	ds_list_add(global.buildingHealths, 5);
	ds_list_add(global.buildingSprites, s_ProxMine);
	ds_list_add(global.buildingCosts, 5);
	ds_list_add(global.buildingCount, 0);
	ds_list_add(global.buildingMaxNumber, 4);
	
	proximity_mine_unlocked = true;
	
	var _message_text_3 = "Cell Berserker's are attacking!";
    obj_message_log.add_message(_message_text_3);
	var _message_text = "Proximity Mine Unlocked";
    obj_message_log.add_message(_message_text);
	var _message_text_2 = "Wave 5 Reached";
    obj_message_log.add_message(_message_text_2);
}

if (global.currentWave >= 7 && feeder_unlocked = false){
	ds_list_add(global.buildingTypes, "Feeder");
	ds_list_add(global.buildingHealths, 300);
	ds_list_add(global.buildingSprites, s_Feeder);
	ds_list_add(global.buildingCosts, 150);
	ds_list_add(global.buildingCount, 0);
	ds_list_add(global.buildingMaxNumber, 1);
	
	feeder_unlocked = true;

	var _message_text = "Feeder Unlocked";
    obj_message_log.add_message(_message_text);
	var _message_text_2 = "Wave 7 Reached";
    obj_message_log.add_message(_message_text_2);
}