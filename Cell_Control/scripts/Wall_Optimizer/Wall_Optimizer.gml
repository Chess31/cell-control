function initialize_chunks() {
	// Initialize the chunk system and store walls by chunk
	global.chunk_size = 256; //256 with a range of 1 works (committing this)
	global.wall_chunks = ds_map_create();

	with (obj_cellWall) {
	    var chunk_key = get_chunk_coords(x, y);

	    if (!ds_map_exists(global.wall_chunks, chunk_key)) {
	        var new_chunk = ds_map_create();
	        ds_map_add(global.wall_chunks, chunk_key, new_chunk);
	    } else {
	        var new_chunk = global.wall_chunks[? chunk_key];
	    }

	    var wall_info = ds_map_create();
	    ds_map_add(wall_info, "x", x);
	    ds_map_add(wall_info, "y", y);
	    ds_map_add(wall_info, "buildingHealth", buildingHealth);

	    var wall_key = string(x) + "," + string(y);
	    ds_map_add(new_chunk, wall_key, wall_info);

	    instance_destroy(id); // Remove the wall instance from the game
	}
}

function get_chunk_coords() {
	// Arguments: x, y
	var _x = argument0;
	var _y = argument1;

	var chunk_x = floor(_x / global.chunk_size);
	var chunk_y = floor(_y / global.chunk_size);

	return string(chunk_x) + "," + string(chunk_y);
}

function load_chunk_walls() {
	// Arguments: chunk_x, chunk_y
	var chunk_x = argument0;
	var chunk_y = argument1;
	var chunk_key = string(chunk_x) + "," + string(chunk_y);

	if (ds_map_exists(global.wall_chunks, chunk_key)) {
	    var chunk = global.wall_chunks[? chunk_key];

	    // Create a list of keys
	    var keys = ds_map_keys(chunk);
	    for (var i = 0; i < ds_list_size(keys); i++) {
	        var wall_key = ds_list_find_value(keys, i);
	        var wall_info = chunk[? wall_key];

	        var wall = instance_create_layer(wall_info[? "x"], wall_info[? "y"], layer, obj_cellWall);
	        wall.buildingHealth = wall_info[? "buildingHealth"];
	    }

	    // Clean up
	    ds_list_destroy(keys);
	    ds_map_delete(global.wall_chunks, chunk_key);
	    ds_map_destroy(chunk);
	}
}

// Helper function to get keys of a ds_map
function ds_map_keys(map) {
    var keys = ds_list_create();
    var key = ds_map_find_first(map);

    while (key != undefined) {
        ds_list_add(keys, key);
        key = ds_map_find_next(map, key);
    }

    return keys;
}

function unload_chunk_walls() {
	// Arguments: chunk_x, chunk_y
	var chunk_x = argument0;
	var chunk_y = argument1;
	var chunk_key = string(chunk_x) + "," + string(chunk_y);

	var chunk = ds_map_create();

	with (obj_cellWall) {
	    var wall_chunk_x = floor(x / global.chunk_size);
	    var wall_chunk_y = floor(y / global.chunk_size);

	    if (wall_chunk_x == chunk_x && wall_chunk_y == chunk_y) {
	        var wall_info = ds_map_create();
	        ds_map_add(wall_info, "x", x);
	        ds_map_add(wall_info, "y", y);
	        ds_map_add(wall_info, "buildingHealth", buildingHealth);

	        var wall_key = string(x) + "," + string(y);
	        ds_map_add(chunk, wall_key, wall_info);

	        instance_destroy(id);
	    }
	}

	ds_map_add(global.wall_chunks, chunk_key, chunk);
}