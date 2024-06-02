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

//Wall management
var range = 512;

// Iterate through all wall instances
with (obj_cellWall) {
    if (point_distance(x, y, obj_player.x, obj_player.y) > range) {
        // Save and destroy the wall if it's far from the player
        save_wall_data(id);
    }
}

// Check for saved walls near the player and load them
var cell_size = 8;
var cells_to_check = range div cell_size;

for (var dx = -cells_to_check; dx <= cells_to_check; dx++) {
    for (var dy = -cells_to_check; dy <= cells_to_check; dy++) {
        var check_x = (floor(obj_player.x/cell_size)*cell_size) + dx * cell_size;
        var check_y = (floor(obj_player.y/cell_size)*cell_size) + dy * cell_size;

        if (ds_map_exists(global.wall_data, string(check_x) + "," + string(check_y))) {
            load_wall_data(check_x, check_y);
			//instance_create_layer(check_x, check_y, layer, obj_cellWall);
        }
    }
}