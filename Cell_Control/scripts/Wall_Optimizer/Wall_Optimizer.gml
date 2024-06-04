/// @description Activate all wall objects in a specific chunk
/// @param chunkX The X index of the chunk
/// @param chunkY The Y index of the chunk

function activate_chunk(chunkX, chunkY) {
    if (chunkX >= 0 && chunkX < array_length(global.chunk_data) &&
        chunkY >= 0 && chunkY < array_length(global.chunk_data[0])) {
        
        var chunkList = global.chunk_data[chunkX][chunkY];
        var listSize = ds_list_size(chunkList);
        for (var i = 0; i < listSize; i++) {
            var wall_id = ds_list_find_value(chunkList, i);
            if (instance_exists(wall_id)) {
                with (wall_id) {
                    instance_activate_object(wall_id);
                }
            }
        }
    }
}

/// @description Deactivate all wall objects in a specific chunk
/// @param chunkX The X index of the chunk
/// @param chunkY The Y index of the chunk

function deactivate_chunk(chunkX, chunkY) {
    if (chunkX >= 0 && chunkX < array_length(global.chunk_data) &&
        chunkY >= 0 && chunkY < array_length(global.chunk_data[0])) {
        
        var chunkList = global.chunk_data[chunkX][chunkY];
        var listSize = ds_list_size(chunkList);
        for (var i = 0; i < listSize; i++) {
            var wall_id = ds_list_find_value(chunkList, i);
            if (instance_exists(wall_id)) {
                with (wall_id) {
                    instance_deactivate_object(wall_id);
                }
            }
        }
    }
}

//Toggle activation of a chunk based on its position
/// @param x The chunk X position
/// @param y The chunk Y position
/// @param activate Whether to activate (true) or deactivate (false) the chunk
function toggle_chunk(_x, _y, activate) {
    var chunkX = _x; //div global.chunk_size;
    var chunkY = _y; //div global.chunk_size;
    if (activate) {
        activate_chunk(chunkX, chunkY);
    } else {
        deactivate_chunk(chunkX, chunkY);
    }
}

function deactivate_all_chunks() {
	for (var _x = 0; _x < array_length(global.chunk_data); _x++) {
		for (var _y = 0; _y < array_length(global.chunk_data[0]); _y++) {
			toggle_chunk(_x,_y,false);
		}
	}
}

function activate_visible_chunks() {
	var chunkSize = global.chunk_size;

	// Get the view position and size
	var viewX = camera_get_view_x(view_camera[0]);
	var viewY = camera_get_view_y(view_camera[0]);
	var viewWidth = camera_get_view_width(view_camera[0]);
	var viewHeight = camera_get_view_height(view_camera[0]);

	// Calculate the range of chunks that are currently visible
	var startChunkX = max(0, (viewX div (chunkSize * 8)));
	var endChunkX = min(array_length(global.chunk_data) - 1, ((viewX + viewWidth) div (chunkSize * 8)));
	var startChunkY = max(0, (viewY div (chunkSize * 8)));
	var endChunkY = min(array_length(global.chunk_data[0]) - 1, ((viewY + viewHeight) div (chunkSize * 8)));

	// Activate on-screen chunks and deactivate off-screen chunks
	for (var cx = 0; cx < array_length(global.chunk_data); cx++) {
	    for (var cy = 0; cy < array_length(global.chunk_data[0]); cy++) {
	        if (cx >= startChunkX && cx <= endChunkX && cy >= startChunkY && cy <= endChunkY) {
	            // The chunk is within the view range, activate it
	            activate_chunk(cx, cy);
	        } else {
	            // The chunk is outside the view range, deactivate it
	            deactivate_chunk(cx, cy);
	        }
	    }
	}
}