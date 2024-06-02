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
//var chunk_size = global.chunk_size;
//var range = 6; // Number of chunks to keep loaded around the player

//with (obj_cellWall) {
//    if (point_distance(x, y, obj_player.x, obj_player.y) > chunk_size*range) {
//        // Save and destroy the wall if it's far from the player
//        save_wall_data(id);
//    }
//}

//var player_chunk_x = floor(obj_player.x / chunk_size);
//var player_chunk_y = floor(obj_player.y / chunk_size);

////// Iterate over a range of chunks around the player
////for (var dx = -range; dx <= range; dx++) {
////    for (var dy = -range; dy <= range; dy++) {
////        var chunk_x = player_chunk_x + dx;
////        var chunk_y = player_chunk_y + dy;
////        load_chunk_walls(chunk_x, chunk_y);
////    }
////}