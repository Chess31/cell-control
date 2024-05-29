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

//CullObject(obj_cellWall);
//ProcessCulls();

//Wall management
if (current_time - last_wall_check_time >= wall_check_interval) {
    var all_walls = [];
	for (var i = 0; i < instance_number(obj_cellWall); ++i;) {
	    all_walls[i] = instance_find(obj_cellWall,i);
	}
	for (var i = 0; i < array_length(all_walls); i++) {
        var wall = all_walls[i];
        if (is_outside_view(wall.x, wall.y, wall.sprite_width, wall.sprite_height)) || (point_distance(obj_player.x, obj_player.y, wall.x, wall.y) > 350){
            store_wall_data(wall);
        }
    }
    last_wall_check_time = current_time;
}

if (current_time - last_wall_recreate_time >= wall_recreate_interval) {
    recreate_walls_in_view();
    last_wall_recreate_time = current_time;
}