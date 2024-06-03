//function initialize_chunks() {
//	// Initialize the chunk system and store walls by chunk
//	global.chunk_size = 512; //256 with a range of 1 works (committing this setup)
//	global.wall_chunks = ds_map_create();

//	with (obj_cellWall) {
//	    var chunk_key = get_chunk_coords(x, y);

//	    if (!ds_map_exists(global.wall_chunks, chunk_key)) {
//	        var new_chunk = ds_map_create();
//	        ds_map_add(global.wall_chunks, chunk_key, new_chunk);
//	    } else {
//	        var new_chunk = global.wall_chunks[? chunk_key];
//	    }

//	    var wall_info = ds_map_create();
//	    ds_map_add(wall_info, "x", x);
//	    ds_map_add(wall_info, "y", y);
//	    ds_map_add(wall_info, "buildingHealth", buildingHealth);

//	    var wall_key = string(x) + "," + string(y);
//	    ds_map_add(new_chunk, wall_key, wall_info);

//	    instance_destroy(id); // Remove the wall instance from the game
//	}
//}

//function get_chunk_coords() {
//	// Arguments: x, y
//	var _x = argument0;
//	var _y = argument1;

//	var chunk_x = floor(_x / global.chunk_size);
//	var chunk_y = floor(_y / global.chunk_size);

//	return string(chunk_x) + "," + string(chunk_y);
//}

////function load_chunk_walls() {
////	// Arguments: chunk_x, chunk_y
////	var chunk_x = argument0;
////	var chunk_y = argument1;
////	var chunk_key = string(chunk_x) + "," + string(chunk_y);

////	if (ds_map_exists(global.wall_chunks, chunk_key)) {
////	    var chunk = global.wall_chunks[? chunk_key];

////	    // Create a list of keys
////	    var keys = ds_map_keys(chunk);
////	    for (var i = 0; i < ds_list_size(keys); i++) {
////	        var wall_key = ds_list_find_value(keys, i);
////	        var wall_info = chunk[? wall_key];

////	        var wall = instance_create_layer(wall_info[? "x"], wall_info[? "y"], layer, obj_cellWall);
////	        wall.buildingHealth = wall_info[? "buildingHealth"];
////	    }

////	    // Clean up
////	    ds_list_destroy(keys);
////	    ds_map_delete(global.wall_chunks, chunk_key);
////	    ds_map_destroy(chunk);
////	}
////}

//// Helper function to get keys of a ds_map
//function ds_map_keys(map) {
//    var keys = ds_list_create();
//    var key = ds_map_find_first(map);

//    while (key != undefined) {
//        ds_list_add(keys, key);
//        key = ds_map_find_next(map, key);
//    }

//    return keys;
//}

////function unload_chunk_walls() {
////	// Arguments: chunk_x, chunk_y
////	var chunk_x = argument0;
////	var chunk_y = argument1;
////	var chunk_key = string(chunk_x) + "," + string(chunk_y);

////	var chunk = ds_map_create();

////	with (obj_cellWall) {
////	    var wall_chunk_x = floor(x / global.chunk_size);
////	    var wall_chunk_y = floor(y / global.chunk_size);

////	    if (wall_chunk_x == chunk_x && wall_chunk_y == chunk_y) {
////	        var wall_info = ds_map_create();
////	        ds_map_add(wall_info, "x", x);
////	        ds_map_add(wall_info, "y", y);
////	        ds_map_add(wall_info, "buildingHealth", buildingHealth);

////	        var wall_key = string(x) + "," + string(y);
////	        ds_map_add(chunk, wall_key, wall_info);

////	        instance_destroy(id);
////	    }
////	}

////	ds_map_add(global.wall_chunks, chunk_key, chunk);
////}

//function determine_walls_to_load() {
//	// Arguments: chunk_x, chunk_y
//	var chunk_x = argument0;
//	var chunk_y = argument1;
//	var chunk_key = string(chunk_x) + "," + string(chunk_y);

//	if (ds_map_exists(global.wall_chunks, chunk_key)) {
//	    var chunk = global.wall_chunks[? chunk_key];

//	    if (!is_undefined(global.walls_to_load)) {
//	        ds_list_destroy(global.walls_to_load);
//	    }

//	    global.walls_to_load = ds_list_create();
//	    global.walls_to_load_chunk = chunk;

//	    // Create a list of wall keys to process in batches
//	    var keys = ds_map_keys(chunk);
//	    for (var i = 0; i < ds_list_size(keys); i++) {
//	        var wall_key = ds_list_find_value(keys, i);
//	        ds_list_add(global.walls_to_load, wall_key);
//	    }

//	    ds_list_destroy(keys);
//	    ds_map_delete(global.wall_chunks, chunk_key);
//	}
//}
//function determine_walls_to_unload() {
//	// Arguments: chunk_x, chunk_y
//	var chunk_x = argument0;
//	var chunk_y = argument1;
//	var chunk_key = string(chunk_x) + "," + string(chunk_y);

//	var chunk = ds_map_create();

//	if (!is_undefined(global.walls_to_unload)) {
//	    ds_list_destroy(global.walls_to_unload);
//	}

//	global.walls_to_unload = ds_list_create();
//	global.walls_to_unload_chunk = chunk;

//	with (obj_cellWall) {
//	    var wall_chunk_x = floor(x / global.chunk_size);
//	    var wall_chunk_y = floor(y / global.chunk_size);

//	    if (wall_chunk_x == chunk_x && wall_chunk_y == chunk_y) {
//	        var wall_info = ds_map_create();
//	        ds_map_add(wall_info, "x", x);
//	        ds_map_add(wall_info, "y", y);
//	        ds_map_add(wall_info, "buildingHealth", buildingHealth);

//	        var wall_key = string(x) + "," + string(y);
//	        ds_map_add(chunk, wall_key, wall_info);
//	        ds_list_add(global.walls_to_unload, wall_key);
//	    }
//	}

//	ds_map_add(global.wall_chunks, chunk_key, chunk);
//}

//function process_walls_to_load() {
//	if (!is_undefined(global.walls_to_load)) {
//	    var walls_processed = 0;
//		//change the line below to process more or less walls per frame
//	    while (walls_processed < 60 && ds_list_size(global.walls_to_load) > 0) {
//	        var wall_key = ds_list_find_value(global.walls_to_load, 0);
//	        ds_list_delete(global.walls_to_load, 0);

//	        var wall_info = global.walls_to_load_chunk[? wall_key];
//	        var wall = instance_create_layer(wall_info[? "x"], wall_info[? "y"], layer, obj_cellWall);
//	        wall.buildingHealth = wall_info[? "buildingHealth"];

//	        walls_processed++;
//	    }

//	    // Clean up the list if it's empty
//	    if (ds_list_size(global.walls_to_load) == 0) {
//	        ds_list_destroy(global.walls_to_load);
//	        global.walls_to_load = undefined;
//	        global.walls_to_load_chunk = undefined;
//	    }
//	}
//}

//function process_walls_to_unload() {
//	if (!is_undefined(global.walls_to_unload)) {
//	    var walls_processed = 0;
//		//change the line below to process more or less walls per frame
//	    while (walls_processed < 60 && ds_list_size(global.walls_to_unload) > 0) {
//	        var wall_key = ds_list_find_value(global.walls_to_unload, 0);
//	        ds_list_delete(global.walls_to_unload, 0);

//	        var wall = instance_find(obj_cellWall, wall_key);
//	        if (instance_exists(wall)) {
//	            instance_destroy(wall);
//	        }

//	        walls_processed++;
//	    }

//	    // Clean up the list if it's empty
//	    if (ds_list_size(global.walls_to_unload) == 0) {
//	        ds_list_destroy(global.walls_to_unload);
//	        global.walls_to_unload = undefined;
//	        global.walls_to_unload_chunk = undefined;
//	    }
//	}
//}